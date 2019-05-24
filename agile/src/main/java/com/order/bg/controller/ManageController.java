package com.order.bg.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.order.entity.Dish;
import com.order.entity.Employee;
import com.order.entity.Img;
import com.order.entity.Order;
import com.order.entity.OrderDetail;
import com.order.entity.OrderDish;
import com.order.entity.Page;
import com.order.entity.RotationChart;
import com.order.service.DishService;
import com.order.service.EmployeeService;
import com.order.service.ImgService;
import com.order.service.OrderDishService;
import com.order.service.OrderService;
import com.order.service.RotationChartService;

@Controller
@RequestMapping(value="/background/manage")
public class ManageController {

	private final EmployeeService employeeService;
	private final DishService dishService;
	private final ImgService imgService;
	private final OrderService orderService;
	private final OrderDishService orderDishService;
	private final RotationChartService rotationChartService;

	@Autowired
	public ManageController(EmployeeService employeeService,
			DishService dishService,
			ImgService imgService,
			OrderService orderService,
			OrderDishService orderDishService,
			RotationChartService rotationChartService) 
	{
		this.employeeService = employeeService;
		this.dishService=dishService;
		this.imgService=imgService;
		this.orderService=orderService;
		this.orderDishService=orderDishService;
		this.rotationChartService=rotationChartService;
	}
	
//----login/logout start------------------------------------------------------------------------------------------------------

	//拦截器用的登录方法,已经设置拦截器
	@RequestMapping(value = "/employeelogin.action", method = RequestMethod.GET)
	public String employeeLogin(Model model) {
		
		model.addAttribute("msg", "请先登录！");
		return "background/login";
		
	}
	
	//登录时调用该方法
	@RequestMapping(value = "/employeelogin.action", method = RequestMethod.POST)
	public String employeeLogin(String account,String password,HttpSession session,Model model) {
		
		Employee employee = employeeService.login(account, password);
		
		if(employee != null) {
			
			session.setAttribute("employee", employee);
			return "redirect:/background/main.jsp";
			
		}else {
			
			model.addAttribute("msg", "账号或密码错误！");
			return "background/login";
		}
	}
	
	//退出时使session失效,返回数据提示退出成功
	@RequestMapping(value = "/employeelogout.action", method = RequestMethod.GET)
	public String employeeLogout(HttpSession session,Model model) {
		
		session.invalidate();
		model.addAttribute("msg","退出成功！");
		return "background/login";
		
	}
	
//----login/logout end------------------------------------------------------------------------------------------------------
	
	
//----add start------------------------------------------------------------------------------------------------------

	//请求添加菜品
	@RequestMapping(value = "/adddish.action", method = RequestMethod.GET)
	public String dishAdd() {
		
		return "/background/adddish";
	
	}
	
	//添加菜品，出错时提示信息,使用pojo接收输入信息时出错的情况无法提示
	//注意：保存的图片在tomcat的webapp文件下的已发布的项目下，不在自己的项目文件下
	//当上传项目文件到github时需要手动将文件拷贝到项目文件对应的地方，不然不能同步菜品图片到github上，不同步不会影响程序运行
	@RequestMapping(value = "/adddish.action", method = RequestMethod.POST)
	public String dishAdd( String name,String category,String leftnum,String price,String description,MultipartFile img,HttpSession session,Model model) {
		
		Dish dish=new Dish();
		Img imgRecord=new Img();
		try {
			
			//重要：存的图片在tomcat的已发布的webapp目录的项目文件下，不在自己的项目文件中，
			//当上传项目文件到github时需要手动将文件拷贝到项目文件对应的地方，不然不能同步菜品图片到github上。
			String oldName=img.getOriginalFilename();
			String newName=System.currentTimeMillis()+oldName.substring(oldName.lastIndexOf('.'));
			System.out.println(session.getServletContext().getRealPath("/background/dish_upload_img")+"\\"+newName);
			
			//保存图片在本地
			img.transferTo(new File(session.getServletContext().getRealPath("/background/dish_upload_img")+"\\"+newName));
			imgRecord.setImgUrl("/background/dish_upload_img/"+newName);
			imgRecord.setDescription("待定");
			
			int status=imgService.insertSelective(imgRecord);
			
			dish.setName(name);
			dish.setDescription(description);
			dish.setCategoryId(Integer.parseInt(category));
			dish.setLeftNum(Integer.parseInt(leftnum));
			dish.setPrice(Float.parseFloat(price));
			dish.setDishImg(imgRecord.getImgId());
			dish.setImg(imgRecord);
			
			status+=dishService.insert(dish);
			
			if(status==2) 	
				model.addAttribute("msg","添加成功！");
			else 
				model.addAttribute("msg","添加添加失败！");
		}catch(IndexOutOfBoundsException e) {
			
			model.addAttribute("msg","请添加菜品图片！");
			return "/background/adddish";
			
		}catch(IOException e) {
			
			model.addAttribute("msg","图片保存失败！");
			return "/background/adddish";
			
		}catch(Exception e) {
			
			model.addAttribute("msg","请输入正确的菜品信息！");
			return "/background/adddish";
		}
		return "/background/adddish";
		
	}
	
//----add end------------------------------------------------------------------------------------------------------
	
//----delete start------------------------------------------------------------------------------------------------------

	//删除菜品信息,Ajax异步提交数据
	@RequestMapping(value = "/deletedish.action",method = RequestMethod.GET)
	public void dishDelete(Integer id,HttpServletResponse response) {

        try {
        	  imgService.deleteByPrimaryKey(dishService.selectByPrimaryKey(id).getDishImg());
			  int status=dishService.deleteByPrimaryKey(id);
			  response.setContentType("text/html;charset=UTF-8"); 
			  if(status==1)   response.getWriter().println("{\"status\":\"true\"}"); 
			  else   response.getWriter().println("{\"status\":\"false\"}");
			  
		} catch (IOException e) {
			e.printStackTrace();
		}  
        System.out.println(id);
	}
	
//----delete end------------------------------------------------------------------------------------------------------

	
//----update start------------------------------------------------------------------------------------------------------

	//更新菜品信息,Ajax异步提交数据,还不能修改图片
	@RequestMapping(value = "/updatedish.action",method = RequestMethod.POST)
	public void dishUpdate(Dish dish,HttpServletResponse response) {

        System.out.println(dish.getDishImg());
        try {
			  int status=dishService.updateByPrimaryKeySelective(dish);
			  response.setContentType("text/html;charset=UTF-8"); 
			  if(status==1)   response.getWriter().println("{\"status\":\"true\"}"); 
			  else   response.getWriter().println("{\"status\":\"false\"}");
			  
		} catch (IOException e) {
			e.printStackTrace();
		}  
        System.out.println(dish);
	}
	
//----update end------------------------------------------------------------------------------------------------------
	
//----query start------------------------------------------------------------------------------------------------------
	
	//查询所有菜品，返回list数据结构
	@RequestMapping(value = "/getdishes.action", method = RequestMethod.GET)
	public String getDishesByPage(Model model,Integer type,Integer page) {


		List<Dish> dishList;
		
		Page pageItem=new Page(dishService.countDish(null),page,10);

		if(type==2) pageItem.setPageSize(12);
		dishList=dishService.getAll(pageItem);
		System.out.println(dishList);
		
        model.addAttribute("dishList", dishList);
        model.addAttribute("pageItem", pageItem);
        
        switch(type){
        case 1:
    		return "/background/dishinfolist";
    		
        case 2:
            return "/background/editdish";
            
        default:
            return "/background/error";
        }
	}
	
	//根据ID查询菜品信息,Ajax异步获取数据
	@RequestMapping(value = "/querydish.action",method = RequestMethod.GET)
	public void getOneDish(Integer id,HttpServletResponse response) {

		System.out.println(id);
		Dish dish = dishService.selectByPrimaryKey(id);
		
        try {
        	
        	response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println(dish); 
            
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
        
        System.out.println(dish);
	}
	
	//按条件查询订单历史
	@RequestMapping(value = "/queryorder.action",method = RequestMethod.GET)
	public String getAllOrders(Model model,String type,HttpServletResponse response) {
		

		List<Order> list=orderService.selectAll();
		Page pageItem=new Page(list.size(),1,10);
		switch(type) {
		
		case "all":
			
			model.addAttribute("list", list);
			model.addAttribute("pageItem", pageItem);
			break;
			
		case "time":
			
			List<Order> list2=new ArrayList<Order>();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String time=sdf.format(new Date()); 
			System.out.println(time);
			for(Order order: list) {
				if(time.equals(sdf.format(order.getCreateTime()))) list2.add(order);
			}
			
			pageItem.setTotalRecord(list2.size());
			model.addAttribute("list", list2);
			model.addAttribute("pageItem", pageItem);
			break;
		}
		
        return "/background/orderlist";
	}
	
	//按id查询订单历史
	@RequestMapping(value = "/ordersearch.action",method = RequestMethod.POST)
	public String getOrderById(String orderId,Model model) {
		
		Order order=orderService.selectByPrimaryKey(orderId);
		
		List<Order> list=new ArrayList<Order>();
		list.add(order);
		Page pageItem=new Page(list.size(),1,10);
		model.addAttribute("list", list);
		model.addAttribute("pageItem", pageItem);
		
        return "/background/orderlist";
	}
	
	//查询订单详细信息
	@RequestMapping(value = "/orderdetail.action",method = RequestMethod.GET)
	public void getOrderDetail(String id,HttpServletResponse response) {
		
		List<OrderDish> orderDishList=orderDishService.selectByOrderId(id);
		List<OrderDetail> orderDetailList=new ArrayList<>();
		
		for(OrderDish orderDish:orderDishList) {
			
			Dish dish=dishService.selectByPrimaryKey(orderDish.getDishId());
			
			OrderDetail orderDetail=new OrderDetail();
			orderDetail.setName(dish.getName());
			orderDetail.setNumber(orderDish.getDishNum());
			orderDetail.setSinglePrice(dish.getPrice());
			orderDetailList.add(orderDetail);
		}
	
		try {
        	
        	response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println(orderDetailList); 
            
		} catch (IOException e) {
			
			e.printStackTrace();
		}  
		System.out.println(orderDetailList);
	}
	
	
//----query end------------------------------------------------------------------------------------------------------
	
//----web manage start------------------------------------------------------------------------------------------------------
	
	//请求更新轮播图
	@RequestMapping(value = "/rotation_update.action", method = RequestMethod.GET)
	public String showRotation(Model model) {
		
		List<RotationChart> list = rotationChartService.selectAll();
		
		model.addAttribute("list", list);
		return "/background/rotation_update";
	
	}
		
//	//更新轮播图，出错时提示信息,还未完成
//	//注意：保存的图片在tomcat的webapp文件下的已发布的项目下，不在自己的项目文件下
//	//当上传项目文件到github时需要手动将文件拷贝到项目文件对应的地方，不然不能同步轮播图片到github上，不同步不会影响程序运行
//	@RequestMapping(value = "/rotation_update.action", method = RequestMethod.POST)
//	public String updateRotation( MultipartFile img,HttpSession session,Model model) {
//		
//		RotationChart rotationChart = new RotationChart();
//		try {
//			
//			//重要：存的图片在tomcat的已发布的webapp目录的项目文件下，不在自己的项目文件中，
//			//当上传项目文件到github时需要手动将文件拷贝到项目文件对应的地方，不然不能同步轮播图片到github上。
//			String oldName=img.getOriginalFilename();
//			String newName=System.currentTimeMillis()+oldName.substring(oldName.lastIndexOf('.'));
//			System.out.println(session.getServletContext().getRealPath("/background/dish_upload_img")+"\\"+newName);
//			
//			//保存图片在本地
//			img.transferTo(new File(session.getServletContext().getRealPath("/background/dish_upload_img")+"\\"+newName));
//			imgRecord.setImgUrl("/background/dish_upload_img/"+newName);
//			imgRecord.setDescription("待定");
//			
//			int status=imgService.insertSelective(imgRecord);
//			
//			dish.setName(name);
//			dish.setDescription(description);
//			dish.setCategoryId(Integer.parseInt(category));
//			dish.setLeftNum(Integer.parseInt(leftnum));
//			dish.setPrice(Float.parseFloat(price));
//			dish.setDishImg(imgRecord.getImgId());
//			dish.setImg(imgRecord);
//			
//			status+=dishService.insert(dish);
//			
//			if(status==2) 	
//				model.addAttribute("msg","添加成功！");
//			else 
//				model.addAttribute("msg","添加添加失败！");
//		}catch(IndexOutOfBoundsException e) {
//			
//			model.addAttribute("msg","请添加菜品图片！");
//			return "/background/adddish";
//			
//		}catch(IOException e) {
//			
//			model.addAttribute("msg","图片保存失败！");
//			return "/background/adddish";
//			
//		}catch(Exception e) {
//			
//			model.addAttribute("msg","请输入正确的菜品信息！");
//			return "/background/adddish";
//		}
//		return "/background/rotation_update";
//		
//	}
	
//----web manage end------------------------------------------------------------------------------------------------------
	
}

package com.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.entity.Dish;
import com.order.entity.Employee;
import com.order.service.DishService;
import com.order.service.EmployeeService;

@Controller
@RequestMapping(value="/background/manage")
public class ManageController {

	private final EmployeeService employeeService;
	private final DishService dishService;

	@Autowired
	public ManageController(EmployeeService employeeService,DishService dishService) {
		this.employeeService = employeeService;
		this.dishService=dishService;
	}

	//拦截器用的方法
	@RequestMapping(value = "/employeelogin.action", method = RequestMethod.GET)
	public String employeeLogin(Model model) {
		
		model.addAttribute("msg", "请先登录！");
		return "background/login";
		
	}
	
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
	
	@RequestMapping(value = "/alldishes.action", method = RequestMethod.GET)
	public String getAllDishes(Model model) {
		
		List<Dish> dishList = dishService.getAll();
		
        model.addAttribute("dishList", dishList);
        model.addAttribute("pagecount", dishList.size()/10);
        
		return "/background/dishinfolist";
		
	}
	
	@RequestMapping(value = "/adddish.action", method = RequestMethod.POST)
	public String addDish(String name,String category,String leftnum,String price,String description,HttpSession session,Model model) {
		
		Dish dish=new Dish();
		
		dish.setName(name);
		dish.setDescription(description);
		
		try {
			dish.setCategoryId(Integer.parseInt(category));
			dish.setLeftNum(Integer.parseInt(leftnum));
			dish.setPrice(Float.parseFloat(price));
			int status=dishService.insert(dish);
			
			if(status==1) 	
				model.addAttribute("msg","添加成功！");
			else 
				model.addAttribute("msg","添加添加失败！");
		}catch(Exception e) {
			
			model.addAttribute("msg","请输入正确的数字格式！");
			return "/background/adddish";
		}
		return "/background/adddish";
		
	}
}

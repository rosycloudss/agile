package com.order.bg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.order.entity.DishCategory;
import com.order.entity.Employee;
import com.order.service.DishCategoryService;
import com.order.service.DishService;
import com.order.service.EmployeeService;
import com.order.util.SmsUtil;

@Controller
@RequestMapping(value="/background/feng")
public class FengController {

	private final EmployeeService employeeService;
	private final DishCategoryService dishCategoryService;

	@Autowired
	public FengController(EmployeeService employeeService,DishService dishService,DishCategoryService dishCategoryService) {
		this.employeeService = employeeService;
		this.dishCategoryService = dishCategoryService;
	}
	
	//获取所有菜单类别
	@RequestMapping(value = "/dishcategory_list.action", method = RequestMethod.GET)
	public String getAllDishCategory(Model model){
		List<DishCategory> dishCategoryList =dishCategoryService.getAll();
		model.addAttribute("dishCategoryList", dishCategoryList);
		return "/background/dishcategory_list";
	}
	
	//查询菜品类别
	@RequestMapping(value = "/dishcategory_search.action", method = RequestMethod.POST)
	public String getDishCategoryById(Model model,Integer categoryId){
		DishCategory dishCategory=dishCategoryService.selectByPrimaryKey(categoryId);
		List<DishCategory> dishCategoryList =new ArrayList<DishCategory>();
		dishCategoryList.add(dishCategory);
		model.addAttribute("dishCategoryList", dishCategoryList);
		return "/background/dishcategory_list";
	}
	
	//编辑菜品类别
	@RequestMapping(value = "/dishcategory_edit.action", method = RequestMethod.GET)
	public String getDishCategoryById(Model model,Integer categoryId, String type){
		
		DishCategory dishCategory=dishCategoryService.selectByPrimaryKey(categoryId);
		model.addAttribute("dishCategory", dishCategory);
		return "/background/dishcategory_edit";
	}
	
	//编辑菜品类别
	@RequestMapping(value = "/dishcategory_edit.action", method = RequestMethod.POST)
	public String editDishCategoryById(Model model,Integer categoryId, DishCategory dishCategory){
		
		System.out.println(dishCategory);
		if(dishCategory.getName().equals(null) || dishCategory.getDescription().equals(null)) {
			model.addAttribute("msg","名称或者描述不能为空！");
			return "/background/dishcategory_edit";
		}
		int status = dishCategoryService.updateByPrimaryKey(dishCategory);
		if(status ==1) model.addAttribute("msg", "修改成功！");
		else model.addAttribute("msg", "修改失败！");
		return "/background/dishcategory_edit";
	}
	
	//添加菜品类别
	@RequestMapping(value = "/dishcategory_add.action", method = RequestMethod.POST)
	public String addDishCategory(String name, String description,Model model) {
		DishCategory dishCategory = new DishCategory();
		if(name.equals(null) || description.equals(null)) {
			model.addAttribute("msg","名称或者描述不能为空！");
		}
		dishCategory.setName(name);
		dishCategory.setDescription(description);
		try {
			int status = dishCategoryService.insertSelective(dishCategory);
			if(status ==1)
				model.addAttribute("msg","添加成功！");
			else 
				model.addAttribute("msg","添加失败！");
		}catch(Exception e) {
			model.addAttribute("msg","请输入正确的格式！");
		}
		return "/background/dishcategory_add";
	}
	
	//删除菜品类别，通过id值
	@RequestMapping(value = "/dishcategory_delete.action", method = RequestMethod.GET)
	public String deleteDishCategory(Integer categoryId,Model model) {
		Integer status = dishCategoryService.deleteByPrimaryKey(categoryId);
		if(status == 1)
			model.addAttribute("msg","删除成功！");
		else 
			model.addAttribute("msg","删除失败！");
		model.addAttribute("dishCategoryList", dishCategoryService.getAll());
		
		return "/background/dishcategory_list";
	}
	
	//修改个人信息
	@RequestMapping(value = "/updateEmployeeInfo.action", method = RequestMethod.POST)
	public String updateEmployeeInfo(Model model,String account,String phone,String name,Integer employeeId) {
		Employee employee = new Employee();
		employee.setAccount(account);
		employee.setPhone(phone);
		employee.setName(name);
		employee.setEmployeeId(employeeId);
		int status = employeeService.updateByPrimaryKeySelective(employee);
		if(status != 0)
			model.addAttribute("msg","修改成功");
		else 
			model.addAttribute("msg","修改失败");
		return  "/background/updateEmployeeInfo";
	}
	
	//查找个人信息  获取的信息queryemployee
	@RequestMapping(value = "/queryEmployeeInfo.action", method = RequestMethod.GET)
    public String queryEmployeeInfo(Model model,String account) {
		Employee queryemployee = employeeService.selectByAccount("1759840027");	
		if(!queryemployee.getAccount() .equals("null"))
			model.addAttribute("queryemployeeaccount",queryemployee.getAccount());
		if(!queryemployee.getEmployeeId() .equals("null"))
			model.addAttribute("queryemployeeaccount",queryemployee.getEmployeeId());
		if(!queryemployee.getAccount() .equals("null"))
			model.addAttribute("queryemployeeaccount",queryemployee.getAccount());
		model.addAttribute("queryemployee",queryemployee);
		return  "/background/updateEmployeeInfo";
	 }	
	
	//后台请求
	@RequestMapping(value = "/updatepwd.action", method = RequestMethod.GET)
	public String updatePassword() {
		
		return  "/background/updateEmployeepasswd";
	}
	
	//修改后台密码
	@RequestMapping(value = "/updatepwd.action", method = RequestMethod.POST)
	public String updatePassword(Model model,String pwd,HttpSession session) {
		
		Employee employee = (Employee) session.getAttribute("employee");
		
		System.out.println(pwd);
		employee.setPwd(pwd);
		int status = employeeService.updateByPrimaryKeySelective(employee);
		if(status != 0)
			model.addAttribute("msg","修改成功");
		else 
			model.addAttribute("msg","修改失败");
		
		return  "/background/updateEmployeepasswd";
	}
	
	//用于发送验证码验证信息,暂时用的李凯建的手机号
	@RequestMapping(value = "/sendVcode.action", method = RequestMethod.GET)
	public String sendVcode(Model model,String account,HttpSession session) throws ClientException {
		SmsUtil util = new SmsUtil();
		util.setNewcode();
		String code = util.getNewcode();
//		Employee em=(Employee)session.getAttribute("employee");
		SendSmsResponse sendSms = SmsUtil.sendSms("17803900062",code);
		String status = sendSms.getCode();
		System.out.println(code+"+++"+status+"qqqq");
		if(status.equals("OK")) {
		session.setAttribute("code", code);
		model.addAttribute("msg","验证码发送成功，有效时间一分钟");
		}
		else
		model.addAttribute("msg","验证码发送成失败，请重新尝试");
		return "/background/updateEmployeepasswd";
	}
	
	@RequestMapping(value = "/defineCode.action", method = RequestMethod.POST)
    public String defineCode(Model model,HttpSession session,String vcode,String newPasswd,String account) {
    	String CODE = (String) session.getAttribute("code");
		System.out.println( vcode+"c"+CODE);
    	Employee employee =(Employee) session.getAttribute("employee");
    	if(CODE.equals(vcode)) {
    		employee.setPwd(newPasswd);
    		int status = employeeService.updateByPrimaryKeySelective(employee);
			if(status != 0)
				model.addAttribute("msg","修改成功");
			else 
				model.addAttribute("msg","修改失败");
    	}
    	return "/background/updateEmployeepasswd"; }
		
}

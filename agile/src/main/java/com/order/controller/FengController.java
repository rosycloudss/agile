package com.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.entity.DishCategory;
import com.order.entity.Employee;
import com.order.service.DishCategoryService;
import com.order.service.DishService;
import com.order.service.EmployeeService;

@Controller
@RequestMapping(value="/background/feng")
public class FengController {

	private final EmployeeService employeeService;
	private final DishService dishService;
	private final DishCategoryService dishCategoryService;

	@Autowired
	public FengController(EmployeeService employeeService,DishService dishService,DishCategoryService dishCategoryService) {
		this.employeeService = employeeService;
		this.dishService=dishService;
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
				return "/background/dishcategory_add";
			}
			return "/background/dishcategory_list";
		}
		
		//删除菜品类别，通过id值
		@RequestMapping(value = "/dishcategory_delete.action", method = RequestMethod.GET)
		public String deleteDishCategory(Integer categoryId,Model model) {
			Integer status = dishCategoryService.deleteByPrimaryKey(categoryId);
			if(status == 1)
				model.addAttribute("msg","删除成功！");
			else 
				model.addAttribute("msg","删除失败！");
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
			String pwd;
			String phone;
			String name;
			if(!queryemployee.getAccount() .equals("null"))
				model.addAttribute("queryemployeeaccount",queryemployee.getAccount());
			if(!queryemployee.getEmployeeId() .equals("null"))
				model.addAttribute("queryemployeeaccount",queryemployee.getEmployeeId());
			if(!queryemployee.getAccount() .equals("null"))
				model.addAttribute("queryemployeeaccount",queryemployee.getAccount());
			model.addAttribute("queryemployee",queryemployee);
			return  "/background/updateEmployeeInfo";
		 }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}

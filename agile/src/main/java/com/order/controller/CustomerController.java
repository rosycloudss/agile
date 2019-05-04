package com.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.entity.Customer;
import com.order.service.CustomerService;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 
 * @author muwei
 * @date 2019/4/25
 *
 */
@Controller
@RequestMapping(value="/foreground/customer")
public class CustomerController{

	private final CustomerService customerService;
	
	@Autowired
	public CustomerController(CustomerService customerService) {
		this.customerService = customerService;
	}

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String account,String password,HttpSession session,Model model) {
//		System.out.println(account + "====" + password);
		Customer customer = customerService.login(account, password);
		if(customer != null) {
			session.setAttribute("customer", customer);
			return "redirect:/foreground/home.jsp";
		}else {
			model.addAttribute("msg", "账号或密码错误！");
			return "foreground/login";
		}
		
	}


	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(@RequestParam("account") String account,
						   @RequestParam("password") String password, Model model) {
		boolean success = customerService.register(account, password);
		if (success) {
			return "redirect:/foreground/login.jsp";
		} else {
			model.addAttribute("msg", "注册失败");
			return "/foreground/register";
		}
	}
	
	
}

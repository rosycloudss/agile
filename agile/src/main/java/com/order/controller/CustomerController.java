package com.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.order.entity.Customer;
import com.order.entity.CustomerAddress;
import com.order.service.CustomerAddressService;
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
	private final CustomerAddressService customerAddressService;
	
	@Autowired
	public CustomerController(CustomerService customerService,CustomerAddressService customerAddressService) {
		this.customerService = customerService;
		this.customerAddressService=customerAddressService;
	}

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String account,String password,HttpSession session,Model model) {
		Customer customer = customerService.login(account, password);
		if(customer != null) {
			session.setAttribute("customer", customer);
			return "redirect:/foreground/home.jsp";
		}else {
			model.addAttribute("msg", "账号或密码错误！");
			return "foreground/login";
		}
		
	}
	
	@RequestMapping("logout.action")
	public String logout(HttpSession session) {
		session.removeAttribute("customer");
		return "foreground/login";
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
	@RequestMapping(value="insertAddress.action",method=RequestMethod.POST)
	public String insertAddress(@RequestParam("addressId") int addressId,
			                    @RequestParam("customerId") int customerId,
			                    @RequestParam("address") String address,
			                    @RequestParam("phone") String phone,
			                    @RequestParam("recevierName") String recevierName,Model model) {
		CustomerAddress customerAddress=new CustomerAddress();
		customerAddress.setAddress(address);
		customerAddress.setCustomerId(customerId);
		customerAddress.setRecevierName(recevierName);
		customerAddress.setAddressId(addressId);
		int success=customerAddressService.insert(customerAddress);
		if(success==1) {
			model.addAttribute("msg","添加成功");
			return "redirect:/foreground/address.jsp";
		}else {
			model.addAttribute("msg","添加失败");
			return "/foreground/address";
		}	
	}
	
	@RequestMapping(value="getAddressByCistomerId.action",method=RequestMethod.POST)
	public String getAddressByCustomerId(@RequestParam("customerId") int customerId,Model model) {
		List<CustomerAddress> addressList=customerAddressService.getAddressByCustomerId(customerId);
		model.addAttribute("list",addressList);
		if(addressList.size()!=0) {
			return "redirect:/foreground/personalCenter.jsp";
		}else {
			model.addAttribute("msg","地址查询失败");
			return "/foreground/personalCenter";
		}	
	}
}

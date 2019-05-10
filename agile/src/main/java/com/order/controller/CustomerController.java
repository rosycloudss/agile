package com.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.order.entity.Customer;
import com.order.entity.CustomerAddress;
import com.order.service.CustomerAddressService;
import com.order.service.CustomerService;

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

	/**
	 * 客户登录
	 * @param account 登录账号
	 * @param password 密码
	 * @param session
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.action")
	public String logout(HttpSession session) {
		session.removeAttribute("customer");
		return "foreground/login";
	}
	
	/**
	 * 顾客注册
	 * @param account 注册使用的账号 一般为电话号码
	 * @param password 密码
	 * @param model
	 * @return
	 */
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
	
	@ResponseBody
	@RequestMapping(value = "/phoneIsExist")
	public Integer phoneIsExist(@RequestParam("account") String account) {
		List<Customer> customerList = new ArrayList<Customer>();
		if(account != null) {
			customerList = customerService.getByPhone(account);
		}
		return customerList.size();
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
	/*
	 * 添加地址
	 */
	@RequestMapping(value="insertAddress.action",method=RequestMethod.POST)
	public String insertAddress(@RequestParam("addressId") int addressId,
			                    @RequestParam("customerId") int customerId,
			                    @RequestParam("address") String address,
			                    @RequestParam("phone") String phone,
			                    @RequestParam("recevierName") String recevierName) {
		CustomerAddress customerAddress=new CustomerAddress();
		customerAddress.setAddress(address);
		customerAddress.setCustomerId(customerId);
		customerAddress.setRecevierName(recevierName);
		customerAddress.setPhone(phone);
		customerAddress.setAddressId(addressId);
		customerAddressService.insert(customerAddress);
		return "foreground/address";
	}
	/*
	 * 获取地址
	 */
	@RequestMapping(value="getAddressByCustomerId.action",method=RequestMethod.GET)
	public String getAddressByCustomerId(HttpSession session,Model model,HttpRequest request) {
		
		List<CustomerAddress> addressList=customerAddressService.getAddressByCustomerId
				              (((Customer)(session.getAttribute("customer"))).getCustomerId());
		
		model.addAttribute("addressList",addressList);
		return "foreground/personalCenter";
	}
	/*
	 * 删除地址
	 */
	@RequestMapping(value="delAddressByaddressId.action",method=RequestMethod.GET)
	public String delAddressByaddressId(@RequestParam("addressId") int addressId,HttpSession session,HttpRequest request,Model model) {
		customerAddressService.deleteByPrimaryKey(addressId);
		
		List<CustomerAddress> addressList=customerAddressService.getAddressByCustomerId
	              (((Customer)(session.getAttribute("customer"))).getCustomerId());

		model.addAttribute("addressList",addressList);
		
		return "foreground/personalCenter";
	}
	/*
	 * 修改密码
	 */
	@RequestMapping(value="updatePassword.action",method=RequestMethod.POST)
	public String updatePassword(@RequestParam("oldPassword") String oldPassword,
			                    @RequestParam("newPassword") String newPassword,
			                    @RequestParam("repeatPassword") String repeatPassword,
			                    Model model,HttpSession session) {
		int temp=((Customer)(session.getAttribute("customer"))).getCustomerId();
		Customer customer=customerService.selectByCustomerIdAndPwd(temp, oldPassword);
		if(customer==null) {
			model.addAttribute("msg","旧密码错误");
			return "foreground/password";
			
		}else if(!repeatPassword.equals(newPassword)) {
			model.addAttribute("msg","两次输入密码不一致");
			return "foreground/password";
		}
		customerService.updatePassword(newPassword, temp);
		return "foreground/password";
	}
}

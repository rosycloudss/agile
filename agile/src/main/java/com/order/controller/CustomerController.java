package com.order.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.order.entity.*;
import com.order.service.CustomerAddressService;
import com.order.service.CustomerService;
import com.order.service.ImgService;

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
	private final ImgService imgService;
	@Autowired
	public CustomerController(CustomerService customerService,CustomerAddressService customerAddressService,ImgService imgService) {
		this.customerService = customerService;
		this.customerAddressService=customerAddressService;
		this.imgService=imgService;
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
		System.out.println(account + "====" + password);
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
	/*
	 * 添加地址
	 */
	@ResponseBody
	@RequestMapping("/insertAddress/{customerId}/{address}/{phone}/{recevierName}")
	public JSONObject insertAddress(@PathVariable("customerId") Integer customerId,
			                        @PathVariable("address") String address,
			                        @PathVariable("phone") String phone,
			                        @PathVariable("recevierName") String recevierName) {
		JSONObject jsonObject=new JSONObject();
		CustomerAddress customerAddress=new CustomerAddress();
		customerAddress.setPhone(phone);
		customerAddress.setAddress(address);
		customerAddress.setCustomerId(customerId);
		customerAddress.setRecevierName(recevierName);
	    int result=customerAddressService.insert(customerAddress);
	    jsonObject.put("result", result);
	    return jsonObject;
	}
	
	/*
	 * 获取地址
	 */
	@RequestMapping(value="getAddressByCustomerId.action",method=RequestMethod.GET)
	public String getAddressByCustomerId(HttpSession session,Model model,HttpRequest request) {
		List<CustomerAddress> addressList=customerAddressService.getAddressByCustomerId
				              (((Customer)(session.getAttribute("customer"))).getCustomerId());
		Customer customer=customerService.selectByPrimaryKey(((Customer)(session.getAttribute("customer"))).getCustomerId());
		model.addAttribute("addressList",addressList);
		model.addAttribute("customer",customer);
		
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
	@ResponseBody
	@RequestMapping("/updatePassword/{oldPassword}/{newPassword}/{repeatPassword}")
	public JSONObject updatePassword(@PathVariable("oldPassword") String oldPassword,
			@PathVariable("newPassword") String newPassword,
			@PathVariable("repeatPassword") String repeatPassword,HttpSession session) {
		JSONObject jsonObject=new JSONObject();
		int temp=((Customer)(session.getAttribute("customer"))).getCustomerId();
		Customer customer=customerService.selectByCustomerIdAndPwd(temp, oldPassword);
		if(customer==null) {
			jsonObject.put("msg1","旧密码错误");
		}else if(!newPassword.equals(repeatPassword)) {
			jsonObject.put("msg2","两次输入密码不一致");
		}else{
			int result=customerService.updatePassword(newPassword, temp);
		    jsonObject.put("result", result);
		}
		return jsonObject;
	}
	@ResponseBody
	@RequestMapping("/updatePhone/{customerId}/{phone}")
	public JSONObject updatePhone(@PathVariable("customerId") Integer customerId,
			                      @PathVariable("phone") String phone) {
		JSONObject jsonObject = new JSONObject();
		int result=customerService.updatePhone(phone,customerId);
		jsonObject.put("result", result);
		return jsonObject;
	}
}

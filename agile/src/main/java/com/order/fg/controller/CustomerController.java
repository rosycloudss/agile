package com.order.fg.controller;

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
import com.order.service.DishService;
import com.order.service.ImgService;
import com.order.service.OrderDishService;
import com.order.service.OrderService;

/**
 * 
 * @author muwei
 * @date 2019/4/25
 *
 */
@Controller
@RequestMapping(value = "/foreground/customer")
public class CustomerController {

	private final CustomerService customerService;
	private final CustomerAddressService customerAddressService;
	private final ImgService imgService;
	private final OrderService orderService;
	private final OrderDishService orderDishService;
	private final DishService dishService;

	@Autowired
	public CustomerController(CustomerService customerService, CustomerAddressService customerAddressService,
			ImgService imgService, OrderService orderService, OrderDishService orderDishService,
			DishService dishService) {
		this.customerService = customerService;
		this.customerAddressService = customerAddressService;
		this.imgService = imgService;
		this.orderService = orderService;
		this.orderDishService = orderDishService;
		this.dishService = dishService;
	}

	/**
	 * 客户登录
	 * 
	 * @param account  登录账号
	 * @param password 密码
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String account, String password, HttpSession session, Model model) {
		Customer customer = customerService.login(account, password);
		if (customer != null) {
			session.setAttribute("customer", customer);
			return "redirect:/foreground/home.jsp";
		} else {
			model.addAttribute("msg", "账号或密码错误！");
			return "foreground/login";
		}

	}

	/**
	 * 退出登录
	 * 
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
	 * 
	 * @param account  注册使用的账号 一般为电话号码
	 * @param password 密码
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(@RequestParam("account") String account, @RequestParam("password") String password,
			Model model) {
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
		if (account != null) {
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
			@PathVariable("address") String address, @PathVariable("phone") String phone,
			@PathVariable("recevierName") String recevierName) {
		JSONObject jsonObject = new JSONObject();
		CustomerAddress customerAddress = new CustomerAddress();
		customerAddress.setPhone(phone);
		customerAddress.setAddress(address);
		customerAddress.setCustomerId(customerId);
		customerAddress.setRecevierName(recevierName);
		int result = customerAddressService.insert(customerAddress);
		jsonObject.put("result", result);
		return jsonObject;
	}

	/*
	 * 获取地址
	 */
	@RequestMapping(value = "getAddressByCustomerId.action", method = RequestMethod.GET)
	public String getAddressByCustomerId(HttpSession session, Model model) {
		int customerId = ((Customer) (session.getAttribute("customer"))).getCustomerId();
		List<CustomerAddress> addressList = customerAddressService.getAddressByCustomerId(customerId);
		Customer customer = customerService
				.selectByPrimaryKey(((Customer) (session.getAttribute("customer"))).getCustomerId());
		model.addAttribute("addressList", addressList);
		model.addAttribute("customer", customer);

		List<Order> orderList = orderService.selectByCustomerId(customerId);
		model.addAttribute("orderList", orderList);

		return "foreground/personalCenter";
	}

	/*
	 * 删除订单
	 */
	@RequestMapping(value = "delOrderByorderId.action", method = RequestMethod.GET)
	public String delOrderByorderId(@RequestParam("orderId") String orderId, HttpSession session, Model model) {
		orderService.deleteByPrimaryKey(orderId);

		int customerId = ((Customer) (session.getAttribute("customer"))).getCustomerId();
		List<CustomerAddress> addressList = customerAddressService.getAddressByCustomerId(customerId);
		List<Order> orderList = orderService.selectByCustomerId(customerId);
		model.addAttribute("orderList", orderList);
		model.addAttribute("addressList", addressList);

		return "foreground/personalCenter";
	}

	/*
	 * 修改密码
	 */
	@ResponseBody
	@RequestMapping("/updatePassword/{oldPassword}/{newPassword}/{repeatPassword}")
	public JSONObject updatePassword(@PathVariable("oldPassword") String oldPassword,
			@PathVariable("newPassword") String newPassword, @PathVariable("repeatPassword") String repeatPassword,
			HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		int temp = ((Customer) (session.getAttribute("customer"))).getCustomerId();
		Customer customer = customerService.selectByCustomerIdAndPwd(temp, oldPassword);
		if (customer == null) {
			jsonObject.put("msg1", "旧密码错误");
		} else if (!newPassword.equals(repeatPassword)) {
			jsonObject.put("msg2", "两次输入密码不一致");
		} else {
			int result = customerService.updatePassword(newPassword, temp);
			jsonObject.put("result", result);
		}
		return jsonObject;
	}

	@ResponseBody
	@RequestMapping("/updatePhone/{customerId}/{phone}")
	public JSONObject updatePhone(@PathVariable("customerId") Integer customerId, @PathVariable("phone") String phone) {
		JSONObject jsonObject = new JSONObject();
		int result = customerService.updatePhone(phone, customerId);
		jsonObject.put("result", result);
		return jsonObject;
	}

	/*
	 * 删除地址
	 */
	@RequestMapping(value = "delAddressByaddressId.action", method = RequestMethod.GET)
	public String delAddressByaddressId(@RequestParam("addressId") int addressId, HttpSession session, Model model) {
		customerAddressService.deleteByPrimaryKey(addressId);
		int customerId = ((Customer) (session.getAttribute("customer"))).getCustomerId();
		List<CustomerAddress> addressList = customerAddressService.getAddressByCustomerId(customerId);
		List<Order> orderList = orderService.selectByCustomerId(customerId);
		model.addAttribute("orderList", orderList);
		model.addAttribute("addressList", addressList);

		return "foreground/personalCenter";
	}

	/*
	 * 获取订单详情
	 */
	@ResponseBody
	@RequestMapping("/getOrderAndAddress/{orderId}")
	public JSONObject getOrderAndAddress(@PathVariable("orderId") String orderId) {
		JSONObject jsonObject = new JSONObject();
		List<OrderDish> orderDishList = orderDishService.selectByOrderId(orderId);
		List<OrderDetail> orderDetailList = new ArrayList<>();
		float totalPrice = 0;
		for (int i = 0; i < orderDishList.size(); i++) {
			OrderDish orderDish = orderDishList.get(i);
			int number = orderDish.getDishNum();
			Dish dish = dishService.selectByPrimaryKey(orderDish.getDishId());
			String dishName = dish.getName();
			Float singlePrice = dish.getPrice();

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setName(dishName);
			orderDetail.setNumber(number);
			orderDetail.setSinglePrice(singlePrice);
			orderDetailList.add(orderDetail);

			totalPrice += singlePrice * number;
		}

		jsonObject.put("orderDetailList", orderDetailList);
		jsonObject.put("totalPrice", totalPrice);

		CustomerAddress address = orderService.selectByPrimaryKey(orderId).getCustomerAddress();

		jsonObject.put("address", address);
		return jsonObject;
	}
}

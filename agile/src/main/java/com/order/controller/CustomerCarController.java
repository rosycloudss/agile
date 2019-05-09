package com.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.order.entity.CustomerCar;
import com.order.entity.Dish;
import com.order.service.CustomerCarService;

/**
 * 购物车的Controller
 * 
 * @author liwei
 *
 */
@Controller
@RequestMapping("/foreground/car")
public class CustomerCarController {

	@Autowired
	private CustomerCarService carService;

	/**
	 * 添加菜品到餐车 每次只添加1
	 * 
	 * @param customerId
	 * @param dishId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addDish/{customerId}/{dishId}")
	public JSONObject addDishToCar(@PathVariable("customerId") Integer customerId,
			@PathVariable("dishId") Integer dishId) {
		JSONObject jsonObject = new JSONObject();
		int result = carService.addDishToCar(customerId, dishId);
		jsonObject.put("result", result);
		return jsonObject;
	}
	@ResponseBody
	@RequestMapping("/updateDishNum/{customerId}/{dishId}/{dishNum}")
	public JSONObject updateDishNum(@PathVariable("customerId") Integer customerId, @PathVariable("dishId") Integer dishId,@PathVariable("dishNum") Integer dishNum) {
		JSONObject jsonObject = new JSONObject();
		int result = 0;
		if(customerId != null && dishId != null && dishNum != null) {
			CustomerCar customerCar = new CustomerCar();
			customerCar.setCustomerId(customerId);
			Dish dish = new Dish();
			dish.setDishId(dishId);
			customerCar.setDish(dish);
			customerCar.setDishNum(dishNum);
			result = carService.updateByPrimaryKey(customerCar);
		}
		jsonObject.put("result", result);
		return jsonObject;
	}

	@RequestMapping("/getCarList/{customerId}")
	public String getDishCar(@PathVariable("customerId") Integer customerId,Model model) {
		List<CustomerCar> customerCarList = carService.seletByCustomerId(customerId);
		model.addAttribute("carList", customerCarList);
		return "foreground/car";
	}
}

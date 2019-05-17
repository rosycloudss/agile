package com.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.order.entity.CustomerAddress;
import com.order.entity.CustomerCar;
import com.order.entity.Dish;
import com.order.service.CustomerAddressService;
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
	
	@Autowired
	private CustomerAddressService customerAddressService;

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
	public JSONObject updateDishNum(@PathVariable("customerId") Integer customerId, 
			@PathVariable("dishId") Integer dishId,@PathVariable("dishNum") Integer dishNum) {
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
		float totalPrice = 0;
		for(CustomerCar car : customerCarList) {
			totalPrice += (car.getDishNum() * car.getDish().getPrice());
		}
		
		model.addAttribute("carList", customerCarList);
		model.addAttribute("totalPrice",totalPrice);
		return "foreground/car";
	}
	/**
	 * 删除购物车信息
	 * @param customerId
	 * @param dishId
	 * @return
	 */
	@RequestMapping("/delete/{customerId}/{dishId}")
	public String deleteDishCar(@PathVariable("customerId") Integer customerId,
			@PathVariable("dishId") Integer dishId) {
		if(carService.deleteByPrimaryKey(customerId, dishId) > 0) {
			System.out.println("删除成功");
		}else {
			System.out.println("删除失败");
		}
		return "redirect:/foreground/car/getCarList/" + customerId;
	}
	
	@RequestMapping(value="getCheckOut/{customerId}", method=RequestMethod.GET)
	public String getCheckOut(@PathVariable("customerId") Integer customerId, Model model) {
		List<CustomerAddress> addressList = customerAddressService.getAddressByCustomerId(customerId);
		model.addAttribute("addressList",addressList);
		return "foreground/checkOut";
	}
	
	
	@RequestMapping(value="pay/{customerId}/{addressId}")
	public ResponseEntity<String> pay(@PathVariable("customerId") Integer customerId, 
			@PathVariable("addressId") Integer addressId) {
		if (carService.pay(customerId, addressId) == 1) {
			return ResponseEntity.ok("1");
		} else {
			return ResponseEntity.status(404).body("0");
		}

	}
}

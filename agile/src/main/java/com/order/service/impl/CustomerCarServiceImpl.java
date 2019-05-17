package com.order.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.order.entity.Customer;
import com.order.entity.CustomerAddress;
import com.order.entity.CustomerCar;
import com.order.entity.Dish;
import com.order.entity.Order;
import com.order.entity.OrderDish;
import com.order.mapper.CustomerCarMapper;
import com.order.mapper.CustomerMapper;
import com.order.mapper.OrderDishMapper;
import com.order.mapper.OrderMapper;
import com.order.service.CustomerCarService;
import com.order.service.DishService;

@Service
public class CustomerCarServiceImpl implements CustomerCarService {

	@Resource
	private CustomerCarMapper customerCarMapper;

	@Autowired
	private DishService dishService;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private OrderDishMapper orderDishMapper;
	
	@Autowired
	private OrderMapper orderMapper;

	public int deleteByPrimaryKey(Integer customerId, Integer dishId) {
		return customerCarMapper.deleteByPrimaryKey(customerId, dishId);
	}

	public int insert(CustomerCar record) {
		return customerCarMapper.insert(record);
	}

	public int insertSelective(CustomerCar record) {
		return customerCarMapper.insertSelective(record);
	}

	public CustomerCar selectByPrimaryKey(Integer customerId, Integer dishId) {
		return customerCarMapper.selectByPrimaryKey(customerId, dishId);
	}

	public int updateByPrimaryKeySelective(CustomerCar record) {
		return customerCarMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(CustomerCar record) {
		return customerCarMapper.updateByPrimaryKey(record);
	}

	@Override
	public int addDishToCar(Integer customerId, Integer dishId) {
		if (customerId != null && dishId != null) {
			CustomerCar customerCar = customerCarMapper.selectByPrimaryKey(customerId, dishId);
			if (customerCar != null) {
				customerCar.setDishNum(customerCar.getDishNum() + 1);
				return updateByPrimaryKey(customerCar);
//				return customerCarMapper.in
			} else {
				customerCar = new CustomerCar();
				customerCar.setCustomerId(customerId);
				Dish dish = new Dish();
				dish.setDishId(dishId);
				customerCar.setDish(dish);
				customerCar.setDishNum(1);
				return insert(customerCar);
			}
		}
		return 0;
	}

	@Override
	public int updateDishNum(Integer customerId, Integer dishId, boolean isAdd) {
		CustomerCar customerCar = customerCarMapper.selectByPrimaryKey(customerId, dishId);
		Dish dish = dishService.selectByPrimaryKey(dishId);
		if (customerCar != null && dish != null) {
			if (isAdd) {
				customerCar.setDishNum(customerCar.getDishNum() + 1);
				if (customerCar.getDishNum() <= dish.getLeftNum()) {
					return updateByPrimaryKey(customerCar);
				}
			} else {
				customerCar.setDishNum(customerCar.getDishNum() + 1);
				if (customerCar.getDishNum() >= 0) {
					return updateByPrimaryKey(customerCar);
				}
			}
		}
		return 0;
	}

	
	
	@Override
	public int pay(Integer customerId, Integer addressId) {
		Customer customer = customerMapper.selectByPrimaryKey(customerId);
		if (customer == null) {
			return 0;
		}
		List<CustomerCar> carList = customerCarMapper.selectByCustomerId(customerId);
		if (carList.size() == 0) {
			return 0;
		}
		List<OrderDish> orderDishs = new ArrayList<>();
		Float amountOfMoney = 0.0f;
		String orderId = customer.getPhone() + System.currentTimeMillis(); 
		for(CustomerCar customerCar : carList) {
			OrderDish orderDish = new OrderDish();
			orderDish.setDishId(customerCar.getDish().getDishId());
			orderDish.setDishNum(customerCar.getDishNum());
			orderDish.setOrderId(orderId);
			orderDishs.add(orderDish);
			amountOfMoney +=customerCar.getDishNum() *customerCar.getDish().getPrice();
		}
		Order order = new Order();
		CustomerAddress customerAddress = new CustomerAddress();
		customerAddress.setAddressId(addressId);
		order.setOrderId(orderId);
		order.setCreateTime(new Date());
		order.setCustomerId(customerId);
		order.setStatus(0);
		order.setAmountOfMoney(amountOfMoney);
		order.setCustomerAddress(customerAddress);
		if(orderMapper.insert(order) == 0) {
			return 0;
		}
		for(OrderDish orderDish : orderDishs) {
			customerCarMapper.deleteByPrimaryKey(customerId, orderDish.getDishId());
			orderDishMapper.insert(orderDish);
		}
		return 1;
	}

	public List<CustomerCar> seletByCustomerId(Integer customerId) {
		return customerCarMapper.selectByCustomerId(customerId);
	}
}

package com.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.order.entity.CustomerCar;
import com.order.entity.Dish;
import com.order.mapper.CustomerCarMapper;
import com.order.service.CustomerCarService;
import com.order.service.DishService;

@Service
public class CustomerCarServiceImpl implements CustomerCarService {

	@Resource
	private CustomerCarMapper customerCarMapper;

	@Autowired
	private DishService dishService;

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

	public List<CustomerCar> seletByCustomerId(Integer customerId) {
		return customerCarMapper.selectByCustomerId(customerId);
	}
}

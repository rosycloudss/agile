package com.order.service;

import java.util.List;

import com.order.entity.CustomerCar;

public interface CustomerCarService {

	int deleteByPrimaryKey(Integer customerId, Integer dishId);

	int insert(CustomerCar record);

	int insertSelective(CustomerCar record);

	CustomerCar selectByPrimaryKey(Integer customerId, Integer dishId);

	int updateByPrimaryKeySelective(CustomerCar record);

	int updateByPrimaryKey(CustomerCar record);

	/**
	 * 将菜品添加到餐车中
	 * 
	 * 
	 * @param customerId 用户ID
	 * @param dishId     菜品编号
	 * @return
	 */
	int addDishToCar(Integer customerId, Integer dishId);

	/**
	 * 修改餐车中菜品的数量
	 * 
	 * @param customerId 用户Id
	 * @param dishId     菜品ID
	 * @param isAdd      是否添加菜品 如果isAdd 为 true 表示添加菜品 为false减少菜品数量 添加或减少1 为0时不减少
	 *                   最大数量为菜品的剩余量
	 * @return
	 */
	int updateDishNum(Integer customerId, Integer dishId, boolean isAdd);
	
	/**
	 *  结算支付
	 * @param customerId
	 * @param addressId
	 * @return
	 */
	int pay(Integer customerId, Integer addressId);
	
	List<CustomerCar> seletByCustomerId(Integer customerId);



}

package com.order.service;

import com.order.entity.CustomerCar;
public interface CustomerCarService{


    int deleteByPrimaryKey(Integer customerId,Integer dishId);

    int insert(CustomerCar record);

    int insertSelective(CustomerCar record);

    CustomerCar selectByPrimaryKey(Integer customerId,Integer dishId);

    int updateByPrimaryKeySelective(CustomerCar record);

    int updateByPrimaryKey(CustomerCar record);

}

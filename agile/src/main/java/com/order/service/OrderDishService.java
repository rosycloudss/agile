package com.order.service;

import java.util.List;

import com.order.entity.OrderDish;
public interface OrderDishService{


    int deleteByPrimaryKey(String orderId,Integer dishId);

    int insert(OrderDish record);

    int insertSelective(OrderDish record);

    OrderDish selectByPrimaryKey(String orderId,Integer dishId);

    int updateByPrimaryKeySelective(OrderDish record);

    int updateByPrimaryKey(OrderDish record);
    
    List<OrderDish> selectByOrderId(String orderId);

}

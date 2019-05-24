package com.order.service;

import java.util.List;

import com.order.entity.Order;
public interface OrderService{


    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> selectByCustomerId(Integer customerId);

    List<Order> selectAll();
}

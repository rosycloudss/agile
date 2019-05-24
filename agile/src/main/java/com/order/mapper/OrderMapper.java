package com.order.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.order.entity.Order;

@Repository
public interface OrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> selectByCustomerId(Integer customerId);
    
    List<Order> selectAll();
}
package com.order.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;
import com.order.mapper.OrderMapper;
import com.order.entity.Order;
import com.order.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{

    @Resource
    private OrderMapper orderMapper;

    
    public int deleteByPrimaryKey(String orderId) {
        return orderMapper.deleteByPrimaryKey(orderId);
    }

    
    public int insert(Order record) {
        return orderMapper.insert(record);
    }

    
    public int insertSelective(Order record) {
        return orderMapper.insertSelective(record);
    }

    
    public Order selectByPrimaryKey(String orderId) {
        return orderMapper.selectByPrimaryKey(orderId);
    }

    
    public int updateByPrimaryKeySelective(Order record) {
        return orderMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(Order record) {
        return orderMapper.updateByPrimaryKey(record);
    }
    
    public List<Order> selectByCustomerId(Integer customerId){
    	return orderMapper.selectByCustomerId(customerId);
    }

}

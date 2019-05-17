package com.order.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.annotation.Resource;
import com.order.mapper.OrderDishMapper;
import com.order.entity.OrderDish;
import com.order.service.OrderDishService;
@Service
public class OrderDishServiceImpl implements OrderDishService{

    @Resource
    private OrderDishMapper orderDishMapper;

    
    public int deleteByPrimaryKey(String orderId,Integer dishId) {
        return orderDishMapper.deleteByPrimaryKey(orderId,dishId);
    }

    
    public int insert(OrderDish record) {
        return orderDishMapper.insert(record);
    }

    
    public int insertSelective(OrderDish record) {
        return orderDishMapper.insertSelective(record);
    }

    
    public OrderDish selectByPrimaryKey(String orderId,Integer dishId) {
        return orderDishMapper.selectByPrimaryKey(orderId,dishId);
    }

    
    public int updateByPrimaryKeySelective(OrderDish record) {
        return orderDishMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(OrderDish record) {
        return orderDishMapper.updateByPrimaryKey(record);
    }
    
    public List<OrderDish> selectByOrderId(String orderId){
    	return orderDishMapper.selectByOrderId(orderId);
    }

}

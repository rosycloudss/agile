package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.mapper.CustomerCarMapper;
import com.order.entity.CustomerCar;
import com.order.service.CustomerCarService;
@Service
public class CustomerCarServiceImpl implements CustomerCarService{

    @Resource
    private CustomerCarMapper customerCarMapper;

    public int deleteByPrimaryKey(Integer customerId,Integer dishId) {
        return customerCarMapper.deleteByPrimaryKey(customerId,dishId);
    }

    public int insert(CustomerCar record) {
        return customerCarMapper.insert(record);
    }

    public int insertSelective(CustomerCar record) {
        return customerCarMapper.insertSelective(record);
    }

    public CustomerCar selectByPrimaryKey(Integer customerId,Integer dishId) {
        return customerCarMapper.selectByPrimaryKey(customerId,dishId);
    }

    public int updateByPrimaryKeySelective(CustomerCar record) {
        return customerCarMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(CustomerCar record) {
        return customerCarMapper.updateByPrimaryKey(record);
    }

}

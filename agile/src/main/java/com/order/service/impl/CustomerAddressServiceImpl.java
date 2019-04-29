package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.CustomerAddress;
import com.order.mapper.CustomerAddressMapper;
import com.order.service.CustomerAddressService;
@Service
public class CustomerAddressServiceImpl implements CustomerAddressService{

    @Resource
    private CustomerAddressMapper customerAddressMapper;

    public int deleteByPrimaryKey(Integer addressId) {
        return customerAddressMapper.deleteByPrimaryKey(addressId);
    }

    public int insert(CustomerAddress record) {
        return customerAddressMapper.insert(record);
    }

    public int insertSelective(CustomerAddress record) {
        return customerAddressMapper.insertSelective(record);
    }

    public CustomerAddress selectByPrimaryKey(Integer addressId) {
        return customerAddressMapper.selectByPrimaryKey(addressId);
    }

    public int updateByPrimaryKeySelective(CustomerAddress record) {
        return customerAddressMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(CustomerAddress record) {
        return customerAddressMapper.updateByPrimaryKey(record);
    }

}

package com.order.service;

import java.util.List;

import com.order.entity.CustomerAddress;

public interface CustomerAddressService{


    int deleteByPrimaryKey(Integer addressId);

    int insert(CustomerAddress record);

    int insertSelective(CustomerAddress record);

    CustomerAddress selectByPrimaryKey(Integer addressId);

    int updateByPrimaryKeySelective(CustomerAddress record);

    int updateByPrimaryKey(CustomerAddress record);
    
    List<CustomerAddress> getAddressByCustomerId(Integer customerId);

}

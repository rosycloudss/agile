package com.order.service;

import com.order.entity.Customer;

public interface CustomerService{


    int deleteByPrimaryKey(Integer customerId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer customerId);
    
    Customer login(String phone,String password);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    
    boolean register(String phone, String password);
    
    

}

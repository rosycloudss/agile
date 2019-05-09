package com.order.service;

import java.util.List;

import com.order.entity.Customer;

public interface CustomerService{

	 int deleteByPrimaryKey(Integer customerId);

	    int insert(Customer record);

	    int insertSelective(Customer record);

	    Customer selectByPrimaryKey(Integer customerId);
	    /**
	     * 顾客登录
	     * @param phone 登录使用的电话号码
	     * @param password 密码
	     * @return
	     */
	    Customer login(String phone,String password);
	    
	    /**
	     * 通过客户的属性查找客户的信息
	     * @param customer
	     * @return
	     */
	    List<Customer> getByParameters(Customer customer);
	    /**
	     * 通过电话号码查找客户信息
	     * @param phone
	     * @return
	     */
	    List<Customer> getByPhone(String phone);

	    /**
	     * 通过用户状态查询用户信息
	     * @param status
	     * @return
	     */
	    List<Customer> getByStatus(Integer status);
	    
	    int updateByPrimaryKeySelective(Customer record);

	    int updateByPrimaryKey(Customer record);
	    
	    
	    boolean register(String phone, String password);
    
    

}

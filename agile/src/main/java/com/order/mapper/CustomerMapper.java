package com.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.order.entity.Customer;

@Repository
public interface CustomerMapper {
	int deleteByPrimaryKey(Integer customerId);

	int insert(Customer record);

	int insertSelective(Customer record);

	Customer selectByPrimaryKey(Integer customerId);

	List<Customer> selectByParameters(Customer customer);

	int updateByPrimaryKeySelective(Customer record);

	int updateByPrimaryKey(Customer record);

	Customer selectByPhoneAndPassword(@Param("phone") String phone, @Param("pwd") String pwd);

	Customer selectByPhone(String phone);
	
    int updatePassword(@Param("pwd")String pwd,@Param("customerId")Integer customerId);
    
    Customer selectByCustomerIdAndPwd(@Param("customerId")Integer customerId,@Param("pwd")String pwd);
    
    int updatePhone(@Param("phone") String phone,@Param("customerId")Integer customerId);
}
package com.order.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.order.entity.Customer;
import com.order.mapper.CustomerMapper;
import com.order.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

    @Resource
    private CustomerMapper customerMapper;

    public int deleteByPrimaryKey(Integer customerId) {
        return customerMapper.deleteByPrimaryKey(customerId);
    }

    public int insert(Customer record) {
        return customerMapper.insert(record);
    }

    public int insertSelective(Customer record) {
        return customerMapper.insertSelective(record);
    }

    public Customer selectByPrimaryKey(Integer customerId) {
        return customerMapper.selectByPrimaryKey(customerId);
    }

    public int updateByPrimaryKeySelective(Customer record) {
        return customerMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Customer record) {
        return customerMapper.updateByPrimaryKey(record);
    }

	@Override
	public Customer login(String phone, String password) {
		if(phone != null && password != null) {
			return customerMapper.selectByPhoneAndPassword(phone, password);
		}
		return null;
	}
    
	@Override
	public boolean register(String phone, String password) {
		System.out.println(password + phone);
    	if (phone == null || password == null) {
			return false;
		}
    	if (customerMapper.selectByPhone(phone) == null) {
			Customer customer = new Customer();
			customer.setCreateTime(new Date());
			customer.setPhone(phone);
			customer.setPwd(password);
			customerMapper.insertSelective(customer);
			if (customer.getCustomerId() != null) {
				return true;
			}
		}
		return false;
	}

}

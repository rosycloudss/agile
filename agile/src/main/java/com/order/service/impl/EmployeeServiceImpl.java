package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.Employee;
import com.order.mapper.EmployeeMapper;
import com.order.service.EmployeeService;
@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Resource
    private EmployeeMapper employeeMapper;

    public int deleteByPrimaryKey(Integer employeeId) {
        return employeeMapper.deleteByPrimaryKey(employeeId);
    }

    public int insert(Employee record) {
        return employeeMapper.insert(record);
    }

    public int insertSelective(Employee record) {
        return employeeMapper.insertSelective(record);
    }

    public Employee selectByPrimaryKey(Integer employeeId) {
        return employeeMapper.selectByPrimaryKey(employeeId);
    }

    public int updateByPrimaryKeySelective(Employee record) {
        return employeeMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(Employee record) {
        return employeeMapper.updateByPrimaryKey(record);
    }

	public Employee login(String account, String password) {
		if(account != null && password != null) {
			return employeeMapper.selectByUsernameAndPassword(account, password);
		}
		return null;
	}
   
}

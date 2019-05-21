package com.order.service;

import com.order.entity.Employee;

public interface EmployeeService{


    int deleteByPrimaryKey(Integer employeeId);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByAccount(String account);
    
    Employee selectByPrimaryKey(Integer employeeId);
    
    Employee login(String account,String password);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

}

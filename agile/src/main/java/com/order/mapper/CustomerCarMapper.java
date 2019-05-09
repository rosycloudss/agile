package com.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.order.entity.CustomerCar;

@Repository
public interface CustomerCarMapper {
    int deleteByPrimaryKey(@Param("customerId") Integer customerId, @Param("dishId") Integer dishId);

    int insert(CustomerCar record);

    int insertSelective(CustomerCar record);

    CustomerCar selectByPrimaryKey(@Param("customerId") Integer customerId, @Param("dishId") Integer dishId);

    List<CustomerCar> selectByCustomerId(Integer customerId);
    
    int updateByPrimaryKeySelective(CustomerCar record);

    int updateByPrimaryKey(CustomerCar record);
}
package com.order.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.order.entity.OrderDish;

@Repository
public interface OrderDishMapper {
    int deleteByPrimaryKey(@Param("orderId") String orderId, @Param("dishId") Integer dishId);

    int insert(OrderDish record);

    int insertSelective(OrderDish record);

    OrderDish selectByPrimaryKey(@Param("orderId") String orderId, @Param("dishId") Integer dishId);

    int updateByPrimaryKeySelective(OrderDish record);

    int updateByPrimaryKey(OrderDish record);
}
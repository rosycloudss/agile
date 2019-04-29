package com.order.mapper;

import org.springframework.stereotype.Repository;

import com.order.entity.Dish;

@Repository
public interface DishMapper {
    int deleteByPrimaryKey(Integer dishId);

    int insert(Dish record);

    int insertSelective(Dish record);

    Dish selectByPrimaryKey(Integer dishId);

    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);
}
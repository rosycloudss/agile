package com.order.service;

import com.order.entity.Dish;

public interface DishService{


    int deleteByPrimaryKey(Integer dishId);

    int insert(Dish record);

    int insertSelective(Dish record);

    Dish selectByPrimaryKey(Integer dishId);

    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);

}

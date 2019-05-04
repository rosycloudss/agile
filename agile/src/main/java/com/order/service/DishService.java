package com.order.service;

import com.order.entity.Dish;

import java.util.List;

public interface DishService{

    public List<Dish> getAll();

    public int deleteByPrimaryKey(Integer dishId);

    public int insert(Dish record);

    public int insertSelective(Dish record);

    public Dish selectByPrimaryKey(Integer dishId);

    public int updateByPrimaryKeySelective(Dish record);

    public int updateByPrimaryKey(Dish record);

}

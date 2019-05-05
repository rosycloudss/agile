package com.order.service;

import java.util.List;

import com.order.entity.Dish;
import com.order.entity.Page;

public interface DishService{

    public List<Dish> getAll(Page page);

    public int deleteByPrimaryKey(Integer dishId);

    public int insert(Dish record);

    public int insertSelective(Dish record);

    public Dish selectByPrimaryKey(Integer dishId);
    
    public List<Dish> getDishByCategoryId(Integer categoryId,Page page);
    
    public int countDish(Integer categoryId);

    public int updateByPrimaryKeySelective(Dish record);

    public int updateByPrimaryKey(Dish record);

}

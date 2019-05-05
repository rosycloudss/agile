package com.order.service;

import java.util.List;

import com.order.entity.DishCategory;

public interface DishCategoryService{


    int deleteByPrimaryKey(Integer categoryId);

    int insert(DishCategory record);

    int insertSelective(DishCategory record);

    DishCategory selectByPrimaryKey(Integer categoryId);
    
    List<DishCategory> getAll();

    int updateByPrimaryKeySelective(DishCategory record);

    int updateByPrimaryKey(DishCategory record);

}

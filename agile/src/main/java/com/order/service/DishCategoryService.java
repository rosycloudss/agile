package com.order.service;

import com.order.entity.DishCategory;

public interface DishCategoryService{


    int deleteByPrimaryKey(Integer categoryId);

    int insert(DishCategory record);

    int insertSelective(DishCategory record);

    DishCategory selectByPrimaryKey(Integer categoryId);

    int updateByPrimaryKeySelective(DishCategory record);

    int updateByPrimaryKey(DishCategory record);

}

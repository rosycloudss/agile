package com.order.mapper;

import org.springframework.stereotype.Repository;

import com.order.entity.DishCategory;

@Repository
public interface DishCategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(DishCategory record);

    int insertSelective(DishCategory record);

    DishCategory selectByPrimaryKey(Integer categoryId);

    int updateByPrimaryKeySelective(DishCategory record);

    int updateByPrimaryKey(DishCategory record);
}
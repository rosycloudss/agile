package com.order.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.order.entity.DishCategory;

@Repository
public interface DishCategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(DishCategory record);

    int insertSelective(DishCategory record);

    DishCategory selectByPrimaryKey(Integer categoryId);
    
    List<DishCategory> selectAll();

    int updateByPrimaryKeySelective(DishCategory record);

    int updateByPrimaryKey(DishCategory record);
    
}
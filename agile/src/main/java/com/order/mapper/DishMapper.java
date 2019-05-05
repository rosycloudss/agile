package com.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.order.entity.Dish;
import com.order.entity.Page;

@Repository
public interface DishMapper {

	List<Dish> selectAll();

	int deleteByPrimaryKey(Integer dishId);

	int insert(Dish record);

	int insertSelective(Dish record);

	Dish selectByPrimaryKey(Integer dishId);

	List<Dish> selectByCategoryId(@Param("categoryId") Integer categoryId, @Param("page") Page page);

	int countDish(@Param("categoryId") Integer categoryId);
	
	int updateByPrimaryKeySelective(Dish record);

	int updateByPrimaryKey(Dish record);
}
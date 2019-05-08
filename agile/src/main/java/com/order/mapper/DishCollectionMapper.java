package com.order.mapper;

import org.springframework.stereotype.Repository;

import com.order.entity.DishCollection;

@Repository
public interface DishCollectionMapper {

    int deleteByPrimaryKey(Integer collectionId);

    int insert(DishCollection record);

    int insertSelective(DishCollection record);

    DishCollection selectByPrimaryKey(String collectionId);

    int updateByPrimaryKeySelective(DishCollection record);

    int updateByPrimaryKey(DishCollection record);
}
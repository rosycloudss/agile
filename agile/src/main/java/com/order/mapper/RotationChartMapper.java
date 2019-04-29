package com.order.mapper;

import org.springframework.stereotype.Repository;

import com.order.entity.RotationChart;

@Repository
public interface RotationChartMapper {
    int deleteByPrimaryKey(Integer rotionId);

    int insert(RotationChart record);

    int insertSelective(RotationChart record);

    RotationChart selectByPrimaryKey(Integer rotionId);

    int updateByPrimaryKeySelective(RotationChart record);

    int updateByPrimaryKey(RotationChart record);
}
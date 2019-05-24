package com.order.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.order.entity.RotationChart;

@Repository
public interface RotationChartMapper {
    int deleteByPrimaryKey(Integer rotionId);

    int insert(RotationChart record);

    int insertSelective(RotationChart record);

    RotationChart selectByPrimaryKey(Integer rotionId);
    
    List<RotationChart> selectAll();

    int updateByPrimaryKeySelective(RotationChart record);

    int updateByPrimaryKey(RotationChart record);
}
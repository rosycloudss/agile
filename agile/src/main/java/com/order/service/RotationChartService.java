package com.order.service;

import java.util.List;

import com.order.entity.RotationChart;
public interface RotationChartService{


    int deleteByPrimaryKey(Integer rotionId);

    int insert(RotationChart record);

    int insertSelective(RotationChart record);

    RotationChart selectByPrimaryKey(Integer rotionId);
    
    List<RotationChart> selectAll();

    int updateByPrimaryKeySelective(RotationChart record);

    int updateByPrimaryKey(RotationChart record);

}

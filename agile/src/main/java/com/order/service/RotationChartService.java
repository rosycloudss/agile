package com.order.service;

import com.order.entity.RotationChart;
public interface RotationChartService{


    int deleteByPrimaryKey(Integer rotionId);

    int insert(RotationChart record);

    int insertSelective(RotationChart record);

    RotationChart selectByPrimaryKey(Integer rotionId);

    int updateByPrimaryKeySelective(RotationChart record);

    int updateByPrimaryKey(RotationChart record);

}

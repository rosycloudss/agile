package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.mapper.RotationChartMapper;
import com.order.entity.RotationChart;
import com.order.service.RotationChartService;
@Service
public class RotationChartServiceImpl implements RotationChartService{

    @Resource
    private RotationChartMapper rotationChartMapper;


    @Override
    public int deleteByPrimaryKey(Integer rotionId) {
        return rotationChartMapper.deleteByPrimaryKey(rotionId);
    }

    @Override
    public int insert(RotationChart record) {
        return rotationChartMapper.insert(record);
    }

    @Override
    public int insertSelective(RotationChart record) {
        return rotationChartMapper.insertSelective(record);
    }

    
    public RotationChart selectByPrimaryKey(Integer rotionId) {
        return rotationChartMapper.selectByPrimaryKey(rotionId);
    }

    
    public int updateByPrimaryKeySelective(RotationChart record) {
        return rotationChartMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(RotationChart record) {
        return rotationChartMapper.updateByPrimaryKey(record);
    }

}

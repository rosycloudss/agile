package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.Dish;
import com.order.mapper.DishMapper;
import com.order.service.DishService;
@Service
public class DishServiceImpl implements DishService{

    @Resource
    private DishMapper dishMapper;

    public int deleteByPrimaryKey(Integer dishId) {
        return dishMapper.deleteByPrimaryKey(dishId);
    }

    public int insert(Dish record) {
        return dishMapper.insert(record);
    }

    public int insertSelective(Dish record) {
        return dishMapper.insertSelective(record);
    }

    public Dish selectByPrimaryKey(Integer dishId) {
        return dishMapper.selectByPrimaryKey(dishId);
    }

    public int updateByPrimaryKeySelective(Dish record) {
        return dishMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Dish record) {
        return dishMapper.updateByPrimaryKey(record);
    }

}

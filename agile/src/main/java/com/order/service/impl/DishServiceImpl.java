package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.Dish;
import com.order.mapper.DishMapper;
import com.order.service.DishService;

import java.util.List;

@Service
public class DishServiceImpl implements DishService{

    @Resource
    private DishMapper dishMapper;

    @Override
    public List<Dish> getAll() {
        return dishMapper.selectAll();
    }

    @Override
    public int deleteByPrimaryKey(Integer dishId) {
        return dishMapper.deleteByPrimaryKey(dishId);
    }

    @Override
    public int insert(Dish record) {
        return dishMapper.insert(record);
    }

    @Override
    public int insertSelective(Dish record) {
        return dishMapper.insertSelective(record);
    }

    @Override
    public Dish selectByPrimaryKey(Integer dishId) {
        return dishMapper.selectByPrimaryKey(dishId);
    }

    @Override
    public int updateByPrimaryKeySelective(Dish record) {
        return dishMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Dish record) {
        return dishMapper.updateByPrimaryKey(record);
    }

}

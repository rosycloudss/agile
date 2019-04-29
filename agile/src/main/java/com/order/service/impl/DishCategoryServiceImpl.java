package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.DishCategory;
import com.order.mapper.DishCategoryMapper;
import com.order.service.DishCategoryService;
@Service
public class DishCategoryServiceImpl implements DishCategoryService{

    @Resource
    private DishCategoryMapper dishCategoryMapper;

    public int deleteByPrimaryKey(Integer categoryId) {
        return dishCategoryMapper.deleteByPrimaryKey(categoryId);
    }

    public int insert(DishCategory record) {
        return dishCategoryMapper.insert(record);
    }

    public int insertSelective(DishCategory record) {
        return dishCategoryMapper.insertSelective(record);
    }

    public DishCategory selectByPrimaryKey(Integer categoryId) {
        return dishCategoryMapper.selectByPrimaryKey(categoryId);
    }

    public int updateByPrimaryKeySelective(DishCategory record) {
        return dishCategoryMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(DishCategory record) {
        return dishCategoryMapper.updateByPrimaryKey(record);
    }

}

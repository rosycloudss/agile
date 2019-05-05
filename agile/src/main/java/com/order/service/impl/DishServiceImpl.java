package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.Dish;
import com.order.entity.Page;
import com.order.mapper.DishMapper;
import com.order.service.DishService;

import java.util.List;

@Service
public class DishServiceImpl implements DishService{

    @Resource
    private DishMapper dishMapper;

    @Override
    public List<Dish> getAll(Page page) {
        return getDishByCategoryId(null,page);
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
	public List<Dish> getDishByCategoryId(Integer categoryId,Page page) {
    	List<Dish> dishList = null;
    	if(categoryId != null && categoryId != 0) {
    		dishList = dishMapper.selectByCategoryId(categoryId,page);
    	}else {
    		dishList = dishMapper.selectByCategoryId(null,page);
    	}
		return dishList;
	}

	@Override
	public int countDish(Integer categoryId) {
		if(categoryId != null && categoryId != 0) {
			return dishMapper.countDish(categoryId);
		}else {
			return dishMapper.countDish(null);
		}
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

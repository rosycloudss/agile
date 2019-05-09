package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class CustomerCar {
    /**
    * 用户ID
    */
    private Integer customerId;

    /**
    * 菜品信息
    */
    private Dish dish;
    /**
    * 菜品数量
    */
    private Integer dishNum;

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

  

    public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	public Integer getDishNum() {
        return dishNum;
    }

    public void setDishNum(Integer dishNum) {
        this.dishNum = dishNum;
    }

	@Override
	public String toString() {
		return "CustomerCar [customerId=" + customerId + ", dish=" + dish + ", dishNum=" + dishNum + "]";
	}
    
}
package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class CustomerCar {
    /**
    * 
    */
    private Integer customerId;

    /**
    * 
    */
    private Integer dishId;

    /**
    * 
    */
    private Integer dishNum;

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getDishId() {
        return dishId;
    }

    public void setDishId(Integer dishId) {
        this.dishId = dishId;
    }

    public Integer getDishNum() {
        return dishNum;
    }

    public void setDishNum(Integer dishNum) {
        this.dishNum = dishNum;
    }
}
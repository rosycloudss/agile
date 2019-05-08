package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class OrderDish {
    /**
    * 
    */
    private String orderId;

    /**
    * 
    */
    private Integer dishId;

    /**
    * 
    */
    private Integer dishNum;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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
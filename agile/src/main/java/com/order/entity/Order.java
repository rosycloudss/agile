package com.order.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Order {
    /**
    * 
    */
    private String orderId;

    /**
    * 
    */
    private Float amountOfMoney;

    /**
    * 
    */
    private Integer status;

    /**
    * 
    */
    private Date createTime;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Float getAmountOfMoney() {
        return amountOfMoney;
    }

    public void setAmountOfMoney(Float amountOfMoney) {
        this.amountOfMoney = amountOfMoney;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
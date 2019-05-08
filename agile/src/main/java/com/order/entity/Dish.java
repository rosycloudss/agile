package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class Dish {

    private Integer dishId;

    private Integer categoryId;

    private Integer dishImg;

    private String name;

    private Float price;

    private String description;

    /**
            * 剩余数量
    */
    private Integer leftNum;

    private Img img;

    public Integer getDishId() {
        return dishId;
    }

    public void setDishId(Integer dishId) {
        this.dishId = dishId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getDishImg() {
        return dishImg;
    }

    public void setDishImg(Integer dishImg) {
        this.dishImg = dishImg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getLeftNum() {
        return leftNum;
    }

    public void setLeftNum(Integer leftNum) {
        this.leftNum = leftNum;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Img getImg() {
        return img;
    }

    public void setImg(Img img) {
        this.img = img;
    }
}
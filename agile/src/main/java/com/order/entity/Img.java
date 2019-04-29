package com.order.entity;

import org.springframework.stereotype.Component;

@Component
public class Img {
    /**
    * 
    */
    private Integer imgId;

    /**
    * 
    */
    private String imgUrl;

    /**
    * 
    */
    private String description;

    public Integer getImgId() {
        return imgId;
    }

    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
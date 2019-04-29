package com.order.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class RotationChart {
    /**
    * 
    */
    private Integer rotionId;

    /**
    * 
    */
    private Integer imgId;

    /**
    * 
    */
    private String imgLink;

    /**
    * 
    */
    private Date createTime;

    public Integer getRotionId() {
        return rotionId;
    }

    public void setRotionId(Integer rotionId) {
        this.rotionId = rotionId;
    }

    public Integer getImgId() {
        return imgId;
    }

    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
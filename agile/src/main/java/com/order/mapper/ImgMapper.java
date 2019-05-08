package com.order.mapper;

import org.springframework.stereotype.Repository;

import com.order.entity.Img;

@Repository
public interface ImgMapper {
    int deleteByPrimaryKey(Integer imgId);

    int insert(Img record);

    int insertSelective(Img record);

    Img selectByPrimaryKey(Integer imgId);

    int updateByPrimaryKeySelective(Img record);

    int updateByPrimaryKey(Img record);
}
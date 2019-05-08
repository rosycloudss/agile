package com.order.mapper;

import org.springframework.stereotype.Repository;

import com.order.entity.Website;

@Repository
public interface WebsiteMapper {
    int deleteByPrimaryKey(Integer websiteId);

    int insert(Website record);

    int insertSelective(Website record);

    Website selectByPrimaryKey(Integer websiteId);

    int updateByPrimaryKeySelective(Website record);

    int updateByPrimaryKey(Website record);
}
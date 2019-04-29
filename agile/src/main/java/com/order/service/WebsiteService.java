package com.order.service;

import com.order.entity.Website;

public interface WebsiteService{


    int deleteByPrimaryKey(Integer websiteId);

    int insert(Website record);

    int insertSelective(Website record);

    Website selectByPrimaryKey(Integer websiteId);

    int updateByPrimaryKeySelective(Website record);

    int updateByPrimaryKey(Website record);

}

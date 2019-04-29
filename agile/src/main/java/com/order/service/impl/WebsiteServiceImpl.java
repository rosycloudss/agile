package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.entity.Website;
import com.order.mapper.WebsiteMapper;
import com.order.service.WebsiteService;
@Service
public class WebsiteServiceImpl implements WebsiteService{

    @Resource
    private WebsiteMapper websiteMapper;

    
    public int deleteByPrimaryKey(Integer websiteId) {
        return websiteMapper.deleteByPrimaryKey(websiteId);
    }

    
    public int insert(Website record) {
        return websiteMapper.insert(record);
    }

    
    public int insertSelective(Website record) {
        return websiteMapper.insertSelective(record);
    }

    
    public Website selectByPrimaryKey(Integer websiteId) {
        return websiteMapper.selectByPrimaryKey(websiteId);
    }

    
    public int updateByPrimaryKeySelective(Website record) {
        return websiteMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(Website record) {
        return websiteMapper.updateByPrimaryKey(record);
    }

}

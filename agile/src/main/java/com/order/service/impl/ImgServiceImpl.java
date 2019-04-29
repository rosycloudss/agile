package com.order.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.order.mapper.ImgMapper;
import com.order.entity.Img;
import com.order.service.ImgService;
@Service
public class ImgServiceImpl implements ImgService{

    @Resource
    private ImgMapper imgMapper;

    
    public int deleteByPrimaryKey(Integer imgId) {
        return imgMapper.deleteByPrimaryKey(imgId);
    }

    
    public int insert(Img record) {
        return imgMapper.insert(record);
    }

    
    public int insertSelective(Img record) {
        return imgMapper.insertSelective(record);
    }

    
    public Img selectByPrimaryKey(Integer imgId) {
        return imgMapper.selectByPrimaryKey(imgId);
    }

    
    public int updateByPrimaryKeySelective(Img record) {
        return imgMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(Img record) {
        return imgMapper.updateByPrimaryKey(record);
    }

}

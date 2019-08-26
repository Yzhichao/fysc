package com.sky.service.impl;

import com.sky.model.BaseInfo;
import com.sky.commons.utils.PageInfo;
import com.sky.mapper.BaseInfoMapper;
import com.sky.service.IBaseInfoService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
/**
 * <p>
 *   服务实现类
 * </p>
 * @author L
 * @since 2019-06-24
 */
@Service
public class BaseInfoServiceImpl extends ServiceImpl<BaseInfoMapper, BaseInfo> implements IBaseInfoService {
    @Autowired private BaseInfoMapper baseInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<BaseInfo> page = new Page<BaseInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = baseInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

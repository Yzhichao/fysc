package com.sky.service.impl;

import com.sky.model.HandongInfo;
import com.sky.mapper.HandongInfoMapper;
import com.sky.service.IHandongInfoService;
import com.sky.commons.utils.PageInfo;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.plugins.Page;
import java.util.List;
/**
 * <p>
 *   服务实现类
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Service
public class HandongInfoServiceImpl extends ServiceImpl<HandongInfoMapper, HandongInfo> implements IHandongInfoService {
    @Autowired private HandongInfoMapper handongInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<HandongInfo> page = new Page<HandongInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = handongInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

package com.sky.service.impl;

import com.sky.model.DifangInfo;
import com.sky.mapper.DifangInfoMapper;
import com.sky.service.IDifangInfoService;
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
public class DifangInfoServiceImpl extends ServiceImpl<DifangInfoMapper, DifangInfo> implements IDifangInfoService {
    @Autowired private DifangInfoMapper difangInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<DifangInfo> page = new Page<DifangInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = difangInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

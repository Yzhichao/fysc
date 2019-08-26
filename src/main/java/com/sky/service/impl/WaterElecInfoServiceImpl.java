package com.sky.service.impl;

import com.sky.model.WaterElecInfo;
import com.sky.mapper.WaterElecInfoMapper;
import com.sky.service.IWaterElecInfoService;
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
public class WaterElecInfoServiceImpl extends ServiceImpl<WaterElecInfoMapper, WaterElecInfo> implements IWaterElecInfoService {
    @Autowired private WaterElecInfoMapper waterElecInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<WaterElecInfo> page = new Page<WaterElecInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = waterElecInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

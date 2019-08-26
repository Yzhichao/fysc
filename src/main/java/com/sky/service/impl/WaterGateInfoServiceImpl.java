package com.sky.service.impl;

import com.sky.model.WaterGateInfo;
import com.sky.mapper.WaterGateInfoMapper;
import com.sky.service.IWaterGateInfoService;
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
 * @since 2019-06-24
 */
@Service
public class WaterGateInfoServiceImpl extends ServiceImpl<WaterGateInfoMapper, WaterGateInfo> implements IWaterGateInfoService {
    @Autowired private WaterGateInfoMapper waterGateInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<WaterGateInfo> page = new Page<WaterGateInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = waterGateInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

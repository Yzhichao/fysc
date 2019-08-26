package com.sky.service.impl;

import com.sky.model.WarnEquipInfo;
import com.sky.mapper.WarnEquipInfoMapper;
import com.sky.service.IWarnEquipInfoService;
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
public class WarnEquipInfoServiceImpl extends ServiceImpl<WarnEquipInfoMapper, WarnEquipInfo> implements IWarnEquipInfoService {
    @Autowired private WarnEquipInfoMapper warnEquipInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<WarnEquipInfo> page = new Page<WarnEquipInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = warnEquipInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

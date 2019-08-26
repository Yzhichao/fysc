package com.sky.service.impl;

import com.sky.model.MonitorStationInfo;
import com.sky.mapper.MonitorStationInfoMapper;
import com.sky.service.IMonitorStationInfoService;
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
public class MonitorStationInfoServiceImpl extends ServiceImpl<MonitorStationInfoMapper, MonitorStationInfo> implements IMonitorStationInfoService {
    @Autowired private MonitorStationInfoMapper monitorStationInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<MonitorStationInfo> page = new Page<MonitorStationInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = monitorStationInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

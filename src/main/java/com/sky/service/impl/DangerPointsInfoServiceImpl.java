package com.sky.service.impl;

import com.sky.model.DangerPointsInfo;
import com.sky.mapper.DangerPointsInfoMapper;
import com.sky.service.IDangerPointsInfoService;
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
public class DangerPointsInfoServiceImpl extends ServiceImpl<DangerPointsInfoMapper, DangerPointsInfo> implements IDangerPointsInfoService {
    @Autowired private DangerPointsInfoMapper dangerPointsInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<DangerPointsInfo> page = new Page<DangerPointsInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = dangerPointsInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

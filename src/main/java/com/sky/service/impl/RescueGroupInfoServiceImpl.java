package com.sky.service.impl;

import com.sky.model.RescueGroupInfo;
import com.sky.mapper.RescueGroupInfoMapper;
import com.sky.service.IRescueGroupInfoService;
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
public class RescueGroupInfoServiceImpl extends ServiceImpl<RescueGroupInfoMapper, RescueGroupInfo> implements IRescueGroupInfoService {
    @Autowired private RescueGroupInfoMapper rescueGroupInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<RescueGroupInfo> page = new Page<RescueGroupInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = rescueGroupInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

package com.sky.service.impl;

import com.sky.model.ReservoirInfo;
import com.sky.commons.utils.PageInfo;
import com.sky.mapper.ReservoirInfoMapper;
import com.sky.service.IReservoirInfoService;
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
public class ReservoirInfoServiceImpl extends ServiceImpl<ReservoirInfoMapper, ReservoirInfo> implements IReservoirInfoService {
    @Autowired private ReservoirInfoMapper reservoirInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<ReservoirInfo> page = new Page<ReservoirInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = reservoirInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

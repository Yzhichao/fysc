package com.sky.service.impl;

import com.sky.model.DangerAreaInfo;
import com.sky.mapper.DangerAreaInfoMapper;
import com.sky.service.IDangerAreaInfoService;
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
public class DangerAreaInfoServiceImpl extends ServiceImpl<DangerAreaInfoMapper, DangerAreaInfo> implements IDangerAreaInfoService {
    @Autowired private DangerAreaInfoMapper dangerAreaInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<DangerAreaInfo> page = new Page<DangerAreaInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = dangerAreaInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

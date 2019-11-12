package com.sky.service.impl;

import com.sky.model.SysOptLog;
import com.sky.mapper.SysOptLogMapper;
import com.sky.service.ISysOptLogService;
import com.sky.commons.utils.PageInfo;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.plugins.Page;
import java.util.List;
/**
 * <p>
 * 系统日志  服务实现类
 * </p>
 * @author L
 * @since 2019-11-11
 */
@Service
public class SysOptLogServiceImpl extends ServiceImpl<SysOptLogMapper, SysOptLog> implements ISysOptLogService {
    @Autowired private SysOptLogMapper sysOptLogMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<SysOptLog> page = new Page<SysOptLog>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = sysOptLogMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

package com.sky.service.impl;

import com.sky.model.AvoideDisasterPoint;
import com.sky.mapper.AvoideDisasterPointMapper;
import com.sky.service.IAvoideDisasterPointService;
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
public class AvoideDisasterPointServiceImpl extends ServiceImpl<AvoideDisasterPointMapper, AvoideDisasterPoint> implements IAvoideDisasterPointService {
    @Autowired private AvoideDisasterPointMapper avoideDisasterPointMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<AvoideDisasterPoint> page = new Page<AvoideDisasterPoint>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = avoideDisasterPointMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

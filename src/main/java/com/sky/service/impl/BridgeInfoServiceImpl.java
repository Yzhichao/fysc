package com.sky.service.impl;

import com.sky.model.BridgeInfo;
import com.sky.mapper.BridgeInfoMapper;
import com.sky.service.IBridgeInfoService;
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
public class BridgeInfoServiceImpl extends ServiceImpl<BridgeInfoMapper, BridgeInfo> implements IBridgeInfoService {
    @Autowired private BridgeInfoMapper bridgeInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<BridgeInfo> page = new Page<BridgeInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = bridgeInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

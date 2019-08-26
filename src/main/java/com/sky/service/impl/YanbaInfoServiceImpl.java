package com.sky.service.impl;

import com.sky.model.YanbaInfo;
import com.sky.mapper.YanbaInfoMapper;
import com.sky.service.IYanbaInfoService;
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
public class YanbaInfoServiceImpl extends ServiceImpl<YanbaInfoMapper, YanbaInfo> implements IYanbaInfoService {
    @Autowired private YanbaInfoMapper yanbaInfoMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<YanbaInfo> page = new Page<YanbaInfo>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = yanbaInfoMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

package com.sky.service.impl;

import com.sky.model.GoodsRepository;
import com.sky.mapper.GoodsRepositoryMapper;
import com.sky.service.IGoodsRepositoryService;
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
public class GoodsRepositoryServiceImpl extends ServiceImpl<GoodsRepositoryMapper, GoodsRepository> implements IGoodsRepositoryService {
    @Autowired private GoodsRepositoryMapper goodsRepositoryMapper;
    
    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<GoodsRepository> page = new Page<GoodsRepository>(pageInfo.getNowpage(), pageInfo.getSize());
        List list = goodsRepositoryMapper.selectPageNew(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }
}

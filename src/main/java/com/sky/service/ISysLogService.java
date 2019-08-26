package com.sky.service;

import com.baomidou.mybatisplus.service.IService;
import com.sky.commons.utils.PageInfo;
import com.sky.model.SysLog;

/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}
package com.sky.service;

import com.sky.model.SysOptLog;
import com.baomidou.mybatisplus.service.IService;
import com.sky.commons.utils.PageInfo;
/**
 * <p>
 * 系统日志  服务类
 * </p>
 *
 * @author L
 * @since 2019-11-11
 */
public interface ISysOptLogService extends IService<SysOptLog> {
	void selectDataGrid(PageInfo pageInfo);
}

package com.sky.service;

import com.sky.commons.utils.PageInfo;
import com.sky.model.BaseInfo;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *   服务类
 * </p>
 *
 * @author L
 * @since 2019-06-24
 */
public interface IBaseInfoService extends IService<BaseInfo> {
	
	void selectDataGrid(PageInfo pageInfo);
}

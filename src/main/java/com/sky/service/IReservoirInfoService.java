package com.sky.service;

import com.sky.model.ReservoirInfo;
import com.baomidou.mybatisplus.service.IService;
import com.sky.commons.utils.PageInfo;
/**
 * <p>
 *   服务类
 * </p>
 *
 * @author L
 * @since 2019-06-24
 */
public interface IReservoirInfoService extends IService<ReservoirInfo> {
	void selectDataGrid(PageInfo pageInfo);
}

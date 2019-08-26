package com.sky.service;

import com.sky.model.AvoideDisasterPoint;
import com.baomidou.mybatisplus.service.IService;
import com.sky.commons.utils.PageInfo;
/**
 * <p>
 *   服务类
 * </p>
 *
 * @author L
 * @since 2019-06-25
 */
public interface IAvoideDisasterPointService extends IService<AvoideDisasterPoint> {
	void selectDataGrid(PageInfo pageInfo);
}

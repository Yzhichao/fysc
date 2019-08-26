package com.sky.service;

import com.sky.model.DifangInfo;
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
public interface IDifangInfoService extends IService<DifangInfo> {
	void selectDataGrid(PageInfo pageInfo);
}

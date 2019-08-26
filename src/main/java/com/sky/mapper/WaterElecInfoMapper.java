package com.sky.mapper;

import com.sky.model.WaterElecInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author L
 * @since 2019-06-25
 */
public interface WaterElecInfoMapper extends BaseMapper<WaterElecInfo> {
	List selectPageNew(Pagination page, Map<String, Object> params);
}
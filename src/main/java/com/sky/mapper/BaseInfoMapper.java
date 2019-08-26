package com.sky.mapper;

import com.sky.model.BaseInfo;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author L
 * @since 2019-06-24
 */
public interface BaseInfoMapper extends BaseMapper<BaseInfo> {
	List selectPageNew(Pagination page, Map<String, Object> params);
}
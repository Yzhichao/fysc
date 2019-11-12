package com.sky.mapper;

import com.sky.model.SysOptLog;
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
 * @since 2019-11-11
 */
public interface SysOptLogMapper extends BaseMapper<SysOptLog> {
	List selectPageNew(Pagination page, Map<String, Object> params);
}
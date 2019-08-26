
package com.sky.commons.generator.config.rules;

/**
 * 数据库类型定义
 *
 * @author YangHu
 * 
 */
public enum DbType {

	MYSQL("mysql"), ORACLE("oracle"),SQLSERVER("sqlserver");

	private String value;

	DbType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}

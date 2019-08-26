
package com.sky.commons.generator.config.po;

import com.sky.commons.generator.config.StrategyConfig;

/**
 * <p>
 * 表字段信息
 * </p>
 * @author YangHu
 * @since 2016-12-03
 */
public class TableField {
	private boolean keyFlag;
	private String name;
	private String type;
	private String propertyName;
	private String propertyType;
	private String comment;

	public boolean isKeyFlag() {
		return keyFlag;
	}

	public void setKeyFlag(boolean keyFlag) {
		this.keyFlag = keyFlag;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public boolean isConvert() {
		if (StrategyConfig.DB_COLUMN_UNDERLINE) {
			return false;
		}
		return !name.equalsIgnoreCase(propertyName);
	}

	public String getCapitalName() {
		return propertyName.substring(0, 1).toUpperCase() + propertyName.substring(1);
	}

}

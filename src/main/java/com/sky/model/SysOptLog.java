package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * 系统日志
 * </p>
 *
 * @author L
 * @since 2019-11-11
 */
@TableName("sys_opt_log")
public class SysOptLog extends Model<SysOptLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 登陆名
     */
    @TableField(value="login_name")
    private String loginName;
    /**
     * 角色名
     */
    @TableField(value="role_name")
    private String roleName;
    /**
     * 操作的表名
     */
    @TableField(value="opt_table")
    private String optTable;
    /**
     * 操作数据的id
     */
    @TableField(value="opt_id")
    private String optId;
    /**
     * 1新增，2修改，3删除
     */
    @TableField(value="opt_type")
    private Integer optType;
    /**
     * 客户端ip
     */
    @TableField(value="client_ip")
    private String clientIp;
    /**
     * 创建时间
     */
    @TableField(value="create_time")
    private java.util.Date createTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getOptTable() {
        return optTable;
    }

    public void setOptTable(String optTable) {
        this.optTable = optTable;
    }

    public String getOptId() {
        return optId;
    }

    public void setOptId(String optId) {
        this.optId = optId;
    }

    public Integer getOptType() {
        return optType;
    }

    public void setOptType(Integer optType) {
        this.optType = optType;
    }

    public String getClientIp() {
        return clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public java.util.Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.util.Date createTime) {
        this.createTime = createTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}

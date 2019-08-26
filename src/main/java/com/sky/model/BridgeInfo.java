package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * 桥梁信息表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("bridge_info")
public class BridgeInfo extends Model<BridgeInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 省
     */
    private String prv;
    /**
     * 市
     */
    private String cty;
    /**
     * 县
     */
    private String cnt;
    /**
     * 镇
     */
    private String twn;
    /**
     * 行政编码
     */
    private String addvcd;
    /**
     * 行政区名称
     */
    private String addvnm;
    /**
     * 桥梁名称
     */
    @TableField(value="BR_NAME")
    private String brName;
    /**
     * 所在河道
     */
    private String rv;
    /**
     * 桥长
     */
    @TableField(value="BR_LEN")
    private String brLen;
    /**
     * 桥宽
     */
    @TableField(value="BR_WID")
    private String brWid;
    /**
     * 桥高
     */
    @TableField(value="BR_HIGHT")
    private String brHight;
    /**
     * 桥梁类型
     */
    @TableField(value="BR_TYPE")
    private String brType;
    /**
     * 经度
     */
    private String lgtd;
    /**
     * 纬度
     */
    private String lttd;
    /**
     * 备注
     */
    private String comments;
    /**
     * 
     */
    private String dscd;
    /**
     * 
     */
    private String delflag;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrv() {
        return prv;
    }

    public void setPrv(String prv) {
        this.prv = prv;
    }

    public String getCty() {
        return cty;
    }

    public void setCty(String cty) {
        this.cty = cty;
    }

    public String getCnt() {
        return cnt;
    }

    public void setCnt(String cnt) {
        this.cnt = cnt;
    }

    public String getTwn() {
        return twn;
    }

    public void setTwn(String twn) {
        this.twn = twn;
    }

    public String getAddvcd() {
        return addvcd;
    }

    public void setAddvcd(String addvcd) {
        this.addvcd = addvcd;
    }

    public String getAddvnm() {
        return addvnm;
    }

    public void setAddvnm(String addvnm) {
        this.addvnm = addvnm;
    }

    public String getBrName() {
        return brName;
    }

    public void setBrName(String brName) {
        this.brName = brName;
    }

    public String getRv() {
        return rv;
    }

    public void setRv(String rv) {
        this.rv = rv;
    }

    public String getBrLen() {
        return brLen;
    }

    public void setBrLen(String brLen) {
        this.brLen = brLen;
    }

    public String getBrWid() {
        return brWid;
    }

    public void setBrWid(String brWid) {
        this.brWid = brWid;
    }

    public String getBrHight() {
        return brHight;
    }

    public void setBrHight(String brHight) {
        this.brHight = brHight;
    }

    public String getBrType() {
        return brType;
    }

    public void setBrType(String brType) {
        this.brType = brType;
    }

    public String getLgtd() {
        return lgtd;
    }

    public void setLgtd(String lgtd) {
        this.lgtd = lgtd;
    }

    public String getLttd() {
        return lttd;
    }

    public void setLttd(String lttd) {
        this.lttd = lttd;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getDscd() {
        return dscd;
    }

    public void setDscd(String dscd) {
        this.dscd = dscd;
    }

    public String getDelflag() {
        return delflag;
    }

    public void setDelflag(String delflag) {
        this.delflag = delflag;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}

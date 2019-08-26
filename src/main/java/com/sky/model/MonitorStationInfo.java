package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）水雨情监测站点表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("monitor_station_info")
public class MonitorStationInfo extends Model<MonitorStationInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 测站名称
     */
    private String stnm;
    /**
     * 测站编码
     */
    private String stcd;
    /**
     * 所在镇（街）
     */
    private String twn;
    /**
     * 站址
     */
    private String add;
    /**
     * 所在河流
     */
    private String rv;
    /**
     * 测站类型
     */
    @TableField(value="ST_TYPE")
    private String stType;
    /**
     * 建站时间
     */
    private String esdt;
    /**
     * 隶属单位
     */
    private String addc;
    /**
     * 备注
     */
    private String commrnts;
    /**
     * 
     */
    private String lgtd;
    /**
     * 
     */
    private String lttd;
    /**
     * 
     */
    private String cty;
    /**
     * 
     */
    private String cnt;
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

    public String getStnm() {
        return stnm;
    }

    public void setStnm(String stnm) {
        this.stnm = stnm;
    }

    public String getStcd() {
        return stcd;
    }

    public void setStcd(String stcd) {
        this.stcd = stcd;
    }

    public String getTwn() {
        return twn;
    }

    public void setTwn(String twn) {
        this.twn = twn;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getRv() {
        return rv;
    }

    public void setRv(String rv) {
        this.rv = rv;
    }

    public String getStType() {
        return stType;
    }

    public void setStType(String stType) {
        this.stType = stType;
    }

    public String getEsdt() {
        return esdt;
    }

    public void setEsdt(String esdt) {
        this.esdt = esdt;
    }

    public String getAddc() {
        return addc;
    }

    public void setAddc(String addc) {
        this.addc = addc;
    }

    public String getCommrnts() {
        return commrnts;
    }

    public void setCommrnts(String commrnts) {
        this.commrnts = commrnts;
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

package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）山洪灾害防治区涵洞信息表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("handong_info")
public class HandongInfo extends Model<HandongInfo> {

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
     * 村
     */
    private String vl;
    /**
     * 行政区代码
     */
    private String addvcd;
    /**
     * 行政区名称
     */
    private String addvnm;
    /**
     * 涵洞名称
     */
    @TableField(value="HOLE_NAME")
    private String holeName;
    /**
     * 涵洞类型
     */
    @TableField(value="HOLE_TYPE")
    private String holeType;
    /**
     * 洞身高（m）
     */
    @TableField(value="HOLE_HIGHT")
    private String holeHight;
    /**
     * 洞身宽或直径（m）
     */
    @TableField(value="HOLE_WID")
    private String holeWid;
    /**
     * 经度
     */
    private String lgtd;
    /**
     * 纬度
     */
    private String lttd;
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

    public String getVl() {
        return vl;
    }

    public void setVl(String vl) {
        this.vl = vl;
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

    public String getHoleName() {
        return holeName;
    }

    public void setHoleName(String holeName) {
        this.holeName = holeName;
    }

    public String getHoleType() {
        return holeType;
    }

    public void setHoleType(String holeType) {
        this.holeType = holeType;
    }

    public String getHoleHight() {
        return holeHight;
    }

    public void setHoleHight(String holeHight) {
        this.holeHight = holeHight;
    }

    public String getHoleWid() {
        return holeWid;
    }

    public void setHoleWid(String holeWid) {
        this.holeWid = holeWid;
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

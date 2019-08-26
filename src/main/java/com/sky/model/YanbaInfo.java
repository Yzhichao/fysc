package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）山洪灾害防治区堰坝信息表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("yanba_info")
public class YanbaInfo extends Model<YanbaInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 
     */
    private String prv;
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
     * 堰坝名称
     */
    @TableField(value="WR_NAME")
    private String wrName;
    /**
     * 所在河道
     */
    private String rv;
    /**
     * 堰坝类型
     */
    @TableField(value="WR_TYPE")
    private String wrType;
    /**
     * 容积
     */
    private String cp;
    /**
     * 坝高
     */
    @TableField(value="DAM_HIGHT")
    private String damHight;
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

    public String getWrName() {
        return wrName;
    }

    public void setWrName(String wrName) {
        this.wrName = wrName;
    }

    public String getRv() {
        return rv;
    }

    public void setRv(String rv) {
        this.rv = rv;
    }

    public String getWrType() {
        return wrType;
    }

    public void setWrType(String wrType) {
        this.wrType = wrType;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getDamHight() {
        return damHight;
    }

    public void setDamHight(String damHight) {
        this.damHight = damHight;
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

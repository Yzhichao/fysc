package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * 
 * </p>
 *
 * @author L
 * @since 2019-07-08
 */
@TableName("base_info")
public class BaseInfo extends Model<BaseInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 
     */
    private String zhen;
    /**
     * 
     */
    @TableField(value="jgwxq_hu")
    private String jgwxqHu;
    /**
     * 
     */
    @TableField(value="jgwxq_ren")
    private String jgwxqRen;
    /**
     * 
     */
    @TableField(value="gwxq_hu")
    private String gwxqHu;
    /**
     * 
     */
    @TableField(value="gwxq_ren")
    private String gwxqRen;
    /**
     * 
     */
    @TableField(value="wxq_hu")
    private String wxqHu;
    /**
     * 
     */
    @TableField(value="wxq_ren")
    private String wxqRen;
    /**
     * 
     */
    private String wxyjgb;
    /**
     * 
     */
    private String ylbjz;
    /**
     * 
     */
    private String swbjz;
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

    public String getZhen() {
        return zhen;
    }

    public void setZhen(String zhen) {
        this.zhen = zhen;
    }

    public String getJgwxqHu() {
        return jgwxqHu;
    }

    public void setJgwxqHu(String jgwxqHu) {
        this.jgwxqHu = jgwxqHu;
    }

    public String getJgwxqRen() {
        return jgwxqRen;
    }

    public void setJgwxqRen(String jgwxqRen) {
        this.jgwxqRen = jgwxqRen;
    }

    public String getGwxqHu() {
        return gwxqHu;
    }

    public void setGwxqHu(String gwxqHu) {
        this.gwxqHu = gwxqHu;
    }

    public String getGwxqRen() {
        return gwxqRen;
    }

    public void setGwxqRen(String gwxqRen) {
        this.gwxqRen = gwxqRen;
    }

    public String getWxqHu() {
        return wxqHu;
    }

    public void setWxqHu(String wxqHu) {
        this.wxqHu = wxqHu;
    }

    public String getWxqRen() {
        return wxqRen;
    }

    public void setWxqRen(String wxqRen) {
        this.wxqRen = wxqRen;
    }

    public String getWxyjgb() {
        return wxyjgb;
    }

    public void setWxyjgb(String wxyjgb) {
        this.wxyjgb = wxyjgb;
    }

    public String getYlbjz() {
        return ylbjz;
    }

    public void setYlbjz(String ylbjz) {
        this.ylbjz = ylbjz;
    }

    public String getSwbjz() {
        return swbjz;
    }

    public void setSwbjz(String swbjz) {
        this.swbjz = swbjz;
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

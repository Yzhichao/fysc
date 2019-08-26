package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）水电站信息表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("water_elec_info")
public class WaterElecInfo extends Model<WaterElecInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 
     */
    private String name;
    /**
     * 水资源三级分区
     */
    private String tldwr;
    /**
     * 水电站类型
     */
    private String ptype;
    /**
     * 工程状态
     */
    private String prst;
    /**
     * 工程等级
     */
    private String prgrd;
    /**
     * 装机容量(kW)
     */
    private String ic;
    /**
     * 保证出力(kW)
     */
    private String fp;
    /**
     * 额定水头(m)
     */
    private String rh;
    /**
     * 机组台数(台)
     */
    private String ut;
    /**
     * 多年平均发电量(万kW•h)
     */
    private String aaeo;
    /**
     * 管理单位名称
     */
    private String adnm;
    /**
     * 归口管理单位代码
     */
    private String cadcd;
    /**
     * 是否划界
     */
    private String ds;
    /**
     * 是否确权
     */
    private String dt;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTldwr() {
        return tldwr;
    }

    public void setTldwr(String tldwr) {
        this.tldwr = tldwr;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getPrst() {
        return prst;
    }

    public void setPrst(String prst) {
        this.prst = prst;
    }

    public String getPrgrd() {
        return prgrd;
    }

    public void setPrgrd(String prgrd) {
        this.prgrd = prgrd;
    }

    public String getIc() {
        return ic;
    }

    public void setIc(String ic) {
        this.ic = ic;
    }

    public String getFp() {
        return fp;
    }

    public void setFp(String fp) {
        this.fp = fp;
    }

    public String getRh() {
        return rh;
    }

    public void setRh(String rh) {
        this.rh = rh;
    }

    public String getUt() {
        return ut;
    }

    public void setUt(String ut) {
        this.ut = ut;
    }

    public String getAaeo() {
        return aaeo;
    }

    public void setAaeo(String aaeo) {
        this.aaeo = aaeo;
    }

    public String getAdnm() {
        return adnm;
    }

    public void setAdnm(String adnm) {
        this.adnm = adnm;
    }

    public String getCadcd() {
        return cadcd;
    }

    public void setCadcd(String cadcd) {
        this.cadcd = cadcd;
    }

    public String getDs() {
        return ds;
    }

    public void setDs(String ds) {
        this.ds = ds;
    }

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
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

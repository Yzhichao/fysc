package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）堤防信息表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("difang_info")
public class DifangInfo extends Model<DifangInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 堤防名称
     */
    private String dknm;
    /**
     * 河流岸别
     */
    private String rvbk;
    /**
     * 堤防跨界情况
     */
    private String dkcr;
    /**
     * 堤防类型
     */
    private String dktype;
    /**
     * 堤防型式
     */
    private String dktype1;
    /**
     * 工程状态
     */
    private String prst;
    /**
     * 规划防洪标准(年)
     */
    private String plflst;
    /**
     * 堤防长度(m)
     */
    private String dklen;
    /**
     * 达到规划标准长度
     */
    private String acpllen;
    /**
     * 归口管理部门代码
     */
    private String cadcd;
    /**
     * 管理单位名称
     */
    private String adnm;
    /**
     * 是否划界
     */
    private String ds;
    /**
     * 是否确界
     */
    private String dt;
    /**
     * 所在市
     */
    private String prv;
    /**
     * 所在县（市、区）
     */
    private String cty;
    /**
     * 镇、街
     */
    private String twn;
    /**
     * 堤防全名
     */
    private String dktnm;
    /**
     * 起x
     */
    private String stlgtd;
    /**
     * 起y
     */
    private String stlttd;
    /**
     * 终x
     */
    private String endlgtd;
    /**
     * 终y
     */
    private String endlttd;
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

    public String getDknm() {
        return dknm;
    }

    public void setDknm(String dknm) {
        this.dknm = dknm;
    }

    public String getRvbk() {
        return rvbk;
    }

    public void setRvbk(String rvbk) {
        this.rvbk = rvbk;
    }

    public String getDkcr() {
        return dkcr;
    }

    public void setDkcr(String dkcr) {
        this.dkcr = dkcr;
    }

    public String getDktype() {
        return dktype;
    }

    public void setDktype(String dktype) {
        this.dktype = dktype;
    }

    public String getDktype1() {
        return dktype1;
    }

    public void setDktype1(String dktype1) {
        this.dktype1 = dktype1;
    }

    public String getPrst() {
        return prst;
    }

    public void setPrst(String prst) {
        this.prst = prst;
    }

    public String getPlflst() {
        return plflst;
    }

    public void setPlflst(String plflst) {
        this.plflst = plflst;
    }

    public String getDklen() {
        return dklen;
    }

    public void setDklen(String dklen) {
        this.dklen = dklen;
    }

    public String getAcpllen() {
        return acpllen;
    }

    public void setAcpllen(String acpllen) {
        this.acpllen = acpllen;
    }

    public String getCadcd() {
        return cadcd;
    }

    public void setCadcd(String cadcd) {
        this.cadcd = cadcd;
    }

    public String getAdnm() {
        return adnm;
    }

    public void setAdnm(String adnm) {
        this.adnm = adnm;
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

    public String getTwn() {
        return twn;
    }

    public void setTwn(String twn) {
        this.twn = twn;
    }

    public String getDktnm() {
        return dktnm;
    }

    public void setDktnm(String dktnm) {
        this.dktnm = dktnm;
    }

    public String getStlgtd() {
        return stlgtd;
    }

    public void setStlgtd(String stlgtd) {
        this.stlgtd = stlgtd;
    }

    public String getStlttd() {
        return stlttd;
    }

    public void setStlttd(String stlttd) {
        this.stlttd = stlttd;
    }

    public String getEndlgtd() {
        return endlgtd;
    }

    public void setEndlgtd(String endlgtd) {
        this.endlgtd = endlgtd;
    }

    public String getEndlttd() {
        return endlttd;
    }

    public void setEndlttd(String endlttd) {
        this.endlttd = endlttd;
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
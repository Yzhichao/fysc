package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）地质灾害隐患点情况表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("danger_points_info")
public class DangerPointsInfo extends Model<DangerPointsInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 村
     */
    private String vl;
    /**
     * 隐患点（片)位置
     */
    private String add;
    /**
     * 所在市
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
     * 灾害类型
     */
    private String dstype;
    /**
     * 经度
     */
    private String lgtd;
    /**
     * 纬度
     */
    private String lttd;
    /**
     * 灾害体规模
     */
    private String dssc;
    /**
     * 稳定性
     */
    private String st;
    /**
     * 受威胁人数
     */
    private String thpp;
    /**
     * 潜在经济损失（万元）
     */
    private String lsec;
    /**
     * 监测人
     */
    private String mndof;
    /**
     * 联系电话
     */
    private String tell;
    /**
     * 防治对策
     */
    private String prms;
    /**
     * 备注
     */
    private String comments;
    /**
     * 行政村
     */
    private String advil;
    /**
     * 村组
     */
    private String gr;
    /**
     * 重要设施及企业
     */
    private String imfc;
    /**
     * 责任主体
     */
    private String subtl;
    /**
     * 实施单位
     */
    private String exsc;
    /**
     * 整治目标
     */
    private String rntr;
    /**
     * 是否完成
     */
    private String cm;
    /**
     * 监管单位
     */
    private String rgsc;
    /**
     * 
     */
    private String rntr1;
    /**
     * 整治措施
     */
    private String rnms;
    /**
     * 完成期限
     */
    private String ddl;
    /**
     * 进展情况
     */
    private String prg;
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

    public String getVl() {
        return vl;
    }

    public void setVl(String vl) {
        this.vl = vl;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
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

    public String getDstype() {
        return dstype;
    }

    public void setDstype(String dstype) {
        this.dstype = dstype;
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

    public String getDssc() {
        return dssc;
    }

    public void setDssc(String dssc) {
        this.dssc = dssc;
    }

    public String getSt() {
        return st;
    }

    public void setSt(String st) {
        this.st = st;
    }

    public String getThpp() {
        return thpp;
    }

    public void setThpp(String thpp) {
        this.thpp = thpp;
    }

    public String getLsec() {
        return lsec;
    }

    public void setLsec(String lsec) {
        this.lsec = lsec;
    }

    public String getMndof() {
        return mndof;
    }

    public void setMndof(String mndof) {
        this.mndof = mndof;
    }

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getPrms() {
        return prms;
    }

    public void setPrms(String prms) {
        this.prms = prms;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getAdvil() {
        return advil;
    }

    public void setAdvil(String advil) {
        this.advil = advil;
    }

    public String getGr() {
        return gr;
    }

    public void setGr(String gr) {
        this.gr = gr;
    }

    public String getImfc() {
        return imfc;
    }

    public void setImfc(String imfc) {
        this.imfc = imfc;
    }

    public String getSubtl() {
        return subtl;
    }

    public void setSubtl(String subtl) {
        this.subtl = subtl;
    }

    public String getExsc() {
        return exsc;
    }

    public void setExsc(String exsc) {
        this.exsc = exsc;
    }

    public String getRntr() {
        return rntr;
    }

    public void setRntr(String rntr) {
        this.rntr = rntr;
    }

    public String getCm() {
        return cm;
    }

    public void setCm(String cm) {
        this.cm = cm;
    }

    public String getRgsc() {
        return rgsc;
    }

    public void setRgsc(String rgsc) {
        this.rgsc = rgsc;
    }

    public String getRntr1() {
        return rntr1;
    }

    public void setRntr1(String rntr1) {
        this.rntr1 = rntr1;
    }

    public String getRnms() {
        return rnms;
    }

    public void setRnms(String rnms) {
        this.rnms = rnms;
    }

    public String getDdl() {
        return ddl;
    }

    public void setDdl(String ddl) {
        this.ddl = ddl;
    }

    public String getPrg() {
        return prg;
    }

    public void setPrg(String prg) {
        this.prg = prg;
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

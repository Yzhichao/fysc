package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）水闸信息表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("water_gate_info")
public class WaterGateInfo extends Model<WaterGateInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 工程名称
     */
    private String prnm;
    /**
     * 水资源三级分区
     */
    private String tldwr;
    /**
     * 是否为闸站工程
     */
    private String gs;
    /**
     * 是否为套闸工程
     */
    private String ss;
    /**
     * 工程状态
     */
    private String prst;
    /**
     * 工程等级
     */
    private String prgrd;
    /**
     * 闸孔数量(孔)
     */
    @TableField(value="HOLE_NUM")
    private String holeNum;
    /**
     * 闸孔总净宽(m)
     */
    @TableField(value="HOLE_WID")
    private String holeWid;
    /**
     * 副闸闸孔数量(孔)
     */
    @TableField(value="AX_HOLE_NUM")
    private String axHoleNum;
    /**
     * 闸孔总净宽(m)
     */
    @TableField(value="AX_HOLE_WID")
    private String axHoleWid;
    /**
     * 水闸类型
     */
    @TableField(value="GATE_TYPE")
    private String gateType;
    /**
     * 分洪闸过闸流量(m³/s)
     */
    private String fdsq;
    /**
     * 节制闸过闸流量
     */
    private String cgq;
    /**
     * 排水闸过闸流量
     */
    private String dsq;
    /**
     * 挡潮闸过闸流量
     */
    private String tbq;
    /**
     * 橡胶坝坝高
     */
    private String rdh;
    /**
     * 橡胶坝坝长
     */
    private String rdl;
    /**
     * 归口管理部门代码
     */
    private String cadcd;
    /**
     * 管理单位编码
     */
    private String adcd;
    /**
     * 是否划界
     */
    private String ds;
    /**
     * 是否确权
     */
    private String dt;
    /**
     * 管理单位名称
     */
    private String adnm;
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
    private String lgtd;
    /**
     * 
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

    public String getPrnm() {
        return prnm;
    }

    public void setPrnm(String prnm) {
        this.prnm = prnm;
    }

    public String getTldwr() {
        return tldwr;
    }

    public void setTldwr(String tldwr) {
        this.tldwr = tldwr;
    }

    public String getGs() {
        return gs;
    }

    public void setGs(String gs) {
        this.gs = gs;
    }

    public String getSs() {
        return ss;
    }

    public void setSs(String ss) {
        this.ss = ss;
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

    public String getHoleNum() {
        return holeNum;
    }

    public void setHoleNum(String holeNum) {
        this.holeNum = holeNum;
    }

    public String getHoleWid() {
        return holeWid;
    }

    public void setHoleWid(String holeWid) {
        this.holeWid = holeWid;
    }

    public String getAxHoleNum() {
        return axHoleNum;
    }

    public void setAxHoleNum(String axHoleNum) {
        this.axHoleNum = axHoleNum;
    }

    public String getAxHoleWid() {
        return axHoleWid;
    }

    public void setAxHoleWid(String axHoleWid) {
        this.axHoleWid = axHoleWid;
    }

    public String getGateType() {
        return gateType;
    }

    public void setGateType(String gateType) {
        this.gateType = gateType;
    }

    public String getFdsq() {
        return fdsq;
    }

    public void setFdsq(String fdsq) {
        this.fdsq = fdsq;
    }

    public String getCgq() {
        return cgq;
    }

    public void setCgq(String cgq) {
        this.cgq = cgq;
    }

    public String getDsq() {
        return dsq;
    }

    public void setDsq(String dsq) {
        this.dsq = dsq;
    }

    public String getTbq() {
        return tbq;
    }

    public void setTbq(String tbq) {
        this.tbq = tbq;
    }

    public String getRdh() {
        return rdh;
    }

    public void setRdh(String rdh) {
        this.rdh = rdh;
    }

    public String getRdl() {
        return rdl;
    }

    public void setRdl(String rdl) {
        this.rdl = rdl;
    }

    public String getCadcd() {
        return cadcd;
    }

    public void setCadcd(String cadcd) {
        this.cadcd = cadcd;
    }

    public String getAdcd() {
        return adcd;
    }

    public void setAdcd(String adcd) {
        this.adcd = adcd;
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

    public String getAdnm() {
        return adnm;
    }

    public void setAdnm(String adnm) {
        this.adnm = adnm;
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

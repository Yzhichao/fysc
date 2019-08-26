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
 * @since 2019-08-21
 */
@TableName("reservoir_info")
public class ReservoirInfo extends Model<ReservoirInfo> {

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
     * 
     */
    private String fldt;
    /**
     * 
     */
    private String rsname;
    /**
     * 
     */
    private String rsorgname;
    /**
     * 
     */
    private String prst;
    /**
     * 
     */
    private String prsc;
    /**
     * 
     */
    private String prgrd;
    /**
     * 
     */
    private String rsct;
    /**
     * 
     */
    private String rstype;
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
    private String eldtm;
    /**
     * 
     */
    private String bsnm;
    /**
     * 
     */
    private String hnnm;
    /**
     * 
     */
    private String rvnm;
    /**
     * 
     */
    private String mnprcmdt;
    /**
     * 
     */
    private String bgstdt;
    /**
     * 
     */
    private String cmdt;
    /**
     * 
     */
    private String lttrmpdt;
    /**
     * 
     */
    private String lttrstdt;
    /**
     * 
     */
    private String lttrcmdt;
    /**
     * 
     */
    private String sfct;
    /**
     * 
     */
    private String wtrar;
    /**
     * 
     */
    private String mnanw;
    /**
     * 
     */
    private String dsflst;
    /**
     * 
     */
    private String dsq;
    /**
     * 
     */
    private String dsw1;
    /**
     * 
     */
    private String dsw3;
    /**
     * 
     */
    private String dsw7;
    /**
     * 
     */
    private String chflst;
    /**
     * 
     */
    private String chflq;
    /**
     * 
     */
    private String chw1;
    /**
     * 
     */
    private String chw3;
    /**
     * 
     */
    private String chw7;
    /**
     * 
     */
    private String oppr;
    /**
     * 
     */
    private String cpcf;
    /**
     * 
     */
    private String chflz;
    /**
     * 
     */
    private String dsflz;
    /**
     * 
     */
    private String normz;
    /**
     * 
     */
    private String fldz;
    /**
     * 
     */
    private String prfsltdz;
    /**
     * 
     */
    private String mainfsltdz;
    /**
     * 
     */
    private String endfsltdz;
    /**
     * 
     */
    private String ddz;
    /**
     * 
     */
    private String ttcp;
    /**
     * 
     */
    private String fldcp;
    /**
     * 
     */
    private String adjcp;
    /**
     * 
     */
    private String ddcp;
    /**
     * 
     */
    private String sdcp;
    /**
     * 
     */
    private String bcwtlen;
    /**
     * 
     */
    private String dszmxtq;
    /**
     * 
     */
    private String chzmxtq;
    /**
     * 
     */
    private String downstrsftq;
    /**
     * 
     */
    private String ertint;
    /**
     * 
     */
    private String spga;
    /**
     * 
     */
    private String dsssint;
    /**
     * 
     */
    private String cpsrs;
    /**
     * 
     */
    private String mdamqn;
    /**
     * 
     */
    private String axdamqn;
    /**
     * 
     */
    private String mdamtype;
    /**
     * 
     */
    @TableField(value="MD_EL")
    private String mdEl;
    /**
     * 
     */
    @TableField(value="MD_MX_HIG")
    private String mdMxHig;
    /**
     * 
     */
    private String mdcrlen;
    /**
     * 
     */
    private String fldssttype;
    /**
     * 
     */
    private String nrspqn;
    /**
     * 
     */
    private String abnspqn;
    /**
     * 
     */
    private String sptnqn;
    /**
     * 
     */
    private String mptnqn;
    /**
     * 
     */
    private String sddltnqn;
    /**
     * 
     */
    private String wtdvstqn;
    /**
     * 
     */
    private String wtcnstqn;
    /**
     * 
     */
    private String pwstqn;
    /**
     * 
     */
    private String nvstqn;
    /**
     * 
     */
    private String fspsstqn;
    /**
     * 
     */
    private String flcnprpp;
    /**
     * 
     */
    private String flcnprarl;
    /**
     * 
     */
    private String flcnct;
    /**
     * 
     */
    private String flcncty;
    /**
     * 
     */
    private String flcntwn;
    /**
     * 
     */
    private String flcnrd;
    /**
     * 
     */
    private String flcnicf;
    /**
     * 
     */
    private String flcnien;
    /**
     * 
     */
    private String flcnmf;
    /**
     * 
     */
    private String flcnoif;
    /**
     * 
     */
    private String redsirar;
    /**
     * 
     */
    private String frdsirar;
    /**
     * 
     */
    private String rtyaawtdvir;
    /**
     * 
     */
    private String cueirar;
    /**
     * 
     */
    private String rtyaiir;
    /**
     * 
     */
    private String reanwtsp;
    /**
     * 
     */
    private String franwtsp;
    /**
     * 
     */
    private String rtyanwtspqn;
    /**
     * 
     */
    private String rtyanwtspin;
    /**
     * 
     */
    private String rtyaenot;
    /**
     * 
     */
    private String rtyaenotin;
    /**
     * 
     */
    private String rtyatr;
    /**
     * 
     */
    private String rtyatrin;
    /**
     * 
     */
    private String rtyrsotin;
    /**
     * 
     */
    private String addpnt;
    /**
     * 
     */
    private String rtyametex;
    /**
     * 
     */
    private String fs;
    /**
     * 
     */
    private String sr;
    /**
     * 
     */
    private String addpp;
    /**
     * 
     */
    private String abclp;
    /**
     * 
     */
    private String abengp;
    /**
     * 
     */
    private String icfsp;
    /**
     * 
     */
    private String sps;
    /**
     * 
     */
    private String dsscc;
    /**
     * 
     */
    private String dtscc;
    /**
     * 
     */
    private String dsprsc;
    /**
     * 
     */
    private String spmnmn;
    /**
     * 
     */
    private String hhrz;
    /**
     * 
     */
    private String hhrzdt;
    /**
     * 
     */
    private String hlrz;
    /**
     * 
     */
    private String hlrzdt;
    /**
     * 
     */
    private String hmxinq;
    /**
     * 
     */
    private String hmxinqdt;
    /**
     * 
     */
    private String hmxotq;
    /**
     * 
     */
    private String hmxotqdt;
    /**
     * 
     */
    private String mswtmt;
    /**
     * 
     */
    private String msprmt;
    /**
     * 
     */
    private String ininqn;
    /**
     * 
     */
    private String sninrt;
    /**
     * 
     */
    private String rrancy;
    /**
     * 
     */
    private String lrrtm;
    /**
     * 
     */
    private String mdamxst;
    /**
     * 
     */
    private String mdamxlk;
    /**
     * 
     */
    private String mdamhd;
    /**
     * 
     */
    private String axdammxlk;
    /**
     * 
     */
    private String idtm;
    /**
     * 
     */
    private String liddt;
    /**
     * 
     */
    private String lidaddp;
    /**
     * 
     */
    private String lidcn;
    /**
     * 
     */
    private String mdop;
    /**
     * 
     */
    private String mdhd;
    /**
     * 
     */
    private String mdsl;
    /**
     * 
     */
    private String rsmddcdt;
    /**
     * 
     */
    private String adadop;
    /**
     * 
     */
    private String adhd;
    /**
     * 
     */
    private String adsl;
    /**
     * 
     */
    private String adaddt;
    /**
     * 
     */
    private String rgadadop;
    /**
     * 
     */
    private String rgadhd;
    /**
     * 
     */
    private String rgadsl;
    /**
     * 
     */
    private String rgadaddt;
    /**
     * 
     */
    private String rgnum;
    /**
     * 
     */
    private String rgtype;
    /**
     * 
     */
    private String rgst;
    /**
     * 
     */
    private String crdt;
    /**
     * 
     */
    private String mdnm;
    /**
     * 
     */
    private String mdpc;
    /**
     * 
     */
    private String mdhd1;
    /**
     * 
     */
    private String mdcn;
    /**
     * 
     */
    private String mdcad;
    /**
     * 
     */
    private String mdtell;
    /**
     * 
     */
    private String mdmb;
    /**
     * 
     */
    private String mdfax;
    /**
     * 
     */
    private String mdemail;
    /**
     * 
     */
    private String adnm;
    /**
     * 
     */
    private String adpc;
    /**
     * 
     */
    private String adcn;
    /**
     * 
     */
    private String adcad;
    /**
     * 
     */
    private String adtell;
    /**
     * 
     */
    private String admb;
    /**
     * 
     */
    private String adfax;
    /**
     * 
     */
    private String ademail;
    /**
     * 
     */
    private String rsrginnm;
    /**
     * 
     */
    private String rsrginpc;
    /**
     * 
     */
    private String rsrgincn;
    /**
     * 
     */
    private String rsrgincad;
    /**
     * 
     */
    private String rsrgintell;
    /**
     * 
     */
    private String rsrginmb;
    /**
     * 
     */
    private String rsrginfax;
    /**
     * 
     */
    private String rsrginemail;
    /**
     * 
     */
    private String rsfn;
    /**
     * 
     */
    private String mswtpr;
    /**
     * 
     */
    private String msprpr;
    /**
     * 
     */
    private String gs;


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

    public String getFldt() {
        return fldt;
    }

    public void setFldt(String fldt) {
        this.fldt = fldt;
    }

    public String getRsname() {
        return rsname;
    }

    public void setRsname(String rsname) {
        this.rsname = rsname;
    }

    public String getRsorgname() {
        return rsorgname;
    }

    public void setRsorgname(String rsorgname) {
        this.rsorgname = rsorgname;
    }

    public String getPrst() {
        return prst;
    }

    public void setPrst(String prst) {
        this.prst = prst;
    }

    public String getPrsc() {
        return prsc;
    }

    public void setPrsc(String prsc) {
        this.prsc = prsc;
    }

    public String getPrgrd() {
        return prgrd;
    }

    public void setPrgrd(String prgrd) {
        this.prgrd = prgrd;
    }

    public String getRsct() {
        return rsct;
    }

    public void setRsct(String rsct) {
        this.rsct = rsct;
    }

    public String getRstype() {
        return rstype;
    }

    public void setRstype(String rstype) {
        this.rstype = rstype;
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


    public String getEldtm() {
        return eldtm;
    }

    public void setEldtm(String eldtm) {
        this.eldtm = eldtm;
    }

    public String getBsnm() {
        return bsnm;
    }

    public void setBsnm(String bsnm) {
        this.bsnm = bsnm;
    }

    public String getHnnm() {
        return hnnm;
    }

    public void setHnnm(String hnnm) {
        this.hnnm = hnnm;
    }

    public String getRvnm() {
        return rvnm;
    }

    public void setRvnm(String rvnm) {
        this.rvnm = rvnm;
    }

    public String getMnprcmdt() {
        return mnprcmdt;
    }

    public void setMnprcmdt(String mnprcmdt) {
        this.mnprcmdt = mnprcmdt;
    }

    public String getBgstdt() {
        return bgstdt;
    }

    public void setBgstdt(String bgstdt) {
        this.bgstdt = bgstdt;
    }

    public String getCmdt() {
        return cmdt;
    }

    public void setCmdt(String cmdt) {
        this.cmdt = cmdt;
    }

    public String getLttrmpdt() {
        return lttrmpdt;
    }

    public void setLttrmpdt(String lttrmpdt) {
        this.lttrmpdt = lttrmpdt;
    }

    public String getLttrstdt() {
        return lttrstdt;
    }

    public void setLttrstdt(String lttrstdt) {
        this.lttrstdt = lttrstdt;
    }

    public String getLttrcmdt() {
        return lttrcmdt;
    }

    public void setLttrcmdt(String lttrcmdt) {
        this.lttrcmdt = lttrcmdt;
    }

    public String getSfct() {
        return sfct;
    }

    public void setSfct(String sfct) {
        this.sfct = sfct;
    }

    public String getWtrar() {
        return wtrar;
    }

    public void setWtrar(String wtrar) {
        this.wtrar = wtrar;
    }

    public String getMnanw() {
        return mnanw;
    }

    public void setMnanw(String mnanw) {
        this.mnanw = mnanw;
    }

    public String getDsflst() {
        return dsflst;
    }

    public void setDsflst(String dsflst) {
        this.dsflst = dsflst;
    }

    public String getDsq() {
        return dsq;
    }

    public void setDsq(String dsq) {
        this.dsq = dsq;
    }

    public String getDsw1() {
        return dsw1;
    }

    public void setDsw1(String dsw1) {
        this.dsw1 = dsw1;
    }

    public String getDsw3() {
        return dsw3;
    }

    public void setDsw3(String dsw3) {
        this.dsw3 = dsw3;
    }

    public String getDsw7() {
        return dsw7;
    }

    public void setDsw7(String dsw7) {
        this.dsw7 = dsw7;
    }

    public String getChflst() {
        return chflst;
    }

    public void setChflst(String chflst) {
        this.chflst = chflst;
    }

    public String getChflq() {
        return chflq;
    }

    public void setChflq(String chflq) {
        this.chflq = chflq;
    }

    public String getChw1() {
        return chw1;
    }

    public void setChw1(String chw1) {
        this.chw1 = chw1;
    }

    public String getChw3() {
        return chw3;
    }

    public void setChw3(String chw3) {
        this.chw3 = chw3;
    }

    public String getChw7() {
        return chw7;
    }

    public void setChw7(String chw7) {
        this.chw7 = chw7;
    }

    public String getOppr() {
        return oppr;
    }

    public void setOppr(String oppr) {
        this.oppr = oppr;
    }

    public String getCpcf() {
        return cpcf;
    }

    public void setCpcf(String cpcf) {
        this.cpcf = cpcf;
    }

    public String getChflz() {
        return chflz;
    }

    public void setChflz(String chflz) {
        this.chflz = chflz;
    }

    public String getDsflz() {
        return dsflz;
    }

    public void setDsflz(String dsflz) {
        this.dsflz = dsflz;
    }

    public String getNormz() {
        return normz;
    }

    public void setNormz(String normz) {
        this.normz = normz;
    }

    public String getFldz() {
        return fldz;
    }

    public void setFldz(String fldz) {
        this.fldz = fldz;
    }

    public String getPrfsltdz() {
        return prfsltdz;
    }

    public void setPrfsltdz(String prfsltdz) {
        this.prfsltdz = prfsltdz;
    }

    public String getMainfsltdz() {
        return mainfsltdz;
    }

    public void setMainfsltdz(String mainfsltdz) {
        this.mainfsltdz = mainfsltdz;
    }

    public String getEndfsltdz() {
        return endfsltdz;
    }

    public void setEndfsltdz(String endfsltdz) {
        this.endfsltdz = endfsltdz;
    }

    public String getDdz() {
        return ddz;
    }

    public void setDdz(String ddz) {
        this.ddz = ddz;
    }

    public String getTtcp() {
        return ttcp;
    }

    public void setTtcp(String ttcp) {
        this.ttcp = ttcp;
    }

    public String getFldcp() {
        return fldcp;
    }

    public void setFldcp(String fldcp) {
        this.fldcp = fldcp;
    }

    public String getAdjcp() {
        return adjcp;
    }

    public void setAdjcp(String adjcp) {
        this.adjcp = adjcp;
    }

    public String getDdcp() {
        return ddcp;
    }

    public void setDdcp(String ddcp) {
        this.ddcp = ddcp;
    }

    public String getSdcp() {
        return sdcp;
    }

    public void setSdcp(String sdcp) {
        this.sdcp = sdcp;
    }

    public String getBcwtlen() {
        return bcwtlen;
    }

    public void setBcwtlen(String bcwtlen) {
        this.bcwtlen = bcwtlen;
    }

    public String getDszmxtq() {
        return dszmxtq;
    }

    public void setDszmxtq(String dszmxtq) {
        this.dszmxtq = dszmxtq;
    }

    public String getChzmxtq() {
        return chzmxtq;
    }

    public void setChzmxtq(String chzmxtq) {
        this.chzmxtq = chzmxtq;
    }

    public String getDownstrsftq() {
        return downstrsftq;
    }

    public void setDownstrsftq(String downstrsftq) {
        this.downstrsftq = downstrsftq;
    }

    public String getErtint() {
        return ertint;
    }

    public void setErtint(String ertint) {
        this.ertint = ertint;
    }

    public String getSpga() {
        return spga;
    }

    public void setSpga(String spga) {
        this.spga = spga;
    }

    public String getDsssint() {
        return dsssint;
    }

    public void setDsssint(String dsssint) {
        this.dsssint = dsssint;
    }

    public String getCpsrs() {
        return cpsrs;
    }

    public void setCpsrs(String cpsrs) {
        this.cpsrs = cpsrs;
    }

    public String getMdamqn() {
        return mdamqn;
    }

    public void setMdamqn(String mdamqn) {
        this.mdamqn = mdamqn;
    }

    public String getAxdamqn() {
        return axdamqn;
    }

    public void setAxdamqn(String axdamqn) {
        this.axdamqn = axdamqn;
    }

    public String getMdamtype() {
        return mdamtype;
    }

    public void setMdamtype(String mdamtype) {
        this.mdamtype = mdamtype;
    }

    public String getMdEl() {
        return mdEl;
    }

    public void setMdEl(String mdEl) {
        this.mdEl = mdEl;
    }

    public String getMdMxHig() {
        return mdMxHig;
    }

    public void setMdMxHig(String mdMxHig) {
        this.mdMxHig = mdMxHig;
    }

    public String getMdcrlen() {
        return mdcrlen;
    }

    public void setMdcrlen(String mdcrlen) {
        this.mdcrlen = mdcrlen;
    }

    public String getFldssttype() {
        return fldssttype;
    }

    public void setFldssttype(String fldssttype) {
        this.fldssttype = fldssttype;
    }

    public String getNrspqn() {
        return nrspqn;
    }

    public void setNrspqn(String nrspqn) {
        this.nrspqn = nrspqn;
    }

    public String getAbnspqn() {
        return abnspqn;
    }

    public void setAbnspqn(String abnspqn) {
        this.abnspqn = abnspqn;
    }

    public String getSptnqn() {
        return sptnqn;
    }

    public void setSptnqn(String sptnqn) {
        this.sptnqn = sptnqn;
    }

    public String getMptnqn() {
        return mptnqn;
    }

    public void setMptnqn(String mptnqn) {
        this.mptnqn = mptnqn;
    }

    public String getSddltnqn() {
        return sddltnqn;
    }

    public void setSddltnqn(String sddltnqn) {
        this.sddltnqn = sddltnqn;
    }

    public String getWtdvstqn() {
        return wtdvstqn;
    }

    public void setWtdvstqn(String wtdvstqn) {
        this.wtdvstqn = wtdvstqn;
    }

    public String getWtcnstqn() {
        return wtcnstqn;
    }

    public void setWtcnstqn(String wtcnstqn) {
        this.wtcnstqn = wtcnstqn;
    }

    public String getPwstqn() {
        return pwstqn;
    }

    public void setPwstqn(String pwstqn) {
        this.pwstqn = pwstqn;
    }

    public String getNvstqn() {
        return nvstqn;
    }

    public void setNvstqn(String nvstqn) {
        this.nvstqn = nvstqn;
    }

    public String getFspsstqn() {
        return fspsstqn;
    }

    public void setFspsstqn(String fspsstqn) {
        this.fspsstqn = fspsstqn;
    }

    public String getFlcnprpp() {
        return flcnprpp;
    }

    public void setFlcnprpp(String flcnprpp) {
        this.flcnprpp = flcnprpp;
    }

    public String getFlcnprarl() {
        return flcnprarl;
    }

    public void setFlcnprarl(String flcnprarl) {
        this.flcnprarl = flcnprarl;
    }

    public String getFlcnct() {
        return flcnct;
    }

    public void setFlcnct(String flcnct) {
        this.flcnct = flcnct;
    }

    public String getFlcncty() {
        return flcncty;
    }

    public void setFlcncty(String flcncty) {
        this.flcncty = flcncty;
    }

    public String getFlcntwn() {
        return flcntwn;
    }

    public void setFlcntwn(String flcntwn) {
        this.flcntwn = flcntwn;
    }

    public String getFlcnrd() {
        return flcnrd;
    }

    public void setFlcnrd(String flcnrd) {
        this.flcnrd = flcnrd;
    }

    public String getFlcnicf() {
        return flcnicf;
    }

    public void setFlcnicf(String flcnicf) {
        this.flcnicf = flcnicf;
    }

    public String getFlcnien() {
        return flcnien;
    }

    public void setFlcnien(String flcnien) {
        this.flcnien = flcnien;
    }

    public String getFlcnmf() {
        return flcnmf;
    }

    public void setFlcnmf(String flcnmf) {
        this.flcnmf = flcnmf;
    }

    public String getFlcnoif() {
        return flcnoif;
    }

    public void setFlcnoif(String flcnoif) {
        this.flcnoif = flcnoif;
    }

    public String getRedsirar() {
        return redsirar;
    }

    public void setRedsirar(String redsirar) {
        this.redsirar = redsirar;
    }

    public String getFrdsirar() {
        return frdsirar;
    }

    public void setFrdsirar(String frdsirar) {
        this.frdsirar = frdsirar;
    }

    public String getRtyaawtdvir() {
        return rtyaawtdvir;
    }

    public void setRtyaawtdvir(String rtyaawtdvir) {
        this.rtyaawtdvir = rtyaawtdvir;
    }

    public String getCueirar() {
        return cueirar;
    }

    public void setCueirar(String cueirar) {
        this.cueirar = cueirar;
    }

    public String getRtyaiir() {
        return rtyaiir;
    }

    public void setRtyaiir(String rtyaiir) {
        this.rtyaiir = rtyaiir;
    }

    public String getReanwtsp() {
        return reanwtsp;
    }

    public void setReanwtsp(String reanwtsp) {
        this.reanwtsp = reanwtsp;
    }

    public String getFranwtsp() {
        return franwtsp;
    }

    public void setFranwtsp(String franwtsp) {
        this.franwtsp = franwtsp;
    }

    public String getRtyanwtspqn() {
        return rtyanwtspqn;
    }

    public void setRtyanwtspqn(String rtyanwtspqn) {
        this.rtyanwtspqn = rtyanwtspqn;
    }

    public String getRtyanwtspin() {
        return rtyanwtspin;
    }

    public void setRtyanwtspin(String rtyanwtspin) {
        this.rtyanwtspin = rtyanwtspin;
    }

    public String getRtyaenot() {
        return rtyaenot;
    }

    public void setRtyaenot(String rtyaenot) {
        this.rtyaenot = rtyaenot;
    }

    public String getRtyaenotin() {
        return rtyaenotin;
    }

    public void setRtyaenotin(String rtyaenotin) {
        this.rtyaenotin = rtyaenotin;
    }

    public String getRtyatr() {
        return rtyatr;
    }

    public void setRtyatr(String rtyatr) {
        this.rtyatr = rtyatr;
    }

    public String getRtyatrin() {
        return rtyatrin;
    }

    public void setRtyatrin(String rtyatrin) {
        this.rtyatrin = rtyatrin;
    }

    public String getRtyrsotin() {
        return rtyrsotin;
    }

    public void setRtyrsotin(String rtyrsotin) {
        this.rtyrsotin = rtyrsotin;
    }

    public String getAddpnt() {
        return addpnt;
    }

    public void setAddpnt(String addpnt) {
        this.addpnt = addpnt;
    }

    public String getRtyametex() {
        return rtyametex;
    }

    public void setRtyametex(String rtyametex) {
        this.rtyametex = rtyametex;
    }

    public String getFs() {
        return fs;
    }

    public void setFs(String fs) {
        this.fs = fs;
    }

    public String getSr() {
        return sr;
    }

    public void setSr(String sr) {
        this.sr = sr;
    }

    public String getAddpp() {
        return addpp;
    }

    public void setAddpp(String addpp) {
        this.addpp = addpp;
    }

    public String getAbclp() {
        return abclp;
    }

    public void setAbclp(String abclp) {
        this.abclp = abclp;
    }

    public String getAbengp() {
        return abengp;
    }

    public void setAbengp(String abengp) {
        this.abengp = abengp;
    }

    public String getIcfsp() {
        return icfsp;
    }

    public void setIcfsp(String icfsp) {
        this.icfsp = icfsp;
    }

    public String getSps() {
        return sps;
    }

    public void setSps(String sps) {
        this.sps = sps;
    }

    public String getDsscc() {
        return dsscc;
    }

    public void setDsscc(String dsscc) {
        this.dsscc = dsscc;
    }

    public String getDtscc() {
        return dtscc;
    }

    public void setDtscc(String dtscc) {
        this.dtscc = dtscc;
    }

    public String getDsprsc() {
        return dsprsc;
    }

    public void setDsprsc(String dsprsc) {
        this.dsprsc = dsprsc;
    }

    public String getSpmnmn() {
        return spmnmn;
    }

    public void setSpmnmn(String spmnmn) {
        this.spmnmn = spmnmn;
    }

    public String getHhrz() {
        return hhrz;
    }

    public void setHhrz(String hhrz) {
        this.hhrz = hhrz;
    }

    public String getHhrzdt() {
        return hhrzdt;
    }

    public void setHhrzdt(String hhrzdt) {
        this.hhrzdt = hhrzdt;
    }

    public String getHlrz() {
        return hlrz;
    }

    public void setHlrz(String hlrz) {
        this.hlrz = hlrz;
    }

    public String getHlrzdt() {
        return hlrzdt;
    }

    public void setHlrzdt(String hlrzdt) {
        this.hlrzdt = hlrzdt;
    }

    public String getHmxinq() {
        return hmxinq;
    }

    public void setHmxinq(String hmxinq) {
        this.hmxinq = hmxinq;
    }

    public String getHmxinqdt() {
        return hmxinqdt;
    }

    public void setHmxinqdt(String hmxinqdt) {
        this.hmxinqdt = hmxinqdt;
    }

    public String getHmxotq() {
        return hmxotq;
    }

    public void setHmxotq(String hmxotq) {
        this.hmxotq = hmxotq;
    }

    public String getHmxotqdt() {
        return hmxotqdt;
    }

    public void setHmxotqdt(String hmxotqdt) {
        this.hmxotqdt = hmxotqdt;
    }

    public String getMswtmt() {
        return mswtmt;
    }

    public void setMswtmt(String mswtmt) {
        this.mswtmt = mswtmt;
    }

    public String getMsprmt() {
        return msprmt;
    }

    public void setMsprmt(String msprmt) {
        this.msprmt = msprmt;
    }

    public String getIninqn() {
        return ininqn;
    }

    public void setIninqn(String ininqn) {
        this.ininqn = ininqn;
    }

    public String getSninrt() {
        return sninrt;
    }

    public void setSninrt(String sninrt) {
        this.sninrt = sninrt;
    }

    public String getRrancy() {
        return rrancy;
    }

    public void setRrancy(String rrancy) {
        this.rrancy = rrancy;
    }

    public String getLrrtm() {
        return lrrtm;
    }

    public void setLrrtm(String lrrtm) {
        this.lrrtm = lrrtm;
    }

    public String getMdamxst() {
        return mdamxst;
    }

    public void setMdamxst(String mdamxst) {
        this.mdamxst = mdamxst;
    }

    public String getMdamxlk() {
        return mdamxlk;
    }

    public void setMdamxlk(String mdamxlk) {
        this.mdamxlk = mdamxlk;
    }

    public String getMdamhd() {
        return mdamhd;
    }

    public void setMdamhd(String mdamhd) {
        this.mdamhd = mdamhd;
    }

    public String getAxdammxlk() {
        return axdammxlk;
    }

    public void setAxdammxlk(String axdammxlk) {
        this.axdammxlk = axdammxlk;
    }

    public String getIdtm() {
        return idtm;
    }

    public void setIdtm(String idtm) {
        this.idtm = idtm;
    }

    public String getLiddt() {
        return liddt;
    }

    public void setLiddt(String liddt) {
        this.liddt = liddt;
    }

    public String getLidaddp() {
        return lidaddp;
    }

    public void setLidaddp(String lidaddp) {
        this.lidaddp = lidaddp;
    }

    public String getLidcn() {
        return lidcn;
    }

    public void setLidcn(String lidcn) {
        this.lidcn = lidcn;
    }

    public String getMdop() {
        return mdop;
    }

    public void setMdop(String mdop) {
        this.mdop = mdop;
    }

    public String getMdhd() {
        return mdhd;
    }

    public void setMdhd(String mdhd) {
        this.mdhd = mdhd;
    }

    public String getMdsl() {
        return mdsl;
    }

    public void setMdsl(String mdsl) {
        this.mdsl = mdsl;
    }

    public String getRsmddcdt() {
        return rsmddcdt;
    }

    public void setRsmddcdt(String rsmddcdt) {
        this.rsmddcdt = rsmddcdt;
    }

    public String getAdadop() {
        return adadop;
    }

    public void setAdadop(String adadop) {
        this.adadop = adadop;
    }

    public String getAdhd() {
        return adhd;
    }

    public void setAdhd(String adhd) {
        this.adhd = adhd;
    }

    public String getAdsl() {
        return adsl;
    }

    public void setAdsl(String adsl) {
        this.adsl = adsl;
    }

    public String getAdaddt() {
        return adaddt;
    }

    public void setAdaddt(String adaddt) {
        this.adaddt = adaddt;
    }

    public String getRgadadop() {
        return rgadadop;
    }

    public void setRgadadop(String rgadadop) {
        this.rgadadop = rgadadop;
    }

    public String getRgadhd() {
        return rgadhd;
    }

    public void setRgadhd(String rgadhd) {
        this.rgadhd = rgadhd;
    }

    public String getRgadsl() {
        return rgadsl;
    }

    public void setRgadsl(String rgadsl) {
        this.rgadsl = rgadsl;
    }

    public String getRgadaddt() {
        return rgadaddt;
    }

    public void setRgadaddt(String rgadaddt) {
        this.rgadaddt = rgadaddt;
    }

    public String getRgnum() {
        return rgnum;
    }

    public void setRgnum(String rgnum) {
        this.rgnum = rgnum;
    }

    public String getRgtype() {
        return rgtype;
    }

    public void setRgtype(String rgtype) {
        this.rgtype = rgtype;
    }

    public String getRgst() {
        return rgst;
    }

    public void setRgst(String rgst) {
        this.rgst = rgst;
    }

    public String getCrdt() {
        return crdt;
    }

    public void setCrdt(String crdt) {
        this.crdt = crdt;
    }

    public String getMdnm() {
        return mdnm;
    }

    public void setMdnm(String mdnm) {
        this.mdnm = mdnm;
    }

    public String getMdpc() {
        return mdpc;
    }

    public void setMdpc(String mdpc) {
        this.mdpc = mdpc;
    }

    public String getMdhd1() {
        return mdhd1;
    }

    public void setMdhd1(String mdhd1) {
        this.mdhd1 = mdhd1;
    }

    public String getMdcn() {
        return mdcn;
    }

    public void setMdcn(String mdcn) {
        this.mdcn = mdcn;
    }

    public String getMdcad() {
        return mdcad;
    }

    public void setMdcad(String mdcad) {
        this.mdcad = mdcad;
    }

    public String getMdtell() {
        return mdtell;
    }

    public void setMdtell(String mdtell) {
        this.mdtell = mdtell;
    }

    public String getMdmb() {
        return mdmb;
    }

    public void setMdmb(String mdmb) {
        this.mdmb = mdmb;
    }

    public String getMdfax() {
        return mdfax;
    }

    public void setMdfax(String mdfax) {
        this.mdfax = mdfax;
    }

    public String getMdemail() {
        return mdemail;
    }

    public void setMdemail(String mdemail) {
        this.mdemail = mdemail;
    }

    public String getAdnm() {
        return adnm;
    }

    public void setAdnm(String adnm) {
        this.adnm = adnm;
    }

    public String getAdpc() {
        return adpc;
    }

    public void setAdpc(String adpc) {
        this.adpc = adpc;
    }

    public String getAdcn() {
        return adcn;
    }

    public void setAdcn(String adcn) {
        this.adcn = adcn;
    }

    public String getAdcad() {
        return adcad;
    }

    public void setAdcad(String adcad) {
        this.adcad = adcad;
    }

    public String getAdtell() {
        return adtell;
    }

    public void setAdtell(String adtell) {
        this.adtell = adtell;
    }

    public String getAdmb() {
        return admb;
    }

    public void setAdmb(String admb) {
        this.admb = admb;
    }

    public String getAdfax() {
        return adfax;
    }

    public void setAdfax(String adfax) {
        this.adfax = adfax;
    }

    public String getAdemail() {
        return ademail;
    }

    public void setAdemail(String ademail) {
        this.ademail = ademail;
    }

    public String getRsrginnm() {
        return rsrginnm;
    }

    public void setRsrginnm(String rsrginnm) {
        this.rsrginnm = rsrginnm;
    }

    public String getRsrginpc() {
        return rsrginpc;
    }

    public void setRsrginpc(String rsrginpc) {
        this.rsrginpc = rsrginpc;
    }

    public String getRsrgincn() {
        return rsrgincn;
    }

    public void setRsrgincn(String rsrgincn) {
        this.rsrgincn = rsrgincn;
    }

    public String getRsrgincad() {
        return rsrgincad;
    }

    public void setRsrgincad(String rsrgincad) {
        this.rsrgincad = rsrgincad;
    }

    public String getRsrgintell() {
        return rsrgintell;
    }

    public void setRsrgintell(String rsrgintell) {
        this.rsrgintell = rsrgintell;
    }

    public String getRsrginmb() {
        return rsrginmb;
    }

    public void setRsrginmb(String rsrginmb) {
        this.rsrginmb = rsrginmb;
    }

    public String getRsrginfax() {
        return rsrginfax;
    }

    public void setRsrginfax(String rsrginfax) {
        this.rsrginfax = rsrginfax;
    }

    public String getRsrginemail() {
        return rsrginemail;
    }

    public void setRsrginemail(String rsrginemail) {
        this.rsrginemail = rsrginemail;
    }

    public String getRsfn() {
        return rsfn;
    }

    public void setRsfn(String rsfn) {
        this.rsfn = rsfn;
    }

    public String getMswtpr() {
        return mswtpr;
    }

    public void setMswtpr(String mswtpr) {
        this.mswtpr = mswtpr;
    }

    public String getMsprpr() {
        return msprpr;
    }

    public void setMsprpr(String msprpr) {
        this.msprpr = msprpr;
    }

    public String getGs() {
        return gs;
    }

    public void setGs(String gs) {
        this.gs = gs;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
    /**
     * 
     */
    private String delflag;
    public String getDelflag() {
        return delflag;
    }

    public void setDelflag(String delflag) {
        this.delflag = delflag;
    }
    /**
     * 
     */
    private String dscd;
    public String getDscd() {
        return dscd;
    }

    public void setDscd(String dscd) {
        this.dscd = dscd;
    }
}

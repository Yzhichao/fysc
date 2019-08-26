package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）避灾点表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("avoide_disaster_point")
public class AvoideDisasterPoint extends Model<AvoideDisasterPoint> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 名称
     */
    private String name;
    /**
     * 位置
     */
    private String add;
    /**
     * 占地面积
     */
    private String area;
    /**
     * 容纳人数
     */
    private String atcp;
    /**
     * 庇护场所等级
     */
    @TableField(value="SH_GRD")
    private String shGrd;
    /**
     * 备注
     */
    private String comments;
    /**
     * 市
     */
    private String cty;
    /**
     * 县区
     */
    private String cnt;
    /**
     * 乡镇
     */
    private String twn;
    /**
     * 社区村
     */
    private String vl;
    /**
     * 庇护场所类型
     */
    @TableField(value="SH_TYPE")
    private String shType;
    /**
     * 管理单位
     */
    private String addp;
    /**
     * 经度
     */
    private String lgtd;
    /**
     * 纬度
     */
    private String lttd;
    /**
     * 服务半径
     */
    @TableField(value="IN_SRR")
    private String inSrr;
    /**
     * 避护场所有效面积（平方米）
     */
    @TableField(value="IN_SH_EFAREA")
    private String inShEfarea;
    /**
     * 避护场所容纳人数（人）
     */
    @TableField(value="IN_SH_ATCP")
    private String inShAtcp;
    /**
     * 是否设置应急避护场所标识系统
     */
    @TableField(value="IN_SHMR")
    private String inShmr;
    /**
     * 人均有效避护面积（平方米）
     */
    @TableField(value="IN_PC_SH_AREA")
    private String inPcShArea;
    /**
     * 服务半径（米）
     */
    @TableField(value="OUT_SRR")
    private String outSrr;
    /**
     * 避护场所建筑面积（平方米）
     */
    @TableField(value="OUT_SH_EFAREA")
    private String outShEfarea;
    /**
     * 避护场所容纳人数（人）
     */
    @TableField(value="OUT_SH_ATCP")
    private String outShAtcp;
    /**
     * 是否设置应急避护场所标识系统
     */
    @TableField(value="OUT_SHMR")
    private String outShmr;
    /**
     * 人均建筑面积（平方米）
     */
    @TableField(value="OUT_PC_SHAREA")
    private String outPcSharea;
    /**
     * 
     */
    private String dscd;
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

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAtcp() {
        return atcp;
    }

    public void setAtcp(String atcp) {
        this.atcp = atcp;
    }

    public String getShGrd() {
        return shGrd;
    }

    public void setShGrd(String shGrd) {
        this.shGrd = shGrd;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
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

    public String getShType() {
        return shType;
    }

    public void setShType(String shType) {
        this.shType = shType;
    }

    public String getAddp() {
        return addp;
    }

    public void setAddp(String addp) {
        this.addp = addp;
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

    public String getInSrr() {
        return inSrr;
    }

    public void setInSrr(String inSrr) {
        this.inSrr = inSrr;
    }

    public String getInShEfarea() {
        return inShEfarea;
    }

    public void setInShEfarea(String inShEfarea) {
        this.inShEfarea = inShEfarea;
    }

    public String getInShAtcp() {
        return inShAtcp;
    }

    public void setInShAtcp(String inShAtcp) {
        this.inShAtcp = inShAtcp;
    }

    public String getInShmr() {
        return inShmr;
    }

    public void setInShmr(String inShmr) {
        this.inShmr = inShmr;
    }

    public String getInPcShArea() {
        return inPcShArea;
    }

    public void setInPcShArea(String inPcShArea) {
        this.inPcShArea = inPcShArea;
    }

    public String getOutSrr() {
        return outSrr;
    }

    public void setOutSrr(String outSrr) {
        this.outSrr = outSrr;
    }

    public String getOutShEfarea() {
        return outShEfarea;
    }

    public void setOutShEfarea(String outShEfarea) {
        this.outShEfarea = outShEfarea;
    }

    public String getOutShAtcp() {
        return outShAtcp;
    }

    public void setOutShAtcp(String outShAtcp) {
        this.outShAtcp = outShAtcp;
    }

    public String getOutShmr() {
        return outShmr;
    }

    public void setOutShmr(String outShmr) {
        this.outShmr = outShmr;
    }

    public String getOutPcSharea() {
        return outPcSharea;
    }

    public void setOutPcSharea(String outPcSharea) {
        this.outPcSharea = outPcSharea;
    }

    public String getDscd() {
        return dscd;
    }

    public void setDscd(String dscd) {
        this.dscd = dscd;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）防汛抢险队伍表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("rescue_group_info")
public class RescueGroupInfo extends Model<RescueGroupInfo> {

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
     * 经度
     */
    private String lgtd;
    /**
     * 
     */
    private String lttd;
    /**
     * 人数
     */
    private String pp;
    /**
     * 所属部
     */
    private String ad;
    /**
     * 负责人
     */
    private String head;
    /**
     * 
     */
    private String tell;
    /**
     * 为民间
     */
    private String folk;
    /**
     * 
     */
    private String comments;
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
     * 队伍级别
     */
    @TableField(value="TR_GRD")
    private String trGrd;
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

    public String getPp() {
        return pp;
    }

    public void setPp(String pp) {
        this.pp = pp;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell;
    }

    public String getFolk() {
        return folk;
    }

    public void setFolk(String folk) {
        this.folk = folk;
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

    public String getTrGrd() {
        return trGrd;
    }

    public void setTrGrd(String trGrd) {
        this.trGrd = trGrd;
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

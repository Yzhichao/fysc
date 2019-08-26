package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）防汛抢险物资仓库表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("goods_repository")
public class GoodsRepository extends Model<GoodsRepository> {

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
     * 经度
     */
    private String lgtd;
    /**
     * 纬度
     */
    private String lttd;
    /**
     * 负责人
     */
    private String head;
    /**
     * 联系电话
     */
    private String tell;
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
     * 仓库级别
     */
    @TableField(value="WR_GRD")
    private String wrGrd;
    /**
     * 位置
     */
    private String add;
    /**
     * 备注
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

    public String getWrGrd() {
        return wrGrd;
    }

    public void setWrGrd(String wrGrd) {
        this.wrGrd = wrGrd;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
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

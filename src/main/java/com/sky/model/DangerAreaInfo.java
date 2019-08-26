package com.sky.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * <p>
 * xx县（区）中小河流雨洪危险区情况表
 * </p>
 *
 * @author L
 * @since 2019-08-21
 */
@TableName("danger_area_info")
public class DangerAreaInfo extends Model<DangerAreaInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 位置
     */
    private String add;
    /**
     * 危险区名
     */
    @TableField(value="DZ_NAME")
    private String dzName;
    /**
     * 易受灾类型
     */
    @TableField(value="AF_TYPE")
    private String afType;
    /**
     * 房屋数量
     */
    @TableField(value="HS_NUM")
    private String hsNum;
    /**
     * 受威胁人数
     */
    private String thpp;
    /**
     * 重要设施、厂矿企业
     */
    private String imfc;
    /**
     * 预警方式（铜锣、手摇报警器）
     */
    @TableField(value="WR_WAY")
    private String wrWay;
    /**
     * 备注
     */
    private String comments;
    /**
     * 所在市
     */
    private String cty;
    /**
     * 所在县（市、区）
     */
    private String cnt;
    /**
     * 所在镇（街）
     */
    private String twn;
    /**
     * 经度
     */
    private String lgtd;
    /**
     * 纬度
     */
    private String lttd;
    /**
     * 最近一次受灾情况
     */
    private String ltaf;
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

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getDzName() {
        return dzName;
    }

    public void setDzName(String dzName) {
        this.dzName = dzName;
    }

    public String getAfType() {
        return afType;
    }

    public void setAfType(String afType) {
        this.afType = afType;
    }

    public String getHsNum() {
        return hsNum;
    }

    public void setHsNum(String hsNum) {
        this.hsNum = hsNum;
    }

    public String getThpp() {
        return thpp;
    }

    public void setThpp(String thpp) {
        this.thpp = thpp;
    }

    public String getImfc() {
        return imfc;
    }

    public void setImfc(String imfc) {
        this.imfc = imfc;
    }

    public String getWrWay() {
        return wrWay;
    }

    public void setWrWay(String wrWay) {
        this.wrWay = wrWay;
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

    public String getLtaf() {
        return ltaf;
    }

    public void setLtaf(String ltaf) {
        this.ltaf = ltaf;
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

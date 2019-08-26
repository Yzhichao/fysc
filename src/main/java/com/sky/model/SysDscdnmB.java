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
 * @since 2019-06-24
 */
@TableName("sys_dscdnm_b")
public class SysDscdnmB implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    private String dscd;
    /**
     * 
     */
    private String dsnm;
    /**
     * 
     */
    private String dsvb;
    /**
     * 
     */
    private String dslevel;
    /**
     * 
     */
    private String dsupcd;
    /**
     * 
     */
    private String isend;
    /**
     * 
     */
    private String bz;
    /**
     * 
     */
    private String dscd2;


    public String getDscd() {
        return dscd;
    }

    public void setDscd(String dscd) {
        this.dscd = dscd;
    }

    public String getDsnm() {
        return dsnm;
    }

    public void setDsnm(String dsnm) {
        this.dsnm = dsnm;
    }

    public String getDsvb() {
        return dsvb;
    }

    public void setDsvb(String dsvb) {
        this.dsvb = dsvb;
    }

    public String getDslevel() {
        return dslevel;
    }

    public void setDslevel(String dslevel) {
        this.dslevel = dslevel;
    }

    public String getDsupcd() {
        return dsupcd;
    }

    public void setDsupcd(String dsupcd) {
        this.dsupcd = dsupcd;
    }

    public String getIsend() {
        return isend;
    }

    public void setIsend(String isend) {
        this.isend = isend;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getDscd2() {
        return dscd2;
    }

    public void setDscd2(String dscd2) {
        this.dscd2 = dscd2;
    }


}

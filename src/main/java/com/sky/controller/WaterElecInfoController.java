package com.sky.controller;

import java.util.Map;
import java.util.HashMap;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sky.commons.base.BaseController;
import com.sky.commons.shiro.ShiroUser;
import com.sky.commons.utils.PageInfo;
import com.sky.model.WaterElecInfo;
import com.sky.service.IWaterElecInfoService;

/**
 * <p>
 * xx县（区）水电站信息表   前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/waterElecInfo")
public class WaterElecInfoController extends BaseController {
    
    @Autowired private IWaterElecInfoService waterElecInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "waterElecInfo/waterElecInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(WaterElecInfo waterElecInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (waterElecInfo.getName() != null) {
            condition.put("name", waterElecInfo.getName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (waterElecInfo.getDscd() != null) {
            condition.put("dscd2", waterElecInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        waterElecInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "waterElecInfo/waterElecInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(WaterElecInfo waterElecInfo) {
        boolean b = waterElecInfoService.insert(waterElecInfo);
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id) {
    	WaterElecInfo waterElecInfo=new WaterElecInfo();
    	waterElecInfo.setId(id);
    	waterElecInfo.setDelflag("1");
        boolean b = waterElecInfoService.updateById(waterElecInfo);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }

    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/editPage")
    public String editPage(Model model, Long id) {
        WaterElecInfo waterElecInfo = waterElecInfoService.selectById(id);
        model.addAttribute("waterElecInfo", waterElecInfo);
        return "waterElecInfo/waterElecInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(WaterElecInfo waterElecInfo) {
        boolean b = waterElecInfoService.updateById(waterElecInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

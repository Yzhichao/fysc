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
import com.sky.model.WaterGateInfo;
import com.sky.service.IWaterGateInfoService;

/**
 * <p>
 * xx县（区）水闸信息表  前端控制器
 * </p>
 * @author L
 * @since 2019-06-24
 */
@Controller
@RequestMapping("/waterGateInfo")
public class WaterGateInfoController extends BaseController {
    
    @Autowired private IWaterGateInfoService waterGateInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "waterGateInfo/waterGateInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(WaterGateInfo waterGateInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (waterGateInfo.getPrnm() != null) {
            condition.put("prnm", waterGateInfo.getPrnm());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (waterGateInfo.getDscd() != null) {
            condition.put("dscd2", waterGateInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        waterGateInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "waterGateInfo/waterGateInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(WaterGateInfo waterGateInfo) {
        boolean b = waterGateInfoService.insert(waterGateInfo);
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
    	WaterGateInfo waterGateInfo=new WaterGateInfo();
    	waterGateInfo.setId(id);
    	waterGateInfo.setDelflag("1");
        boolean b = waterGateInfoService.updateById(waterGateInfo);
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
        WaterGateInfo waterGateInfo = waterGateInfoService.selectById(id);
        model.addAttribute("waterGateInfo", waterGateInfo);
        return "waterGateInfo/waterGateInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(WaterGateInfo waterGateInfo) {
        boolean b = waterGateInfoService.updateById(waterGateInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

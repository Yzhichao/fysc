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
import com.sky.model.DangerPointsInfo;
import com.sky.service.IDangerPointsInfoService;

/**
 * <p>
 * xx县（区）地质灾害隐患点情况表  前端控制器
 * </p>
 * @author L
 * @since 2019-08-21
 */
@Controller
@RequestMapping("/dangerPointsInfo")
public class DangerPointsInfoController extends BaseController {
    
    @Autowired private IDangerPointsInfoService dangerPointsInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "dangerPointsInfo/dangerPointsInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(DangerPointsInfo dangerPointsInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (dangerPointsInfo.getVl() != null) {
            condition.put("vl", dangerPointsInfo.getVl());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (dangerPointsInfo.getDscd() != null) {
            condition.put("dscd2", dangerPointsInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        dangerPointsInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "dangerPointsInfo/dangerPointsInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(DangerPointsInfo dangerPointsInfo) {
        boolean b = dangerPointsInfoService.insert(dangerPointsInfo);
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
    	DangerPointsInfo dangerPointsInfo=new DangerPointsInfo();
    	dangerPointsInfo.setId(id);
    	dangerPointsInfo.setDelflag("1");
        boolean b = dangerPointsInfoService.updateById(dangerPointsInfo);
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
        DangerPointsInfo dangerPointsInfo = dangerPointsInfoService.selectById(id);
        model.addAttribute("dangerPointsInfo", dangerPointsInfo);
        return "dangerPointsInfo/dangerPointsInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(DangerPointsInfo dangerPointsInfo) {
        boolean b = dangerPointsInfoService.updateById(dangerPointsInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

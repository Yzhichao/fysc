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
import com.sky.model.DangerAreaInfo;
import com.sky.service.IDangerAreaInfoService;

/**
 * <p>
 *  xx县（区）中小河流雨洪危险区情况表  前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/dangerAreaInfo")
public class DangerAreaInfoController extends BaseController {
    
    @Autowired private IDangerAreaInfoService dangerAreaInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "dangerAreaInfo/dangerAreaInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(DangerAreaInfo dangerAreaInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (dangerAreaInfo.getDzName() != null) {
            condition.put("dzName", dangerAreaInfo.getDzName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (dangerAreaInfo.getDscd() != null) {
            condition.put("dscd2", dangerAreaInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        dangerAreaInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "dangerAreaInfo/dangerAreaInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(DangerAreaInfo dangerAreaInfo) {
        boolean b = dangerAreaInfoService.insert(dangerAreaInfo);
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
    	DangerAreaInfo dangerAreaInfo=new DangerAreaInfo();
    	dangerAreaInfo.setId(id);
    	dangerAreaInfo.setDelflag("1");
        boolean b = dangerAreaInfoService.updateById(dangerAreaInfo);
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
        DangerAreaInfo dangerAreaInfo = dangerAreaInfoService.selectById(id);
        model.addAttribute("dangerAreaInfo", dangerAreaInfo);
        return "dangerAreaInfo/dangerAreaInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(DangerAreaInfo dangerAreaInfo) {
        boolean b = dangerAreaInfoService.updateById(dangerAreaInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

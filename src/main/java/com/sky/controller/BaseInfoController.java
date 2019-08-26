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
import com.sky.commons.utils.StringUtils;
import com.sky.model.BaseInfo;
import com.sky.service.IBaseInfoService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author L
 * @since 2019-06-24
 */
@Controller
@RequestMapping("/baseInfo")
public class BaseInfoController extends BaseController {
    
    @Autowired private IBaseInfoService baseInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "baseInfo/baseInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(BaseInfo baseInfo, Integer page, Integer rows, String sort,String order) {
    	ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (baseInfo.getZhen() != null) {
            condition.put("zhen", baseInfo.getZhen());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (baseInfo.getDscd() != null) {
            condition.put("dscd2", baseInfo.getDscd().replaceAll("0+$", ""));
        }
        
        pageInfo.setCondition(condition);
        baseInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "baseInfo/baseInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(BaseInfo baseInfo) {
    	baseInfo.setDscd(StringUtils.addZeroForNum(baseInfo.getDscd(),15));
        boolean b = baseInfoService.insert(baseInfo);
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
    	BaseInfo baseInfo=new BaseInfo();
    	baseInfo.setId(id);
    	baseInfo.setDelflag("1");
        boolean b = baseInfoService.updateById(baseInfo);
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
        BaseInfo baseInfo = baseInfoService.selectById(id);
        model.addAttribute("baseInfo", baseInfo);
        return "baseInfo/baseInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(BaseInfo baseInfo) {
    	baseInfo.setDscd(StringUtils.addZeroForNum(baseInfo.getDscd(),15));
        boolean b = baseInfoService.updateById(baseInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
   
}

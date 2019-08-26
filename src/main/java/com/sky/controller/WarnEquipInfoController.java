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
import com.sky.model.WarnEquipInfo;
import com.sky.service.IWarnEquipInfoService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/warnEquipInfo")
public class WarnEquipInfoController extends BaseController {
    
    @Autowired private IWarnEquipInfoService warnEquipInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "warnEquipInfo/warnEquipInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(WarnEquipInfo warnEquipInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (warnEquipInfo.getMc() != null) {
            condition.put("mc", warnEquipInfo.getMc());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (warnEquipInfo.getDscd() != null) {
            condition.put("dscd2", warnEquipInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        warnEquipInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "warnEquipInfo/warnEquipInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(WarnEquipInfo warnEquipInfo) {
    	warnEquipInfo.setDscd(StringUtils.addZeroForNum(warnEquipInfo.getDscd(),15));
        boolean b = warnEquipInfoService.insert(warnEquipInfo);
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
    	WarnEquipInfo warnEquipInfo=new WarnEquipInfo();
    	warnEquipInfo.setId(id);
    	warnEquipInfo.setDelflag("1");
        boolean b = warnEquipInfoService.updateById(warnEquipInfo);
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
        WarnEquipInfo warnEquipInfo = warnEquipInfoService.selectById(id);
        model.addAttribute("warnEquipInfo", warnEquipInfo);
        return "warnEquipInfo/warnEquipInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(WarnEquipInfo warnEquipInfo) {
    	warnEquipInfo.setDscd(StringUtils.addZeroForNum(warnEquipInfo.getDscd(),15));
        boolean b = warnEquipInfoService.updateById(warnEquipInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

package com.sky.controller;

import java.util.Map;
import java.util.HashMap;

import com.sky.commons.annotation.LogAnno;
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
import com.sky.model.RescueGroupInfo;
import com.sky.service.IRescueGroupInfoService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/rescueGroupInfo")
public class RescueGroupInfoController extends BaseController {

    @Autowired private IRescueGroupInfoService rescueGroupInfoService;

    @GetMapping("/manager")
    public String manager() {
        return "rescueGroupInfo/rescueGroupInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(RescueGroupInfo rescueGroupInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (rescueGroupInfo.getName() != null) {
            condition.put("name", rescueGroupInfo.getName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (rescueGroupInfo.getDscd() != null) {
            condition.put("dscd2", rescueGroupInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        rescueGroupInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "rescueGroupInfo/rescueGroupInfoAdd";
    }

    /**
     * 添加
     * @param
     * @return
     */
    @LogAnno(operateType = 1, TableName = "rescue_group_info")
    @PostMapping("/add")
    @ResponseBody
    public Object add(RescueGroupInfo rescueGroupInfo) {
        boolean b = rescueGroupInfoService.insert(rescueGroupInfo);
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
    @LogAnno(operateType = 3, TableName = "rescue_group_info")
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id) {
    	RescueGroupInfo rescueGroupInfo=new RescueGroupInfo();
    	rescueGroupInfo.setId(id);
    	rescueGroupInfo.setDelflag("1");
        boolean b = rescueGroupInfoService.updateById(rescueGroupInfo);
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
        RescueGroupInfo rescueGroupInfo = rescueGroupInfoService.selectById(id);
        model.addAttribute("rescueGroupInfo", rescueGroupInfo);
        return "rescueGroupInfo/rescueGroupInfoEdit";
    }

    /**
     * 编辑
     * @param
     * @return
     */
    @LogAnno(operateType = 2, TableName = "rescue_group_info")
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(RescueGroupInfo rescueGroupInfo) {
        boolean b = rescueGroupInfoService.updateById(rescueGroupInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

}

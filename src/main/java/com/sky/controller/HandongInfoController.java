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
import com.sky.commons.utils.StringUtils;
import com.sky.model.HandongInfo;
import com.sky.service.IHandongInfoService;

/**
 * <p>
 * xx县（区）山洪灾害防治区涵洞信息表  前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/handongInfo")
public class HandongInfoController extends BaseController {

    @Autowired private IHandongInfoService handongInfoService;

    @GetMapping("/manager")
    public String manager() {
        return "handongInfo/handongInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(HandongInfo handongInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (handongInfo.getHoleName() != null) {
            condition.put("holeName", handongInfo.getHoleName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (handongInfo.getDscd() != null) {
            condition.put("dscd2", handongInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        handongInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "handongInfo/handongInfoAdd";
    }

    /**
     * 添加
     * @param
     * @return
     */
    @LogAnno(operateType = 1, TableName = "handong_info")
    @PostMapping("/add")
    @ResponseBody
    public Object add(HandongInfo handongInfo) {
    	handongInfo.setDscd(StringUtils.addZeroForNum(handongInfo.getDscd(),15));
        boolean b = handongInfoService.insert(handongInfo);
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
    @LogAnno(operateType = 3, TableName = "handong_info")
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id) {
    	HandongInfo handongInfo=new HandongInfo();
    	handongInfo.setId(id);
    	handongInfo.setDelflag("1");
        boolean b = handongInfoService.updateById(handongInfo);
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
        HandongInfo handongInfo = handongInfoService.selectById(id);
        model.addAttribute("handongInfo", handongInfo);
        return "handongInfo/handongInfoEdit";
    }

    /**
     * 编辑
     * @param
     * @return
     */
    @LogAnno(operateType = 2, TableName = "handong_info")
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(HandongInfo handongInfo) {
    	handongInfo.setDscd(StringUtils.addZeroForNum(handongInfo.getDscd(),15));
        boolean b = handongInfoService.updateById(handongInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

}

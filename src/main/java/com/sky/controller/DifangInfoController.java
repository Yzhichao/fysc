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
import com.sky.model.DifangInfo;
import com.sky.service.IDifangInfoService;

/**
 * <p>
 * xx县（区）堤防信息表  前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/difangInfo")
public class DifangInfoController extends BaseController {

    @Autowired private IDifangInfoService difangInfoService;

    @GetMapping("/manager")
    public String manager() {
        return "difangInfo/difangInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(DifangInfo difangInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (difangInfo.getDknm() != null) {
            condition.put("dknm", difangInfo.getDknm());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (difangInfo.getDscd() != null) {
            condition.put("dscd2", difangInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        difangInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "difangInfo/difangInfoAdd";
    }

    /**
     * 添加
     * @param
     * @return
     */
    @LogAnno(operateType = 1, TableName = "difang_info")
    @PostMapping("/add")
    @ResponseBody
    public Object add(DifangInfo difangInfo) {
        boolean b = difangInfoService.insert(difangInfo);
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
    @LogAnno(operateType = 3, TableName = "difang_info")
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id) {
    	DifangInfo difangInfo=new DifangInfo();
    	difangInfo.setId(id);
    	difangInfo.setDelflag("1");
        boolean b = difangInfoService.updateById(difangInfo);
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
        DifangInfo difangInfo = difangInfoService.selectById(id);
        model.addAttribute("difangInfo", difangInfo);
        return "difangInfo/difangInfoEdit";
    }

    /**
     * 编辑
     * @param
     * @return
     */
    @LogAnno(operateType = 2, TableName = "difang_info")
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(DifangInfo difangInfo) {
        boolean b = difangInfoService.updateById(difangInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

}

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
import com.sky.model.MonitorStationInfo;
import com.sky.service.IMonitorStationInfoService;

/**
 * <p>
 * xx县（区）水雨情监测站点表   前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/monitorStationInfo")
public class MonitorStationInfoController extends BaseController {

    @Autowired private IMonitorStationInfoService monitorStationInfoService;

    @GetMapping("/manager")
    public String manager() {
        return "monitorStationInfo/monitorStationInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(MonitorStationInfo monitorStationInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (monitorStationInfo.getStnm() != null) {
            condition.put("stnm", monitorStationInfo.getStnm());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (monitorStationInfo.getDscd() != null) {
            condition.put("dscd2", monitorStationInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        monitorStationInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "monitorStationInfo/monitorStationInfoAdd";
    }

    /**
     * 添加
     * @param
     * @return
     */
    @LogAnno(operateType = 1, TableName = "monitor_station_info")
    @PostMapping("/add")
    @ResponseBody
    public Object add(MonitorStationInfo monitorStationInfo) {
        boolean b = monitorStationInfoService.insert(monitorStationInfo);
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
    @LogAnno(operateType = 3, TableName = "monitor_station_info")
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id) {
    	MonitorStationInfo monitorStationInfo=new MonitorStationInfo();
    	monitorStationInfo.setId(id);
    	monitorStationInfo.setDelflag("1");
        boolean b = monitorStationInfoService.updateById(monitorStationInfo);
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
        MonitorStationInfo monitorStationInfo = monitorStationInfoService.selectById(id);
        model.addAttribute("monitorStationInfo", monitorStationInfo);
        return "monitorStationInfo/monitorStationInfoEdit";
    }

    /**
     * 编辑
     * @param
     * @return
     */
    @LogAnno(operateType = 2, TableName = "monitor_station_info")
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(MonitorStationInfo monitorStationInfo) {
        boolean b = monitorStationInfoService.updateById(monitorStationInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

}

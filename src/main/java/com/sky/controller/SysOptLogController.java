package com.sky.controller;

import com.sky.commons.base.BaseController;
import com.sky.commons.utils.PageInfo;
import com.sky.model.SysOptLog;
import com.sky.service.ISysOptLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 系统日志  前端控制器
 * </p>
 * @author L
 * @since 2019-11-11
 */
@Controller
@RequestMapping("/sysOptLog")
public class SysOptLogController extends BaseController {

    @Autowired private ISysOptLogService sysOptLogService;

    @GetMapping("/manager")
    public String manager() {
        return "sysOptLog/sysOptLog";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(SysOptLog sysOptLog, Integer page, Integer rows, String sort,String order) {
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (sysOptLog.getOptTable() != null) {
            condition.put("optTable", sysOptLog.getOptTable());
        }
        if (sysOptLog.getOptType() != null) {
            condition.put("optType", sysOptLog.getOptType());
        }
        pageInfo.setCondition(condition);
        sysOptLogService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "sysOptLog/sysOptLogAdd";
    }

    /**
     * 添加
     * @param
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(SysOptLog sysOptLog) {
        boolean b = sysOptLogService.insert(sysOptLog);
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
    public Object delete(Long id) {
        boolean b = sysOptLogService.deleteById(id);
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
        SysOptLog sysOptLog = sysOptLogService.selectById(id);
        model.addAttribute("sysOptLog", sysOptLog);
        return "sysOptLog/sysOptLogEdit";
    }

    /**
     * 编辑
     * @param
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(SysOptLog sysOptLog) {
        boolean b = sysOptLogService.updateById(sysOptLog);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

}

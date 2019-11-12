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
import com.sky.model.ReservoirInfo;
import com.sky.service.IReservoirInfoService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author L
 * @since 2019-06-24
 */
@Controller
@RequestMapping("/reservoirInfo")
public class ReservoirInfoController extends BaseController {

    @Autowired private IReservoirInfoService reservoirInfoService;

    @GetMapping("/manager")
    public String manager() {
        return "reservoirInfo/reservoirInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(ReservoirInfo reservoirInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (reservoirInfo.getRsname() != null) {
            condition.put("rsname", reservoirInfo.getRsname());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (reservoirInfo.getDscd() != null) {
            condition.put("dscd2", reservoirInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        reservoirInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "reservoirInfo/reservoirInfoAdd";
    }

    /**
     * 添加
     * @param
     * @return
     */
    @LogAnno(operateType = 1, TableName = "reservoir_info")
    @PostMapping("/add")
    @ResponseBody
    public Object add(ReservoirInfo reservoirInfo) {
        boolean b = reservoirInfoService.insert(reservoirInfo);
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
    @LogAnno(operateType = 3, TableName = "reservoir_info")
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id) {
    	ReservoirInfo reservoirInfo=new ReservoirInfo();
    	reservoirInfo.setId(id);
    	reservoirInfo.setDelflag("1");
        boolean b = reservoirInfoService.updateById(reservoirInfo);
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
        ReservoirInfo reservoirInfo = reservoirInfoService.selectById(id);
        model.addAttribute("reservoirInfo", reservoirInfo);
        return "reservoirInfo/reservoirInfoEdit";
    }

    /**
     * 编辑
     * @param
     * @return
     */
    @LogAnno(operateType = 2, TableName = "reservoir_info")
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(ReservoirInfo reservoirInfo) {
        boolean b = reservoirInfoService.updateById(reservoirInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

}

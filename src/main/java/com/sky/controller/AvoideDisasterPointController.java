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
import com.sky.model.AvoideDisasterPoint;
import com.sky.service.IAvoideDisasterPointService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/avoideDisasterPoint")
public class AvoideDisasterPointController extends BaseController {
    
    @Autowired private IAvoideDisasterPointService avoideDisasterPointService;
    
    @GetMapping("/manager")
    public String manager() {
        return "avoideDisasterPoint/avoideDisasterPoint";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(AvoideDisasterPoint avoideDisasterPoint, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (avoideDisasterPoint.getName() != null) {
            condition.put("name", avoideDisasterPoint.getName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (avoideDisasterPoint.getDscd() != null) {
            condition.put("dscd2", avoideDisasterPoint.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        avoideDisasterPointService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "avoideDisasterPoint/avoideDisasterPointAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(AvoideDisasterPoint avoideDisasterPoint) {
        boolean b = avoideDisasterPointService.insert(avoideDisasterPoint);
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
    	AvoideDisasterPoint avoideDisasterPoint=new AvoideDisasterPoint();
    	avoideDisasterPoint.setId(id);
    	avoideDisasterPoint.setDelflag("1");
        boolean b = avoideDisasterPointService.updateById(avoideDisasterPoint);
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
        AvoideDisasterPoint avoideDisasterPoint = avoideDisasterPointService.selectById(id);
        model.addAttribute("avoideDisasterPoint", avoideDisasterPoint);
        return "avoideDisasterPoint/avoideDisasterPointEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(AvoideDisasterPoint avoideDisasterPoint) {
        boolean b = avoideDisasterPointService.updateById(avoideDisasterPoint);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

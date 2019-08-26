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
import com.sky.model.YanbaInfo;
import com.sky.service.IYanbaInfoService;

/**
 * <p>
 * xx县（区）山洪灾害防治区堰坝信息表  前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/yanbaInfo")
public class YanbaInfoController extends BaseController {
    
    @Autowired private IYanbaInfoService yanbaInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "yanbaInfo/yanbaInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(YanbaInfo yanbaInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (yanbaInfo.getWrName() != null) {
            condition.put("wrName", yanbaInfo.getWrName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (yanbaInfo.getDscd() != null) {
            condition.put("dscd2", yanbaInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        yanbaInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "yanbaInfo/yanbaInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(YanbaInfo yanbaInfo) {
        boolean b = yanbaInfoService.insert(yanbaInfo);
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
    	YanbaInfo yanbaInfo=new YanbaInfo();
    	yanbaInfo.setId(id);
    	yanbaInfo.setDelflag("1");
        boolean b = yanbaInfoService.updateById(yanbaInfo);
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
        YanbaInfo yanbaInfo = yanbaInfoService.selectById(id);
        model.addAttribute("yanbaInfo", yanbaInfo);
        return "yanbaInfo/yanbaInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(YanbaInfo yanbaInfo) {
        boolean b = yanbaInfoService.updateById(yanbaInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

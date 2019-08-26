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
import com.sky.model.BridgeInfo;
import com.sky.service.IBridgeInfoService;

/**
 * <p>
 * 桥梁信息表  前端控制器
 * </p>
 * @author L
 * @since 2019-08-21
 */
@Controller
@RequestMapping("/bridgeInfo")
public class BridgeInfoController extends BaseController {
    
    @Autowired private IBridgeInfoService bridgeInfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "bridgeInfo/bridgeInfo";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(BridgeInfo bridgeInfo, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (bridgeInfo.getBrName() != null) {
            condition.put("brName", bridgeInfo.getBrName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (bridgeInfo.getDscd() != null) {
            condition.put("dscd2", bridgeInfo.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        bridgeInfoService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "bridgeInfo/bridgeInfoAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(BridgeInfo bridgeInfo) {
    	bridgeInfo.setDscd(StringUtils.addZeroForNum(bridgeInfo.getDscd(),15));
        boolean b = bridgeInfoService.insert(bridgeInfo);
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
    	BridgeInfo bridgeInfo=new BridgeInfo();
    	bridgeInfo.setId(id);
    	bridgeInfo.setDelflag("1");
        boolean b = bridgeInfoService.updateById(bridgeInfo);
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
        BridgeInfo bridgeInfo = bridgeInfoService.selectById(id);
        model.addAttribute("bridgeInfo", bridgeInfo);
        return "bridgeInfo/bridgeInfoEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(BridgeInfo bridgeInfo) {
    	bridgeInfo.setDscd(StringUtils.addZeroForNum(bridgeInfo.getDscd(),15));
        boolean b = bridgeInfoService.updateById(bridgeInfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

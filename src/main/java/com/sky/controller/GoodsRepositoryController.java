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
import com.sky.model.GoodsRepository;
import com.sky.service.IGoodsRepositoryService;

/**
 * <p>
 * xx县（区）防汛抢险物资仓库表  前端控制器
 * </p>
 * @author L
 * @since 2019-06-25
 */
@Controller
@RequestMapping("/goodsRepository")
public class GoodsRepositoryController extends BaseController {
    
    @Autowired private IGoodsRepositoryService goodsRepositoryService;
    
    @GetMapping("/manager")
    public String manager() {
        return "goodsRepository/goodsRepository";
    }


    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(GoodsRepository goodsRepository, Integer page, Integer rows, String sort,String order) {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
   	 	String dscd=user.getDscd();
   	 	PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (goodsRepository.getName() != null) {
            condition.put("name", goodsRepository.getName());
        }
        if (dscd != null&&!"440000".equals(dscd)) {
            condition.put("dscd", dscd.replaceAll("0+$", ""));
        }
        if (goodsRepository.getDscd() != null) {
            condition.put("dscd2", goodsRepository.getDscd().replaceAll("0+$", ""));
        }
        pageInfo.setCondition(condition);
        goodsRepositoryService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "goodsRepository/goodsRepositoryAdd";
    }

    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(GoodsRepository goodsRepository) {
        boolean b = goodsRepositoryService.insert(goodsRepository);
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
    	GoodsRepository goodsRepository=new GoodsRepository();
    	goodsRepository.setId(id);
    	goodsRepository.setDelflag("1");
        boolean b = goodsRepositoryService.updateById(goodsRepository);
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
        GoodsRepository goodsRepository = goodsRepositoryService.selectById(id);
        model.addAttribute("goodsRepository", goodsRepository);
        return "goodsRepository/goodsRepositoryEdit";
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(GoodsRepository goodsRepository) {
        boolean b = goodsRepositoryService.updateById(goodsRepository);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    
}

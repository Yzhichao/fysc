package com.sky.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sky.commons.utils.CaptchaUtils;

/**
 * 通用的控制器
 * @author L
 *
 */
@Controller
public class CommonsController {

    /**
     * 图标页
     */
    @GetMapping("icons.html")
    public String icons() {
        return "icons";
    }
	
    /**
     * 图形验证码
     */
    @GetMapping("captcha.jpg")
    public void captcha(HttpServletRequest request, HttpServletResponse response) {
        CaptchaUtils.generate(request, response);
    }
    
    
    @GetMapping("/selMap")
    public String selMap() {
        return "map/MyMap";
    }
}

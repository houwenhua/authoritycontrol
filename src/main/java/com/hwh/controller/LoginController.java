package com.hwh.controller;

import com.hwh.exception.CustomException;
import com.hwh.service.SysUserService;
import com.hwh.vo.ActiveUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/loginController")
public class LoginController {

    private static Log log = LogFactory.getLog(LoginController.class);

    @Autowired
    private SysUserService sus;

    @RequestMapping("/login")
    public ModelAndView login(String usercode, String password, HttpSession session){
        log.info(usercode + ":" + password);
        log.info("登录方法进入");
        ModelAndView mav = new ModelAndView();

        //登录认证用户名和密码是否正确
        ActiveUser au = null;
        String message = "登录失败";
        try{
            au = sus.authenticat(usercode,password);
        } catch (CustomException e) {
            message = e.getMessage();
        }
       if(au == null) {
            session.setAttribute("message",message);
            mav.setViewName("redirect:/login.jsp");
            return mav;
       }
       //成功返回
        session.setAttribute("activeUser",au);
        mav.setViewName("redirect:/index.jsp");
        return mav;
    }
}

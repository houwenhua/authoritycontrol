package com.hwh.controller;

import com.alibaba.fastjson.serializer.URLCodec;
import com.hwh.exception.CustomException;
import com.hwh.po.SysUser;
import com.hwh.service.SysUserService;
import com.hwh.vo.ActiveUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@RestController
@RequestMapping("/loginController")
public class LoginController {

    private static Log log = LogFactory.getLog(LoginController.class);

    @Autowired
    private SysUserService sus;

    @RequestMapping("/login")
    public ModelAndView login(String usercode, String password,String rememberme,HttpServletRequest request, HttpSession session,HttpServletResponse response){
        log.info("登录方法进入:" + usercode + ":" + password + ":" + rememberme);
        //记住密码账号
        if(rememberme != null) {
            rememberMe(usercode,password,response);
        } else {
            deleteCookie(request,response);
        }
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

    /**
     * 查询显示所用用户信息
     */
    @RequestMapping("/queryAllUser")
    public List<SysUser> queryAllUser() {
        List<SysUser> list = sus.findAllUser();
        return list;
    }

    /**
     * 使用cookie实现记住密码账号
     * @param usercode
     * @param password
     */
    private void rememberMe(String usercode, String password, HttpServletResponse response) {

        String codeValue = usercode + "," +password;
        Cookie cookie = new Cookie("loginInfo",codeValue);
        //Tomcat下多应用共享
        cookie.setPath("/");
        //如果传入有中文时，需要进行编码，不然会乱码
        try {
            URLEncoder.encode(usercode,"utf-8");
            URLEncoder.encode(password,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //设置过期时间(默认3天)
        cookie.setMaxAge(24*3*60*60);
        //使cookie生效
        response.addCookie(cookie);
    }

    /**
     * 删除cookie
     * @param request
     * @param response
     */
    public void deleteCookie(HttpServletRequest request,HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for(Cookie cookie : cookies) {
                String name = cookie.getName();
                if(name.equals("loginInfo")) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
    }
}

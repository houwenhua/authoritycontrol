package com.hwh.controller;

import com.hwh.exception.CustomException;
import com.hwh.service.SysUserService;
import com.hwh.vo.ActiveUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/loginController")
public class LoginController {

    private static Log log = LogFactory.getLog(LoginController.class);

    @Autowired
    private SysUserService sus;

    @RequestMapping("/login")
    public ActiveUser login(String usercode,String password) throws CustomException {
        log.info(usercode + ":" + password);
        log.info("登录方法进入");

        //登录认证用户名和密码是否正确
        ActiveUser au = sus.authenticat(usercode,password);


        return au;
    }
}

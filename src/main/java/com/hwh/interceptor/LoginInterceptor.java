package com.hwh.interceptor;

import com.hwh.utils.ResourcesUtils;
import com.hwh.vo.ActiveUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录拦截器
 * @author hwh
 * @create 2018/9/17 10:39
 */
public class LoginInterceptor implements HandlerInterceptor{
    private static Log log = LogFactory.getLog(LoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.warn("第一步.............");
        //获得访问的url
        String url = request.getRequestURI();

        //判断是否是公开地址
        //实际开发中需要将公开地址配置在配置文件中
        //从配置文件中取出可以匿名访问的URL
        List<String> open_urls = ResourcesUtils.getKeyList("anonymousURL");
        for(String openUrl : open_urls) {
            if(url.equals(openUrl)) {
                return true;
            }
        }
        //判断用户是否登录
        HttpSession session = request.getSession();
        ActiveUser au = (ActiveUser)session.getAttribute("activeUser");
        if(au != null){
            return true;
        }
        //跳转到登录页面,访问失败
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.warn("第二步.............");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.warn("第三步.............");
    }
}

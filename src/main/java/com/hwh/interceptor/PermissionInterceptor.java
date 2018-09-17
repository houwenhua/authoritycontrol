package com.hwh.interceptor;

import com.hwh.po.SysPermission;
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
 * 权限验证的拦截器
 * @author hwh
 * @create 2018/9/17 15:20
 */
public class PermissionInterceptor implements HandlerInterceptor {
    private static Log log = LogFactory.getLog(PermissionInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.warn("进入权限验证的拦截器，第一步**************");
        //获得访问地址
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

        //从配置文件中取出公用的URL
        List<String> commonURLs = ResourcesUtils.getKeyList("commonURL");
        for(String commonURL : commonURLs) {
            if(url.equals(commonURL)) {
                return true;
            }
        }
        //判断用户是否是私有权限
        HttpSession session = request.getSession();
        ActiveUser au = (ActiveUser)session.getAttribute("activeUser");
        //获得用户权限集合
        List<SysPermission> permissions = au.getPermissions();
        for(SysPermission sp : permissions) {
            //获得用户可以访问的权限
            String permission_url = sp.getUrl();
            if(url.equals(permission_url)) {
                return true;
            }
        }
        //跳转到登录页面,权限都不具有
        request.getRequestDispatcher("/login.jsp").forward(request,response);

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.warn("进入权限验证的拦截器，第二步**************");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.warn("进入权限验证的拦截器，第三步**************");
    }
}


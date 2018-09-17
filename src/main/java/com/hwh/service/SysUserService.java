package com.hwh.service;

import com.hwh.exception.CustomException;
import com.hwh.mapper.SysPermissionMapper;
import com.hwh.mapper.SysUserMapper;
import com.hwh.po.SysPermission;
import com.hwh.po.SysUser;
import com.hwh.utils.MD5;
import com.hwh.vo.ActiveUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 功能描述：用户的service层服务类
 *
 * @Author houwenhua
 * @Date 2018/9/15 21:21
 */
@Service
public class SysUserService {

    private static Log log = LogFactory.getLog(SysUserService.class);

    @Autowired
    private SysUserMapper sum;

    @Autowired
    private SysPermissionMapper spm;

    /**
     * 实现用户登录验证
     * @param usercode
     * @param password
     * @return 用户登录信息
     */
    public ActiveUser authenticat(String usercode,String password) throws CustomException {

        //将密码转换成MD5加密，然后和数据库进行对比
        if(usercode == null && password ==null) {
            throw new CustomException("用户名或者密码错误！");
        }
        String md5password = new MD5().getMD5ofStr(password);
        SysUser su = sum.findLogin(usercode,md5password);

        if(su == null) {
            throw new CustomException("用户名或者密码错误！");
        }
        //得到用户id
        Integer userID= su.getId();
        //根据id获得用户的菜单
        List<SysPermission> menus = spm.findMenusByUserID(userID);

        //根据用户id获得权限url
        List<SysPermission> permissions = spm.findPermissionByUserID(userID);

        log.info("认证成功");

        //认证成功，返回用户信息
        ActiveUser au = new ActiveUser();
        au.setId(userID);
        au.setUsercode(usercode);
        au.setUsername(su.getUsername());

        //放入权限范围的菜单和url
        au.setMenus(menus);
        au.setPermissions(permissions);
        return au;
    }

    /**
     * 查询所有用户信息
     * @return
     */
    public List<SysUser> findAllUser() {
        List<SysUser> list = sum.findAllUser();
        return list;
    }
}

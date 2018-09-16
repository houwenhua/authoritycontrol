package com.hwh.vo;

import com.hwh.po.SysPermission;

import java.io.Serializable;
import java.util.List;

/**
 * 功能描述：存放用户登录信息
 *
 * @Author houwenhua
 * @Date 2018/9/15 21:11
 */
public class ActiveUser implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;

    private String usercode;

    private String username;

    //菜单
    private List<SysPermission> menus;

    //权限
    private List<SysPermission> permissions;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<SysPermission> getMenus() {
        return menus;
    }

    public void setMenus(List<SysPermission> menus) {
        this.menus = menus;
    }

    public List<SysPermission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<SysPermission> permissions) {
        this.permissions = permissions;
    }
}

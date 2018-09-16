package com.hwh.mapper;

import com.hwh.po.SysPermission;

import java.util.List;

/**
 * 功能描述：
 *
 * @Author houwenhua
 * @Date 2018/9/15 23:21
 */
public interface SysPermissionMapper {

    /**
     * 根据用户id获得相应的菜单
     * @param userID
     * @return
     */
    public List<SysPermission> findMenusByUserID(Integer userID);

    /**
     * 根据用户id获得权限url
     * @param userID
     * @return
     */
    public List<SysPermission> findPermissionByUserID(Integer userID);
}

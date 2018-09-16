package com.hwh.po;

/**
 * 功能描述：角色权限实体类
 *
 * @Author houwenhua
 * @Date 2018/9/15 21:07
 */
public class SysRolePermission {

    private Integer id;

    private Integer roleid;

    private Integer permissionid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getPermissionid() {
        return permissionid;
    }

    public void setPermissionid(Integer permissionid) {
        this.permissionid = permissionid;
    }
}

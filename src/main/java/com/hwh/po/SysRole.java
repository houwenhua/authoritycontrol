package com.hwh.po;

/**
 * 功能描述：角色实体类
 *
 * @Author houwenhua
 * @Date 2018/9/15 20:59
 */
public class SysRole {

    private Integer id;

    private String name;

    private String available;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }
}

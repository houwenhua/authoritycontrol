package com.hwh.mapper;

import com.hwh.po.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 功能描述：
 *
 * @Author houwenhua
 * @Date 2018/9/15 21:37
 */
public interface SysUserMapper {

    /**
     * 登录验证方法
     * @param usercode
     * @param password
     * @return
     */
    public SysUser findLogin(@Param("usercode") String usercode,@Param("password") String password);

    /***
     * 查询所用用户信息
     * @return
     */
    public List<SysUser> findAllUser();
}

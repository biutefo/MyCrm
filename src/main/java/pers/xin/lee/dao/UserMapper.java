package pers.xin.lee.dao;

import org.apache.ibatis.annotations.Param;

import pers.xin.lee.bean.User;

public interface UserMapper {
	
	/**
	 * 通过用户名和密码查询用户
	 * 传递单个参数,不使用 @Param 注解，多个时才需要
	 * @param usercode
	 * @param password
	 * @return
	 */
	User selectUser(@Param("usercode") String usercode, @Param("password") String password);

}
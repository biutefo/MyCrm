package pers.xin.lee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.xin.lee.bean.User;
import pers.xin.lee.dao.UserMapper;
import pers.xin.lee.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User selectUser(String usercode, String password) {
		User user = userMapper.selectUser(usercode, password);
		return user;
	}

}

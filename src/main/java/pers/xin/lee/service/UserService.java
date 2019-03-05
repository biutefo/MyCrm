package pers.xin.lee.service;

import pers.xin.lee.bean.User;

public interface UserService {

	User selectUser(String usercode, String password);

}

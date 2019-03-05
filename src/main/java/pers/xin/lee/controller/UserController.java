package pers.xin.lee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pers.xin.lee.bean.User;
import pers.xin.lee.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	/**
	 * 直接get请求方法访问/login.action请求不提交数据向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode, String password, Model model, HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.selectUser(usercode, password);
		if (user != null) {
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
			return "redirect:list/1";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
		// 返回到登录页面
		return "login";
	}

	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */
	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
		return "customer";
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login.action";
	}

}

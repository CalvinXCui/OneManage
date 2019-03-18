package com.controller.sys;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.user.User;
import com.service.user.UserServiceImpl;
import com.util.Tool;
/*
 * 登陆
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	UserServiceImpl userService;
	
	private static Logger log = Logger.getLogger(LoginController.class);
	
	/**
	 * 登录跳转页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request, Model model) {
		log.info("进入到登录界面！");
		return "views/sys/login";
	}
	
	//登录
	@ResponseBody
	@RequestMapping("login")
	public String login(HttpServletRequest request,String name,String pwd) {
		log.info("用户名"+name);
		log.info("密码"+pwd);
		
		HttpSession session = request.getSession(true); 
		
		User user = new User();
		user.setLoginName(name);
		List<User> users = userService.getAllList(user);
		if(users.size() > 0){
			User u = users.get(0);
			if(Tool.MD5(pwd).equals(u.getPwd())){
				//登录成功
				//将user放入session
				session.setAttribute("user", u);
				return "0";
			}else{
				//密码不正确
				return "1";
			}
		}else{
			//用户不存在
			return "2";
		}
		
	}
	
	/**
	 * 退出
	 * @param request
	 * @param name
	 * @param pwd
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "views/sys/login";
	}
	
}

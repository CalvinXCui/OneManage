package com.controller.sys;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/*
 * 首页
 * 
 */
@Controller
@RequestMapping("/index")
public class IndexController {

	private static Logger log = Logger.getLogger(IndexController.class);

	@RequestMapping("index")
	public String index(HttpServletRequest request, Model model) {
		log.info("转到首页！");
		return "views/sys/index";
	}
	
	@RequestMapping("main")
	public String main(HttpServletRequest request, Model model) {
		return "views/sys/main";
	}
	
	@RequestMapping("temp")
	public String temp(HttpServletRequest request, Model model) {
		return "views/sys/temp";
	}
	
}

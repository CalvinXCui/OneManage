package com.controller.sys;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 *系统文档controller 
 */
@Controller
@RequestMapping("/systemDoc")
public class SystemDocController {

	@RequestMapping("icon")
	public String index(HttpServletRequest request, Model model) {
		return "views/doc/icon";
	}
	
	@RequestMapping("hover")
	public String hover(HttpServletRequest request, Model model) {
		return "views/doc/hover";
	}
	
	@RequestMapping("animate")
	public String animate(HttpServletRequest request, Model model) {
		return "views/doc/animate";
	}
	
	@RequestMapping("four")
	public String four(HttpServletRequest request, Model model) {
		return "views/doc/four";
	}
	
	@RequestMapping("larrytab")
	public String larrytab(HttpServletRequest request, Model model) {
		return "views/doc/larrytab";
	}
	
}

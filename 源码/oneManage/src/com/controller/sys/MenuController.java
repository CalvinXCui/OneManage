package com.controller.sys;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.sys.Menu;
import com.model.sys.MenuTree;
import com.model.sys.MenuTreeCheck;
import com.model.user.User;
import com.service.sys.MenuService;
import com.service.user.UserService;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 获取所有菜单
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/dataList")
	public List<Menu> dataList(HttpServletRequest request, Model model, Menu menu) {
		//获取当前用户
		User user = (User) request.getSession().getAttribute("user");
		user = (User) userService.get(user);
		menu.setRoleId(user.getRoleId());
		
		menu.setIsTop("1");
		List<Menu> list = menuService.getAllList(menu);
		return list;
	}
	
	/**
	 * 获取菜单(树)
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/dataJson")
	public List<MenuTree> dataJson(HttpServletRequest request, Model model, MenuTree menu) {
		List<MenuTree> list = menuService.getAllListJson(menu);
		return list;
	}
	
	/**
	 * 获取菜单(树)
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/dataCheckJson")
	public List<MenuTreeCheck> dataCheckJson(HttpServletRequest request, Model model, MenuTree menu) {
		String roleId = request.getParameter("roleId");
		menu.setId(75);//默认顶级，后续改配置
		List<MenuTreeCheck> list = menuService.getAllListCheckJson(menu, roleId);
		
		return list;
	}
	
	/**
	 * 获取所有菜单
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/data")
	public Map<String, Object> data(HttpServletRequest request, Model model, Menu menu) {
		List<Menu> list = menuService.getAllListN(menu);
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", list.size());
        map.put("data", list);
		return map;
	}
	
	/**
	 * 菜单管理列表跳转页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, Model model, Menu menu) {
		//获取当前用户
		User user = (User) request.getSession().getAttribute("user");
		user = (User) userService.get(user);
		model.addAttribute("user", user);
		return "views/sys/menuList";
	}
	
	/**
	 * 菜单管理列表跳转页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/form")
	public String form(HttpServletRequest request, Model model, Menu menu) {
		if(menu.getId() != 0){
			menu = menuService.get(menu);
			Menu temp = new Menu();
			temp.setId(menu.getPid());
			model.addAttribute("menuP",  menuService.get(temp));
		}else if(menu.getPid() == 75){
			Menu temp = new Menu();
			temp.setId(75);
			model.addAttribute("menuP",  menuService.get(temp));
		}else{
			Menu temp = new Menu();
			temp.setId(menu.getPid());
			model.addAttribute("menuP",  menuService.get(temp));
		}
		
		model.addAttribute("menu",  menu);
		return "views/sys/menuForm";
	}
	
	/**
	 * 保存友情链接
	 * @param request
	 * @param model
	 * @param user
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Menu menu) throws UnsupportedEncodingException {
		String result = "1";//结果标识 1：失败 0：成功
		try
		{
			//设置默认值
			menu.setSpread("0");
			menu.setDelFlag("0");
			
			if(menu.getPid() == 75){
				menu.setIsTop("1");
				menu.setLevel(1);
			}else{
				menu.setIsTop("0");
				Menu temp = new Menu();
				temp.setId(menu.getPid());
				menu.setLevel(menuService.get(temp).getLevel() + 1);
				
			}
			menuService.save(menu);
			result = "0";
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 删除菜单
	 * @param request
	 * @param model
	 * @param user
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, Menu menu) {
		String result = "1";
		try {
			menuService.delete(menu.getId());
			result = "0";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}

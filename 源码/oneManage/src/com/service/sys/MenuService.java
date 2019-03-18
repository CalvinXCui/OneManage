package com.service.sys;

import java.util.List;

import com.model.sys.Menu;
import com.model.sys.MenuTree;
import com.model.sys.MenuTreeCheck;

public interface MenuService {
	/**
	 * 获取菜单
	 * @param user
	 * @return
	 */
	public Menu get(Menu menu);
	/**
	 * 获取所有菜单(递归)
	 * @param user
	 * @return
	 */
	public List<Menu> getAllList(Menu menu);
	/**
	 * 获取所有菜单(不递归)
	 * @param user
	 * @return
	 */
	public List<Menu> getAllListN(Menu menu);
	
	/**
	 * 获取所有菜单
	 * @param user
	 * @return
	 */
	public List<MenuTree> getAllListJson(MenuTree menu);
	
	/**
	 * 获取所有菜单
	 * @param user
	 * @return
	 */
	public List<MenuTreeCheck> getAllListCheckJson(MenuTree menu, String roleId);
	
	public void insert(Menu menu);
	
	public void update(Menu menu);
	
	/**
	 * 保存
	 * @param menu
	 */
	public void save(Menu menu);
	
	/**
	 * 删除菜单
	 * @param id
	 */
	public void delete(Integer id);
}

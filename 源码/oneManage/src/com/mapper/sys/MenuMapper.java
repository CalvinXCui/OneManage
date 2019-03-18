package com.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.sys.Menu;
import com.model.sys.MenuTree;
import com.model.sys.MenuTreeCheck;

public interface MenuMapper {

	/**
	 * 获取菜单
	 * @param user
	 * @return
	 */
	public Menu get(Menu menu);

	/**
	 * 获取菜单
	 * @param user
	 * @return
	 */
	public MenuTree getTree(MenuTree menu);
	
	/**
	 * 获取菜单（菜单加载用）
	 * @param user
	 * @return
	 */
	public List<Menu> getByPidM(Menu menu);
	
	/**
	 * 获取菜单
	 * @param user
	 * @return
	 */
	public List<Menu> getByPid(Menu menu);
	
	/**
	 * 获取菜单
	 * @param user
	 * @return
	 */
	public List<MenuTree> getByPidTree(MenuTree menu);
	
	/**
	 * 获取菜单
	 * @param user
	 * @return
	 */
	public List<MenuTreeCheck> getByPidTreeCheck(@Param("id") String id, @Param("roleId") String roleId);
	
	/**
	 * 获取所有菜单（加载菜单用）
	 * @param user
	 * @return
	 */
	public List<Menu> getAllListM(Menu menu);
	
	/**
	 * 获取所有菜单
	 * @param user
	 * @return
	 */
	public List<Menu> getAllList(Menu menu);
	
	/**
	 * 新增菜单
	 * @param user
	 */
	public void insert(Menu menu);
	
	/**
	 * 修改菜单
	 * @param user
	 */
	public void update(Menu menu);
	
	/**
	 * 删除菜单
	 * @param id
	 */
	public void delete(Integer id);
}

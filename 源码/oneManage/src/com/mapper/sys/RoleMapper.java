package com.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.sys.Role;

public interface RoleMapper {

    /**
     * 角色总数
     * @param user
     * @return
     */
    Long getCount(Role role);

    /**
     * 分页查询
     * @param user
     * @return
     */
    List<Role> getListByPage(Role role);
    
	/**
	 * 获取角色
	 * @param user
	 * @return
	 */
	public Role get(Role role);
	
	/**
	 * 获取所有角色
	 * @param user
	 * @return
	 */
	public List<Role> getAllList(Role role);
	
	/**
	 * 新增角色
	 * @param user
	 */
	public void insert(Role role);
	
	/**
	 * 修改角色
	 * @param user
	 */
	public void update(Role role);
	
	/**
	 * 删除角色
	 * @param user
	 */
	public void delete(Integer id);
	
	/**
	 * 删除角色和菜单管理关系
	 * @param id
	 */
	public void deleteRM(Integer id);
	
	/**
	 * 保存角色和菜单管理关系
	 * @param user
	 */
	public void insertRM(@Param("roleId") String roleId, @Param("menuId") String menuId);
	
}

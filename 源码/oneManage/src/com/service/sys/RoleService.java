package com.service.sys;

import java.util.List;

import com.model.sys.Role;

public interface RoleService {
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
     * 新增角色
     * @param role
     */
	public void insert(Role role);
	
	/**
	 * 修改角色
	 * @param role
	 */
	public void update(Role role);
	
	/**
	 * 保存
	 * @param user
	 */
	public void save(Role role);
	
	/**
	 * 删除角色
	 * @param user
	 */
	public void delete(Integer id);
	
	/**
	 * 保存
	 * @param user
	 */
	public void savePermission(String roleId, String ids);
}

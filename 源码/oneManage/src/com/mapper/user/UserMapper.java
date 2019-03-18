package com.mapper.user;

import java.util.List;

import com.model.user.User;

public interface UserMapper {

    /**
     * 用户总数
     * @param user
     * @return
     */
    Long getCount(User user);

    /**
     * 分页查询
     * @param user
     * @return
     */
    List<User> getListByPage(User user);
    
	/**
	 * 获取用户
	 * @param user
	 * @return
	 */
	public User get(User user);
	
	/**
	 * 获取所有用户
	 * @param user
	 * @return
	 */
	public List<User> getAllList(User user);
	
	/**
	 * 新增用户
	 * @param user
	 */
	public void insert(User user);
	
	/**
	 * 修改用户
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * 删除用户
	 * @param user
	 */
	public void delete(Integer id);
}

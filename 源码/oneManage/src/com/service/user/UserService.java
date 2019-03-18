package com.service.user;

import java.util.List;

import com.model.user.User;

public interface UserService {
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
	
	public void insert(User user);
	
	public void update(User user);
	
	/**
	 * 保存
	 * @param user
	 */
	public void save(User user);
	
	/**
	 * 删除用户
	 * @param user
	 */
	public void delete(Integer id);
}

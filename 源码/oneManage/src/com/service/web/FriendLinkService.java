package com.service.web;

import java.util.List;

import com.model.web.FriendLink;

public interface FriendLinkService {
	 
	/**
     * 链接总数
     * @param friendLink
     * @return
     */
    Long getCount(FriendLink friendLink);

    /**
     * 获取友情链接
     * @param friendLink
     * @return
     */
    FriendLink get(FriendLink friendLink);
    
    /**
     * 分页查询
     * @param friendLink
     * @return
     */
    List<FriendLink> getListByPage(FriendLink friendLink);
	
	/**
	 * 新增友情链接
	 * @param friendLink
	 */
	public void insert(FriendLink friendLink);
	
	/**
	 * 修改友情链接
	 * @param friendLink
	 */
	public void update(FriendLink friendLink);
	
	/**
	 * 删除友情链接
	 * @param friendLink
	 */
	public void delete(Integer id);
	
	/**
	 * 保存友情链接
	 * @param friendLink
	 */
	public void save(FriendLink friendLink);
}

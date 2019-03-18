package com.service.web;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.mapper.web.FriendLinkMapper;
import com.model.web.FriendLink;

@Service
@Transactional
public class FriendLinkServiceImpl implements FriendLinkService {
	@Resource
	public FriendLinkMapper friendLinkMapper;

	@Override
	public Long getCount(FriendLink friendLink) {
		return friendLinkMapper.getCount(friendLink);
	}

	@Override
	public List<FriendLink> getListByPage(FriendLink friendLink) {

		return friendLinkMapper.getListByPage(friendLink);
	}

	@Override
	public void insert(FriendLink friendLink) {
		friendLinkMapper.insert(friendLink);
	}

	@Override
	public void update(FriendLink friendLink) {
		friendLinkMapper.update(friendLink);
	}

	@Override
	public void delete(Integer id) {
		friendLinkMapper.delete(id);
	}

	@Override
	public void save(FriendLink friendLink) {
		if(friendLink.getId() == 0){
			friendLinkMapper.insert(friendLink);
		}else{
			friendLinkMapper.update(friendLink);
		}
	}

	@Override
	public FriendLink get(FriendLink friendLink) {
		return friendLinkMapper.get(friendLink);
	}

}
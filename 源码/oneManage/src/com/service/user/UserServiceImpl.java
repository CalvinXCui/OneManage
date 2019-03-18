package com.service.user;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.mapper.user.UserMapper;
import com.model.user.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Resource
	public UserMapper userMapper;

	@Override
	public User get(User user) {
		return userMapper.get(user);
	}

	@Override
	public void insert(User user) {
		userMapper.insert(user);
	}

	@Override
	public void update(User user) {
		userMapper.update(user);
	}

	@Override
	public List<User> getAllList(User user) {
		return userMapper.getAllList(user);
	}

	@Override
	public Long getCount(User user) {
		return userMapper.getCount(user);
	}

	@Override
	public List<User> getListByPage(User user) {
		return userMapper.getListByPage(user);
	}

	@Override
	public void save(User user) {
		if(user.getId() == 0){
			userMapper.insert(user);
		}else{
			userMapper.update(user);
		}
	}

	@Override
	public void delete(Integer id) {
		userMapper.delete(id);
	}
}

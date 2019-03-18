package com.service.sys;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.mapper.sys.RoleMapper;
import com.model.sys.Role;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	@Resource
	public RoleMapper roleMapper;

	@Override
	public Role get(Role role) {
		return roleMapper.get(role);
	}

	@Override
	public void insert(Role role) {
		roleMapper.insert(role);
	}

	@Override
	public void update(Role role) {
		roleMapper.update(role);
	}

	@Override
	public List<Role> getAllList(Role role) {
		return roleMapper.getAllList(role);
	}

	@Override
	public Long getCount(Role role) {
		return roleMapper.getCount(role);
	}

	@Override
	public List<Role> getListByPage(Role role) {
		return roleMapper.getListByPage(role);
	}

	@Override
	public void save(Role role) {
		if(role.getId() == 0){
			roleMapper.insert(role);
		}else{
			roleMapper.update(role);
		}
	}

	@Override
	public void delete(Integer id) {
		roleMapper.delete(id);
	}

	@Override
	@Transactional
	public void savePermission(String roleId, String ids) {
		String[] strs = ids.split(",");
		//删除已有关联关系
		roleMapper.deleteRM(Integer.parseInt(roleId));
		
		for(int i = 0; i < strs.length; i ++){
			roleMapper.insertRM(roleId, strs[i]);
			
		}
		//保存新的角色和菜单的管理关系
	}
}

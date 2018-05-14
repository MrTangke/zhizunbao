package www.zhizunbao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.dto.manage.Resources;
import www.zhizunbao.dto.manage.ResourcesTree;
import www.zhizunbao.dto.manage.Role;
import www.zhizunbao.mapper.manage.ResourcesMapper;
import www.zhizunbao.mapper.manage.RoleMapper;
import www.zhizunbao.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService {

	
	
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	ResourcesMapper resourcesMapper;
	

	
	@Override
	public List<Role> findRoleList() {
		List<Role> roleList = roleMapper.findRoleList();
		for (Role role : roleList) {
			List<Resources> resources= roleMapper.getResourcesByRoleId(role.getRoleId());
			role.setResources(resources);
			List<Manage> manages= roleMapper.getManageByRoleId(role.getRoleId());
			role.setManage(manages);
		}
		return roleList;
	}

	@Override
	public Role findRoleById(int id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer  deleteByPrimaryKey(Integer roleId) {
		
		return roleMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public int findByCount() {
		return roleMapper.findByCount();
	}

	@Override
	public int addRole(Role role) {
		return roleMapper.insertSelective(role);
	}

	@Override
	public int updateByPrimaryKeySelective(Role role) {
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	@Override
	public List<ResourcesTree> getResourcesTree(Integer roleId) {
		return resourcesMapper.getResourcesTree(roleId);
	}

	@Override
	public Role findMoreList(int id) {
		return roleMapper.findMoreList(id);
	}

	@Override
	public int assignResources(Integer roleId, Integer[] resIds) {
		if (resIds.length>0) {
			resourcesMapper.deleteByRoleId(roleId);
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		map.put("resIds", resIds);
		return resourcesMapper.insertResourcesByRoleId(map);
	}
}

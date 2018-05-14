package www.zhizunbao.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import www.zhizunbao.dto.manage.ResourcesTree;
import www.zhizunbao.dto.manage.Role;
import www.zhizunbao.service.RoleService;
/** 
 * @author Administrator
 * 角色管理
 */
@Controller
@RequestMapping("/role/")
public class RoleController {
	
	@Autowired
	RoleService roleService;
 /** 
  * 
  * Administrator  2018年4月17日 上午8:34:21
  * 功能 ：角色列表
  * @param request
  * @param role
  * @return
  */
	
	@RequestMapping("toAdministrator")
	public String toAdministrator(HttpServletRequest request,Role role){
		List<Role> list = roleService.findRoleList();
		int SUM = roleService.findByCount();
			request.setAttribute("list", list);
			request.setAttribute("SUM", SUM);
		return "admin/role/role_list";
	}
	/** 
	 * Administrator  2018年4月17日 上午8:30:46
	 * 功能 ： 回现
	 * @param request
	 * @param role
	 * @param id
	 * @return
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(HttpServletRequest request,int id){
		Role role = roleService.findRoleById(id);
		request.setAttribute("role", role);
		return "admin/role/role_update";
	}
	/**
	 * Administrator  2018年4月17日 上午11:51:05
	 * 功能 ：修改,
	 * @return
	 */
	@RequestMapping("Update")
	public String Update(HttpServletRequest request,Role role){
		int i = roleService.updateByPrimaryKeySelective(role);
		if(i>0){
			return "redirect:/role/toAdministrator";
		}
		return "redirect:/role/toAdministrator";
	}
	/**
	 * Administrator  2018年4月17日 上午8:34:07
	 * 功能 ：删除角色
	 * @param roleId
	 * @return
	 */
	@RequestMapping("deleteRole")
	@ResponseBody
	public Integer deleteRole(Integer roleId){
		Integer i = roleService.deleteByPrimaryKey(roleId);
		return i;
	}
	/** 
	 * 
	 * Administrator  2018年4月17日 下午9:50:37
	 * 功能 ：添加
	 * @param request
	 * @param role
	 * @return
	 */
	@RequestMapping("Add")
	public String Add(HttpServletRequest request, Role role){
		roleService.addRole(role);
		return "redirect:/role/toAdministrator";
	}
	
	/**
	 * 去分配权限页面
	 * toAssignResources
	 */
	@RequestMapping("toAssignResources")
	public String toAssignResources(HttpServletRequest request,Role role) {
		List<ResourcesTree> resTree= roleService.getResourcesTree(role.getRoleId());
		String jsonString = JSONArray.toJSONString(resTree);
		request.setAttribute("jsonString", jsonString);
		request.setAttribute("role", role);
			return "admin/role/role_assign_resources";
	}
	
	
	/**
	 * 分配权限
	 */
	@RequestMapping("assignResources")
	@ResponseBody
	public int assignResources(Integer roleId,Integer[] resIds,HttpServletRequest request){
		//分配权限
		return roleService.assignResources(roleId,resIds);
	}
	
	/** 
	 * Administrator  2018年4月17日 下午9:51:28
	 * 功能 ：查询角色对应的人员和权限
	 * @return
	 */
	@RequestMapping("findMore")
	public String findMore(HttpServletRequest request, Role role ,int id){
		role = roleService.findMoreList(id);
		request.setAttribute("role", role);
		return "admin/role/role_MultiList";
	}
	
}

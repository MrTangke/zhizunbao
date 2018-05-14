package www.zhizunbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.dto.manage.ManageRole;
import www.zhizunbao.mapper.manage.ManageMapper;
import www.zhizunbao.mapper.manage.ManageRoleMapper;
import www.zhizunbao.mapper.manage.RoleMapper;
import www.zhizunbao.service.ManageService;
import www.zhizunbao.utils.Base64Util;
import www.zhizunbao.utils.MD5Util;
@Service
public class ManageServiceImpl implements ManageService{
    @Autowired
    ManageMapper manageMapper;
    @Autowired
    ManageRoleMapper manageRoleMapper;
    @Autowired
    RoleMapper roleMapper;
    
    @Override
	public List<Manage> findManage(Manage manage) {
		return manageMapper.findManage(manage);
	}
	
    
    @Override
	public Integer updateStatus(Manage manage) {
		Integer i = manageMapper.updateStatus(manage);
		return i;
	}
	
    
    @Override
	public Integer insertSelective(Manage manage) {
		manage.setManageStatus(0);
		manage.setPassword(Base64Util.encode(MD5Util.MD5(manage.getPassword())));
		Integer i = manageMapper.insertSelective(manage);
		ManageRole record = new ManageRole();
		record.setRoleId(manage.getRoleId());
		record.setManageId(manage.getManageId());
		manageRoleMapper.insertSelective(record);
		return i;
	}
	@Override
	public Integer deleteByPrimaryKey(Integer manageId) {
		return manageMapper.deleteByPrimaryKey(manageId);
	}
	@Override
	public Object selectByPrimaryKey(Integer manageId) {
		return manageMapper.selectByPrimaryKey(manageId);
	}
	@Override
	public Integer updateManage(Manage manage) {
		Integer i;
		Manage ma = manageMapper.selectByPrimaryKey(manage.getManageId());
		if(ma.getPassword().equals(manage.getPassword())){
			i = manageMapper.updateManage(manage);
		}
		else{
			manage.setPassword(Base64Util.encode(MD5Util.MD5(manage.getPassword())));
			i = manageMapper.updateManage(manage);
		}
		ManageRole record = new ManageRole();
		record.setRoleId(manage.getRoleId());
		record.setManageId(manage.getManageId());
		manageRoleMapper.deleteByPrimaryKey(manage.getManageId());
		manageRoleMapper.insertSelective(record);
		return i;
	}
	@Override
	public int uploadImg(String imgUrl, Manage manage) {
		manage.setManageImg(imgUrl);
		return manageMapper.updateStatus(manage);
	}
	
	@Override
	public Manage login(String username) {
		return manageMapper.login(username);
	}


	@Override
	public Manage findRoleNameByManage(Integer manageId) {
		return manageMapper.findRoleNameByManage(manageId);
	}


	@Override
	public void uptadeByMLogin(Manage manage) {
		manageMapper.uptadeByMLogin(manage);
		
	}


	@Override
	public void uptadeSteMLogin(Integer manageId) {
		manageMapper.uptadeSteMLogin(manageId);
	}


	@Override
	public Integer toResetPassword(Manage manage) {
		// TODO Auto-generated method stub
		return  manageMapper.updateManage(manage);
	}

	
	/**
	 * 
	 * Mr吴  2018年4月28日 下午3:06:04
	 * 功能 ：人员登陆成功后修改登录时间
	 * @param man
	 * @return
	 */
	@Override
	public int updateManageLogin(Manage man) {
		// TODO Auto-generated method stub
		return manageMapper.updateManageLogin(man);
	}

	
	/**
	 * 
	 * Mr吴  2018年4月28日 下午4:09:07
	 * 功能 ：密码输入错误次数
	 * @param man
	 * @return
	 */
	@Override
	public int updateLoginNumber(Manage man) {
		// TODO Auto-generated method stub
		return manageMapper.updateLoginNumber(man);
	}

}

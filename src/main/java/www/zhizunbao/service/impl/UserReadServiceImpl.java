package www.zhizunbao.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.mapper.activity.UserReadMapper;
import www.zhizunbao.service.UserReadService;

@Service
public class UserReadServiceImpl implements UserReadService{

	@Autowired
	UserReadMapper userReadMapper;

	public List<UserRead> findReadList() {
		// TODO Auto-generated method stub
		return userReadMapper.selectByPrimaryKey();
	}

	public int addUserRead(UserRead userRead) {
		return userReadMapper.insertSelective(userRead);
	}

	@Override
	public Integer deleteByPrimaryKey(Integer readId) {
		// TODO Auto-generated method stub
		return userReadMapper.deleteByPrimaryKey(readId);
	}

	@Override
	public Object selectUserReadOne(Integer readId) {
		// TODO Auto-generated method stub
		return userReadMapper.selectUserReadOne(readId);
	}

	@Override
	public Integer updateUserRead(UserRead userRead) {
		// TODO Auto-generated method stub
		return userReadMapper.updateByPrimaryKeySelective(userRead);
	}

	@Override
	public int uploadImg(String imgUrl, UserRead userRead) {
		userRead.setReadImg(imgUrl);
		return userReadMapper.updateByPrimaryKeySelective(userRead);
	}

	@Override
	public List<UserRead> userReadActivityList() {
		// TODO Auto-generated method stub
		return userReadMapper.userReadActivityList();
	}
}

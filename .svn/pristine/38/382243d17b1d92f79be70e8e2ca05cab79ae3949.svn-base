package www.zhizunbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.dto.activity.UserReadRel;
import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.mapper.activity.UserDiscountsMapper;
import www.zhizunbao.mapper.activity.UserReadMapper;
import www.zhizunbao.mapper.activity.UserReadRelMapper;
import www.zhizunbao.mapper.insure.ShapeMapper;
import www.zhizunbao.mapper.manage.FrontImgMapper;
import www.zhizunbao.service.FrontActivityService;
@Service
public class FrontActivityServiceImpl  implements FrontActivityService{

	@Autowired
	UserReadMapper userReadMapper;
	
	@Autowired
	FrontImgMapper frontImgMapper;
	
	@Autowired
	UserReadRelMapper userReadRelMapper;
	
	@Autowired
	UserDiscountsMapper  userDiscountsMapper;
	
	@Override
	public List<FrontImg> findBxImg() {
		return frontImgMapper.findBxImg();
	}

	@Override
	public List<FrontImg> findBrowsImg() {
		return frontImgMapper.findBrowsImg();
	}

	@Override
	public UserRead findUserRead(int imgOrder) {
			return userReadMapper.findUserRead(imgOrder);
	}


	@Override
	public int UpdateinTimeByNewinTime(UserReadRel userReadRel) {
		return userReadRelMapper.updateByPrimaryKeySelective(userReadRel);
	}

	@Override
	public int insertuserId(UserReadRel userId) {
		return userReadRelMapper.insertuserId(userId);
	}

	@Override
	public UserReadRel  findUserRel(UserReadRel userReadRel) {
		return userReadRelMapper.findUserRel(userReadRel);
	}

	@Override
	public int UpdateinTimeByNewintOrder(int imgOrder) {
		return userReadRelMapper.UpdateinTimeByNewintOrder(imgOrder);
	}

	@Override
	public int insertSelective(UserReadRel userReadRel) {
		return userReadRelMapper.insertSelective(userReadRel);
	}

	@Override
	public int insertSelective(UserRead userRead) {
		return userReadRelMapper.insertSelective(userRead);
	}

	@Override
	public UserReadRel findFrontActivity(Integer userId) {
		return userReadRelMapper.findFrontActivity(userId);
	}

	@Override
	public int updateByPrimaryKeySelective(UserReadRel userReadRel2) {
		return userReadRelMapper.updateByPrimaryKeySelective(userReadRel2);
	}

	@Override
	public int insetUserDiscountsifo(UserDiscounts userDiscounts) {
		return userDiscountsMapper.insertSelective(userDiscounts);
	}






}

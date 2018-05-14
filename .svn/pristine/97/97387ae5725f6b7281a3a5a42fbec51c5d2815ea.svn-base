package www.zhizunbao.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.claim.UserApply;
import www.zhizunbao.dto.insure.UserInsure;
import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.mapper.claim.UserApplyMapper;
import www.zhizunbao.mapper.insure.UserInsureMapper;
import www.zhizunbao.service.UserApplyService;
import www.zhizunbao.utils.LogUtil;
@Service
public class UserApplyServiceImpl implements UserApplyService{

	@Autowired
	private UserApplyMapper userApplyMapper;
    @Autowired
    private UserInsureMapper userInsureMapper;
	@Override
	public int uploadImg(HttpServletRequest request,String imgUrl, UserApply userApply) {
		   	
		UserInfo man = (UserInfo) request.getSession().getAttribute("userInfo1");
		LogUtil.mdc(man.getUserName()); 
		Logger logger = LogUtil.getLogger(UserApplyServiceImpl.class);
		try {
			userApply.setApplyStatus(0);
			userApply.setClaimImg(imgUrl);
			UserInsure userInsure = userInsureMapper.selectByPrimaryKey(userApply.getId());
			int i = userApplyMapper.insertSelective(userApply);
			if(userInsure.getApplyId()==null){
				userApplyMapper.updateApplyId(userApply);
			}
			logger.info("上传理赔图片成功");
			return i;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("上传理赔图片失败");
			return 0;
		}
			
	}

	@Override
	public List<UserApply> findUserApplyList() {
		// TODO Auto-generated method stub
		return userApplyMapper.findUserApplyList();
	}

	@Override
	public void getApproved(Integer applyId) {
		// TODO Auto-generated method stub
		userApplyMapper.getApproved(applyId);
	}
	
	@Override
	public void unGetApproved(Integer applyId) {
		// TODO Auto-generated method stub
		userApplyMapper.unGetApproved(applyId);
	}
}

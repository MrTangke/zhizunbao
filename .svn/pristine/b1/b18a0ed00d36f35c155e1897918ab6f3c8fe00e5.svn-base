package www.zhizunbao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import www.zhizunbao.dto.claim.UserApply;

public interface UserApplyService {

	int uploadImg(HttpServletRequest request,String imgUrl, UserApply userApply);

	List<UserApply> findUserApplyList();

	void getApproved(Integer applyId);

	void unGetApproved(Integer applyId);

}

package www.zhizunbao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.claim.UserApply;
import www.zhizunbao.service.UserApplyService;

@Controller
@RequestMapping("userApply")
public class UserApplyController {
	
	@Autowired
	private UserApplyService userApplyService;
	/**
	 * 
	 * JiJi  2018年4月26日 上午9:42:31
	 * 功能 ：后台查询用户理赔申请
	 * @param request
	 * @return
	 */
	@RequestMapping("findUserApplyList")
	public String findUserApplyList(HttpServletRequest request){
		List<UserApply> userApplies = userApplyService.findUserApplyList();
		for (UserApply userApply:userApplies) {
			userApply.setApplyMomey(userApply.getClaimRatio()*userApply.getInsurePrice());
		}
		request.setAttribute("userApplies", userApplies);
		return "admin/manageapply/applymanagelist";
		
	}
	/**
	 * 
	 * JiJi  2018年4月26日 下午2:45:49
	 * 功能 ：通过审核
	 * @param applyId
	 * @return
	 */
	@RequestMapping("getApproved")
	public String getApproved(Integer applyId){
		userApplyService.getApproved(applyId);
		return "redirect:findUserApplyList";
	}
	/**
	 * 
	 * JiJi  2018年4月26日 下午2:46:37
	 * 功能 ：不通过审核
	 * @param applyId
	 * @return
	 */
	@RequestMapping("unGetApproved")
	public String unGetApproved(Integer applyId){
		userApplyService.unGetApproved(applyId);
		return "redirect:findUserApplyList";
	}

}

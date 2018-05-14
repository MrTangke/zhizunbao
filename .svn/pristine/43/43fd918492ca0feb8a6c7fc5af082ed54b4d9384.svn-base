package www.zhizunbao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.service.ManageService;
import www.zhizunbao.utils.Base64Util;
import www.zhizunbao.utils.DateTimeUtil;
import www.zhizunbao.utils.MD5Util;

@Controller
@RequestMapping("/adminLogin/")
public class AdminLoginController {

	@Autowired
	ManageService manageService;

	/**
	 * Administrator 2018年4月18日 下午4:31:39 功能 ：去后台登陆页面
	 * 
	 * @return
	 */
	@RequestMapping("toLogin")
	public String toLogin(HttpServletRequest request) {
		Manage manage = (Manage) request.getSession().getAttribute("man");
		if (null != manage) {
			manageService.uptadeSteMLogin(manage.getManageId());
			request.getSession().invalidate();
		}
		return "admin/admin_login";
	}

	/**
	 * Administrator 2018年4月18日 下午6:49:18 功能 ：登陆判断
	 * 
	 * @param request
	 * @param manage
	 * @param key
	 * @return
	 */
	@RequestMapping("login")
	public String login(HttpServletRequest request, Manage manage, String key) {
		// String sessionKey = (String)
		// request.getSession().getAttribute("key");
		// System.out.println(userInfo+",key="+key+"，session中的key="+keys);
		String username = manage.getUsername();
		String message = "";
		String val = (String) request.getSession().getAttribute("key");
		if (null==key) {
			return "redirect:toLogin";
		}
		if (key.equals(val.toLowerCase()) && !"".equals(key)) { // 验证码
			Manage man = manageService.login(username);
			if (man != null) {
				if (Base64Util.encode(MD5Util.MD5(manage.getPassword())).equals(man.getPassword())) { // 判断密码
					if (man.getManageStatus() == 0) { // 是否停用
						if (man.getmTime() != null) { // 上次登陆时间
							String getmTime = man.getmTime();
							boolean b = DateTimeUtil.compareDateTime(getmTime, 1);
							if (b) { // 大于30分钟（1分钟）
								Manage manage2 = manageService.findRoleNameByManage(man.getManageId());
								man.setRealName(manage2.getRealName());
								man.setRoleId(manage2.getRoleId());
								man.setRoleName(manage2.getRoleName());
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String mTime = format.format(new Date());
								man.setmTime(mTime);
								manageService.updateManageLogin(man);
								request.getSession().setAttribute("man", man);
								return "redirect:/admin/toAdmin";
							} else // 小于30分钟（1分钟不能登录）
								message = "该账户已经被锁定，请30分钟之后再来";
						} else {
							Manage manage2 = manageService.findRoleNameByManage(man.getManageId());
							man.setRealName(manage2.getRealName());
							man.setRoleId(manage2.getRoleId());
							man.setRoleName(manage2.getRoleName());
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String mTime = format.format(new Date());
							man.setmTime(mTime);
							manageService.updateManageLogin(man);
							request.getSession().setAttribute("man", man);
							return "redirect:/admin/toAdmin";
						}
					} else
						message = "该账户已停用";

				} else {
					if ((2 - man.getmLogin()) >=0) {
						manageService.updateLoginNumber(man);
						message = "密码不正确，还有" + (2 - man.getmLogin()) + "次输入机会";
						if ((2 - man.getmLogin()) == 0) {
							manageService.uptadeByMLogin(man);
							message="密码输入超过3次，该账户已经被锁定，请30分钟之后再来";
						}
					}else{
						message="密码输入超过3次，该账户已经被锁定，请30分钟之后再来";
					}
				}
			} else
				message = "账号不存在";
		} else
			message = "验证码不正确";
		request.setAttribute("error", message);
		return "admin/admin_login";
	}
}

package www.zhizunbao.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.dto.manage.Resources;
import www.zhizunbao.service.ResourcesService;


@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private ResourcesService resourcesService;
	
	/**
	 * Mr吴  2018年4月16日 上午9:13:58
	 * 功能 ：跳转后台主页
	 * @return
	 */
	@RequestMapping("toAdmin")
	public String toAdmin (HttpServletRequest request){
		Manage manage = (Manage) request.getSession().getAttribute("man");
		List<Resources> topResource = resourcesService.findResourcesListByManageId(manage.getManageId());
		for (Resources resources : topResource) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pid", resources.getResId());
			map.put("manageId", manage.getManageId());
			List<Resources> resourcesList = resourcesService.findResourcesListByPid(map);
			resources.setResourceList(resourcesList);
		}
		request.setAttribute("topResource", topResource);
		return "admin/admin_index";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 上午9:13:37
	 * 功能 ： 跳转后台保险页面
	 * @return
	 */
	@RequestMapping("toAdminInsure")
	public String toAdminInsure(){
		
		return "redirect:/insure/findInsureList";
	}
	
	/**
	 * 
	 * Mr吴  2018年4月16日 上午9:35:52
	 * 功能 ： 跳转权限管理页面
	 * @return
	 */
   @RequestMapping("toadmin_Competence")
   public String toAdminCompetence(){
	   
	   return "admin/resources/resources_list";
   }
   
   /**
    * 
    * Mr吴  2018年4月16日 上午9:37:16
    * 功能 ：跳转角色管理页面
    * @return
    */
   @RequestMapping("toAdministrator")
   public String toAdministrator(){
	   
	   return "redirect:/role/toAdministrator";
   }
   
   /**
    * 
    * Mr吴  2018年4月16日 上午9:38:47
    * 功能 ：跳转人员管理页面
    * @return
    */
   @RequestMapping("toAdmin_info")
   public String toAdminInfo(){
	   
	   return "redirect:/manage/toAdmin_info";
   }
   
   /**
    * 
    * Mr吴  2018年4月17日 上午8:18:47
    * 功能 ：欢迎界面
    * @return
    */
   @RequestMapping("toHome")
   public String toHome(){
	   
	   return "admin/home";
   }
   
   /**
    * 
    * Mr吴  2018年4月17日 下午2:05:49
    * 功能 ：跳转保险分类
    * @return
    */
   @RequestMapping("toAdminType")
   public String toAdminType(){
	   return "redirect:/insure/findTypeList";
   }
   
   /**
    * 
    * Mr吴  2018年4月17日 下午2:08:16
    * 功能 ：跳转保险特色页面
    * @return
    */
   @RequestMapping("toAdminFeature")
   public String toAdminFeature(){
	   return "redirect:/insure/findFeatureList";
   }
   
   /**
    * 
    * Mr吴  2018年4月17日 下午2:08:37
    * 功能 ：跳转保险保障范围页面
    * @return
    */
   @RequestMapping("toAdminSafeGuard")
   public String  toAdminSafeGuard(){
	   return "redirect:/insure/findSafeGuardList";
   }
   /**
    * 
    * Mr吴  2018年4月17日 下午2:08:37
    * 功能 ：跳转理赔规则页面
    * @return
    */
   @RequestMapping("toAdminRulesOfClaim")
   public String  toAdminRulesOfClaim(){
	   return "redirect:/rulesOfClaim/findRulesOfClaim";
   }
   /**
    * 
    * Mr吴  2018年4月17日 下午2:08:37
    * 功能 ：跳转评论页面
    * @return
    */
   @RequestMapping("toAdminComment")
   public String  toAdminComment(){
	   return "redirect:/comment/findComment";
   }
   
   /**
    * 
    * Mr吴  2018年4月19日 下午2:31:14
    * 功能 ： 跳转前台首页
    * @return
    */
   @RequestMapping("toIndex")
   public String toIndex(){
	   
	   return "index";
   }
   
}

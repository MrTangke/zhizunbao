package www.zhizunbao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.service.ClaimRuleService;

@Controller
@RequestMapping("/rulesOfClaim/")
public class ClaimRulesController {

	@Autowired
	ClaimRuleService claimRuleService;
	/** 
	 * 
	 * 方法描述：到理赔规则页面
	 * 时间：上午10:09:56
	 * 版本：1.0
	 */
	@RequestMapping("findRulesOfClaim")
	public String findRulesOfClaim(ModelMap map) {
		map.put("ClaimRulesList", claimRuleService.findRulesOfClaim());
		return "admin/claimrule/claimrule_list";
	}
}

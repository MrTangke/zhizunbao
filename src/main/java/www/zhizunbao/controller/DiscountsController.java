package www.zhizunbao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import www.zhizunbao.dto.activity.Discounts;
import www.zhizunbao.service.DiscountsService;

@Controller
@RequestMapping("/discounts/")
public class DiscountsController {

	@Autowired
	private DiscountsService discountsService;
	//去活动页面
	@RequestMapping("toDiscountsList")
	public String toDiscountsList(ModelMap map) {
		map.put("discountsList", discountsService.findDiscountsList());
		return "admin/activity/discounts_list";
	}
	//去活动添加页面
	@RequestMapping("toAddDiscounts")
	public String toAddDiscounts() {
		return "admin/activity/discounts_add";
	}
	//活动的添加
	@RequestMapping("addDiscounts")
	public String addDiscounts(HttpServletRequest request,Discounts discounts) {
		discountsService.addDiscounts(request,discounts);
		return "redirect:/discounts/toDiscountsList";
	}
	//去活动修改页面
	@RequestMapping("toUpdDiscounts")
	public String toUpdDiscounts(Integer disId,ModelMap map) {
		Discounts discounts = discountsService.findDiscountsOne(disId);
		map.put("discounts", discounts);
		return "admin/activity/discounts_upd";
	}
	//活动的修改
	@RequestMapping("updDiscounts")
	public String updDiscounts(Discounts discounts) {
		System.out.println(discounts);
		discountsService.updDiscounts(discounts);
		return "redirect:/discounts/toDiscountsList";
	}
	/**
	 * 删除人员
	 */
	@RequestMapping("deleteDiscounts")
	@ResponseBody
	public Integer deleteRole(HttpServletRequest request,Integer disId){
		Integer i = discountsService.deleteByPrimaryKey(request,disId);
		return i;
	}
}

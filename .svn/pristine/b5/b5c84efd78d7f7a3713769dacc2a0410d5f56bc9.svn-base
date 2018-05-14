package www.zhizunbao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.activity.UserDiscounts;
import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.dto.activity.UserReadRel;
import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.dto.manage.UserInfo;
import www.zhizunbao.service.FrontActivityService;
import www.zhizunbao.utils.FMUtils;

@Controller
@RequestMapping("/activit/")
public class FrontActivity {
	
	@Autowired
	FrontActivityService frontActivityService;
	/** 
	 * Administrator  2018年4月27日 上午8:32:25
	 * 功能 ：去活动页面
	 * @param request
	 * @return
	 */
	@RequestMapping("tofrontActivity")
	public String  tofrontActivity(HttpServletRequest request){
		List<FrontImg> baoxainImg = frontActivityService.findBxImg();//活动
		List<FrontImg> browserlist = frontActivityService.findBrowsImg();//活动旁边的浏览图片
		request.setAttribute("browserlist", browserlist);
		request.setAttribute("baoxainImg", baoxainImg);
		return "front/frontActivity/frontActivity";
	}
	/**
	 * Administrator  2018年4月27日 上午8:32:42
	 * 功能 ：查对应的图片排序去查第几个活动
	 * @param request
	 * @param userRead
	 * @param id
	 * @return
	 */
	@RequestMapping("readActivity")
	public String ActivityOne(ModelMap map,  UserReadRel  userReadRel,  int imgOrder,  HttpServletRequest request){
		
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		int userId = userInfo.getUserId();
		userReadRel.setUserId(userId);
		UserReadRel findUserRel2 = frontActivityService.findUserRel(userReadRel);
		
		if(findUserRel2 != null ){
			//int i =	frontActivityService.insertuserId(userReadRel);
			UserRead userRead = frontActivityService.findUserRead(imgOrder);
			findUserRel2.setInTime(new Date().toLocaleString());
			findUserRel2.setReadId(userRead.getReadId());
			frontActivityService.UpdateinTimeByNewinTime(findUserRel2);
			map.put("userRead", userRead);
			return "front/frontActivity/readActivity";
			
		}else{
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String inTime = format.format(new Date());
			userReadRel.setInTime(inTime);
			UserRead userRead = frontActivityService.findUserRead(imgOrder);  //根据图片的排序来获取活动的顺序
			userReadRel.setReadId(userRead.getReadId());
			frontActivityService.insertSelective(userReadRel); //把新时间根据userId的主键id修改
			//frontActivityService.UpdateinTimeByNewintOrder(userReadRel);  //把获取的imgOeder的值修改进去但是现在主键没得到或要转成对象 但对象下面的imgorder就得报错
			map.put("userRead", userRead);
		}
		
		return "front/frontActivity/readActivity";
	}
	/** 
	 * Administrator  2018年4月27日 下午7:08:44
	 * 功能 ：活动说明生成FreeMarker
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("particulars")
	public void particulars(HttpServletRequest request ,HttpServletResponse  response) throws Exception{
		HashMap<String,Object> map = new HashMap<String,Object>();
		String ob = "活动开始后我们将计时您在我们为你精心准备的文章中丰富您的生活提高您的生活质量的同时还有我们为您准备的各种优惠,"
				+ "您在我们的文章中多花费一分鈡我们的优惠将超出您的付出";
		String obc = "计时活动 "
				   + "在本文章中浏览文章看的时间约长我们的优惠越多";
		map.put("ob", ob);
		map.put("obc", obc);
		FMUtils.createHtml(request, "ask.ftl", "ask.html", map);
		response.sendRedirect("/zhizunbao/html/ask.html");
	}
	/** 
	 * Administrator  2018年4月29日 上午11:35:50
	 * 功能 ：获取退出任务的时间根据session里的user_id 去查出user_read_rel表的主键id 去把退出时间加进去 在做业务
	 * @param request
	 * @param userReadRel
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("toSettlement")
	public String totosettlement(HttpServletRequest request,UserReadRel  userReadRel) throws ParseException{
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		int userId = userInfo.getUserId();
		
		UserReadRel userReadRel2 = frontActivityService.findFrontActivity(userId); 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String outTime = format.format(new Date());
		userReadRel2.setOutTime(outTime);
		frontActivityService.updateByPrimaryKeySelective(userReadRel2); 
		boolean b = false;
		int d = 0;
		long a;
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		double  c = 0;
		try {
			//计算时间差
			long timeBefore = simpleFormat.parse(userReadRel2.getInTime()).getTime();
			long timeNow = simpleFormat.parse(userReadRel2.getOutTime()).getTime();
			//    这是间隔时间 毫秒数  		 这是30分钟毫秒数
			a = (long)(timeNow-timeBefore);
			c = (int)a/(1000*60); 
			d = (int)c;
			b = a> (long)(1*60*1000);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		/*if(b){
		UserDiscounts userDiscounts = new UserDiscounts() ;
		userDiscounts.setUserId(userId);
		userDiscounts.setUserMoney(d);
		frontActivityService.insetUserDiscountsifo(userDiscounts);
		String	masge = "您成功参与我们的活动活动时间是:" + c + "分钟,您获得的奖金额度为:"+ d +"谢谢您的参与";
		request.setAttribute("b", b);
		request.setAttribute("masge", masge);
		return "front/frontActivity/readActivity";
	}else{
		String	masge ="您的参与时间达不到我们的要求,我们的活动是1分钟起哦 亲";
		request.setAttribute("masge", masge);
		return "front/frontActivity/readActivity";
	}*/
		
		
		if(b){
			UserDiscounts userDiscounts = new UserDiscounts() ;
			userDiscounts.setUserId(userId);
			userDiscounts.setUserMoney(d);
			frontActivityService.insetUserDiscountsifo(userDiscounts);
			String	masge = "您成功参与我们的活动活动时间是:" + c + "分钟,您获得的奖金额度为:"+ d +"谢谢您的参与";
		}else{
			String	masge ="您的参与时间达不到我们的要求,我们的活动是1分钟起哦 亲";
		}
		return "redirect:tofrontActivity";
	}
}

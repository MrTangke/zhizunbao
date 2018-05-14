package www.zhizunbao.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import www.zhizunbao.dto.activity.UserRead;
import www.zhizunbao.service.UserReadService;
import www.zhizunbao.utils.FilesUtils;

@Controller
@RequestMapping("/userRead/")
public class UserReadController {

	@Autowired
	UserReadService UserReadService;

	//去活动内容页面
	@RequestMapping("toReadList")
	public String toReadList(ModelMap map) {
		map.put("readList", UserReadService.findReadList());
		return "admin/activity/userRead_list";
	}
	//添加活动
	@ResponseBody
	@RequestMapping("addUserRead")
	public Integer addUserRead(UserRead userRead) {
		 int i = UserReadService.addUserRead(userRead);
		return i;
	}
	//去活动内容添加页面
	@RequestMapping("toAddRead")
	public String toAddRead() {
		return "admin/activity/userRead_add";
	}
	/**
	 * 删除活动
	 */
	@RequestMapping("deleteUserRead")
	@ResponseBody
	public Integer deleteManage(Integer readId){
		Integer i = UserReadService.deleteByPrimaryKey(readId);
		return i;
	}
	/**
	    * 
	    * Mr高 
	    * 功能 ：去修改页面
	    * @return
	    */
	   
	   @RequestMapping("toUpdUserRead")
	   public String toUpdUserRead(Integer readId,ModelMap map){
		   
		   map.put("userRead", UserReadService.selectUserReadOne(readId));
		   return "admin/activity/userRead_upd";
	   }
	   /**
	    * 
	    * Mr高  
	    * 功能 ：修改人员
	    * @return
	    */
	   @ResponseBody
	   @RequestMapping("updUserRead")
	   public Integer updUserRead(UserRead userRead){
		   Integer i = UserReadService.updateUserRead(userRead);
		   return i;
	   }
	   /**
		 * 
		 * Mr高
		 * 功能 ： 跳转图片上传页面
		 * @return
		 */
		@RequestMapping("toUploadImg")
		public String toUploadImg(HttpServletRequest request,UserRead userRead){
			
			request.setAttribute("userRead", userRead);
			return "admin/activity/userRead_img_add";
		}
		
		/**
		 * 
		 * Mr高
		 * 功能 ：活动图片上传
		 * @param 
		 * @param 
		 * @param 
		 * @return
		 */
		@RequestMapping("uploadImg")
		public boolean uploadImg(UserRead userRead,MultipartFile imagefile,HttpServletRequest request){
			boolean flag=false;
			
			String imgUrl = FilesUtils.FilesUpload_xm(request, imagefile, "/upload");
			int i = UserReadService.uploadImg(imgUrl,userRead);
			if (i>0) {
				flag=true;
			}
			return flag;
		}
		/**
		 * 
		 * 高孟圆  
		 * 功能 ： 后台用户优惠活动的查询
		 * @return
		 * @throws IOException 
		 */
		@RequestMapping("userReadActivityList")
		public String userReadActivityList(ModelMap map) {
			map.put("userReadActivityList", UserReadService.userReadActivityList());
			System.out.println(UserReadService.userReadActivityList());
			return "admin/activity/userReadActivity_list";
		}
}

package www.zhizunbao.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.service.TestService;
import www.zhizunbao.utils.FMUtils;

@Controller
@RequestMapping("/test/")
public class TestController {

	@Autowired
	private TestService testService;
	
	
	@RequestMapping("getTestList")
	public String getTestList(HttpServletRequest request){
		testService.getTestList();
		return "test/test";
	}
	
	@RequestMapping("free")
	public void testFreeMarker(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		HashMap<String,Object> map = new HashMap<String, Object>();
		FMUtils.createHtml(request, "testFreeMarker.ftl", "testFreeMarker.html", map);
		response.sendRedirect("/zhizunbao/html/testFreeMarker.html");
	}
}

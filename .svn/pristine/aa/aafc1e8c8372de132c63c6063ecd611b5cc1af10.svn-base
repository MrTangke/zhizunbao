package www.zhizunbao.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.zhizunbao.dto.manage.UserInfo;

public class FrontInteceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean flag=false;
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo1");
		if (null != userInfo) {
			flag=true;
		}else{
			//获得此请求的地址，请求地址包含application name，进行subStrig操作，去除application name
			String path = request.getRequestURI().substring(11);
			//获取请求中的参数
			String queryString = request.getQueryString();
			//防止空指针
			if (null==queryString) {
				queryString="";
			}
			//拼凑得到登录之前的地址
			String realPath=path+"?"+queryString;
			System.out.println("之前访问的网址是："+realPath);
			request.getSession().setAttribute("oldURL", realPath);
			String msg="请您先登录";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/userInfo/toUserLogin").forward(request, response);
		}
		return flag;
	}
	
}

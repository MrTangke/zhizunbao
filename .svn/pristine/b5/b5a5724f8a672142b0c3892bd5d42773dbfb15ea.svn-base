package www.zhizunbao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import www.zhizunbao.dto.manage.Log;
import www.zhizunbao.service.LogManagementService;

@Controller
@RequestMapping("logManagement")
public class LogManagementController {
	
	@Autowired
	private LogManagementService logManagementService;

	@RequestMapping("findLogAll")
	public String findLogAll(HttpServletRequest request){
		List<Log> logAll = logManagementService.findLogAll();
		request.setAttribute("logAll", logAll);
		return "admin/logmanagement/logmanagement_list";
	}
}

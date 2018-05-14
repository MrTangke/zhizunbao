<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>		
<body style="background: url('<%=basePath%>styles/behind/8.png') no-repeat left top;background-size:100%;">
 			<p  style="margin-top:220px; font-size:60px; font-family:楷体; color:blue; text-align: center;" ><b>欢迎使用至尊保后台管理系统</b></p>
</body>
</html>
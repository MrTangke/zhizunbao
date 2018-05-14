<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>404错误页面</title>
<meta name="Keywords" content="404错误页面"/>
<meta name="Description" content="404错误页面"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/insurance/css/error404.css">

</head>
<body>
	<div class="error404">
		<div class="info">
			<h1>404</h1>
			<h2>抱歉，您访问的页面不存在或已被删除！ (｡•ˇ‸ˇ•｡)</h2>
			<!--<p>The page you are looking for was moved, removed, renamed or might never existed.</p>-->
			<div class="menu">
				<a href="<%=basePath %>home/page">首页</a> | 
				<a href="<%=basePath %>frontInsure/findAllInsure">保险产品</a> | 
				<a href="<%=basePath %>userInfo/userInfoClaims">理赔</a> | 
				<a href="<%=basePath %>activit/tofrontActivity">活动</a> | 
				<a href="<%=basePath %>home/toContactUs">联系我们</a> 
			</div>
				
			
			<a href="<%=basePath %>home/page" class="btn">返回首页</a>
			<a href="javascript:history.go(-1);" class="btn btn-brown">返回上一步</a>
		</div>
		<div class="pic">
			<img src="<%=basePath %>styles/insurance/logo/404.gif" alt="" />
		</div>
	</div>
</body>
</html>
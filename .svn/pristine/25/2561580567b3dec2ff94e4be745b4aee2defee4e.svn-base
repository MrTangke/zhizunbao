<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>  
    <h3><font color="green">${message}</font></h3>  
    <div><font color="red" id='div1'></font></div>
</center>  
</body>
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">  
	//设定倒数秒数  
	var t = 5;  
	//显示倒数秒数  
	function showTime(){  
	    t -= 1;  
	    $("#div1").html("剩余："+t+"秒，跳转个人保险页面"); 
	    if(t==0){  
	        location.href='<%=basePath%>userInfo/toUserinfoInsure';  
	    }  
	    //每秒执行一次,showTime()  
	    setTimeout("showTime()",1000);  
	}  
	  
	  
	//执行showTime()  
	showTime();  
</script>  
</html>
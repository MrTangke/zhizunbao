<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录注册</title>
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/login.css">
</head>
<body>
<div class="wrapper">
    <div class="container">
        <div class="login_bg">
            <div class="form">
                <!--<div class="slogan"></div>-->
                <form action="<%=basePath %>userInfo/userLogin" method="post" name="loginForm" id="loginForm">
                    <h2>登录至尊保网</h2>
                    <div class="user_box">
                        <span class="icon"></span>
                        <input type="text" id="username" class="userName" name="userName" placeholder="用户名">
                    </div>
                    <div class="pwd_box">
                        <span class="icon"></span>
                       <input type="password" id="password" class="userPwd" name="userPassword" placeholder="密码">
                    </div>
                    <p><font color="#8a8a8a" size="6px">${msg }</font></p>
                    <div class="detail_box">
                        <input type="checkbox" id="login_check" checked="checked">
                        <label for="login_check">记住我</label>
                        <a href="#" class="forgetPwd">忘记密码？</a>
                    </div>
                    <div>
                        <input type="submit"  style="height: 50px" class="login_btn" id="loginBtn" value="登录">
                    </div>
                    <div>
                    	<p style="padding-top: 10px; padding-bottom: -5px">没有账号？注册一个吧</p>
                       <a href="<%=basePath%>userInfo/toUserRegister"><input type="button" style="height: 50px" class="login_btn" id="" value="注册"></a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--footer begin-->
    <div class="copyright">
        <div class="main_width footer">
            <div class="footer_nav">
                <p>
                    <a href="#">关于至尊保金融</a>
                    <span class="divider">|</span>
                    <a href="#">关于至尊保小金库</a>
                    <span class="divider">|</span>
                    <a href="#">关于至尊保钱包</a>
                    <span class="divider">|</span>
                    <a href="#">关于至尊保白条</a>
                    <span class="divider">|</span>
                    <a href="<%=basePath %>home/toContactUs">联系我们</a>
                    <span class="divider">|</span>
                    <a href="#">免责声明</a>
                </p>
                <p>Copyright © 2012-2024 至尊保bao.com 版权所有<span class="divider">|</span>投资有风险，购买需谨慎</p>
            </div>
            <div class="footer_contact">
                <div class="f_contact_time">
                    联系我们<span>（09:00-22:00）</span>
                </div>
                <div class="f_contact_content">
                    <div class="f_cc_left">
                        <span class="f_cc_item">个人业务：185-1566-9606</span>
                        <span class="f_cc_item">企业业务：185-1566-9606</span>
                    </div>
                    <div class="f_cc_mid">
                        <a href="#" class="f_cc_link item_JIMI">咨询JIMI</a>
                        <a href="#" class="f_cc_link item_kefu">在线客服</a>
                    </div>
                    <div class="f_cc_right">
                        <a href="#" class="f_cc_link item_mail">客服邮箱</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer end-->
</div>    
</body>
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
// 得到Cookie
// name：username、password
function getCookie(name) {
	// 浏览器username=admin; password=admin
    var strCookie=document.cookie;
    // 数组
    // [0]  username=admin	
    // [1]  password=admin
    var arrCookie=strCookie.split("; ");
    
    for(var i=0;i<arrCookie.length;i++) {
    	// username=admin
        var arr=arrCookie[i].split("=");
    	// arr[0]=username
        if(arr[0]==name)
        	// arr[1]=admin
            return arr[1];
    }
    return "";
}

// 设置Cookie
// name:username,value:admin
// name:password,value:admin
function setCookie(name,value) {
    var Days = 30;
    var exp = new Date();
    // 时间戳  exp.getTime()    ：           1970-1-1  至今的时间  毫秒数
    // 设置有效时间
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    // username=admin;
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

// 加载页面  
$(function() {
	var usernameStr = "username";
    var passwordStr = "password";
	// 判断cookie是否存在用户名密码
    if((getCookie(usernameStr)!=null&&getCookie(usernameStr)!="")&&getCookie(passwordStr)!=null&&getCookie(passwordStr)!=""){
    	$("#remember").attr("checked","checked");
        $("#username").val(getCookie(usernameStr));
        $("#password").val(getCookie(passwordStr));
       
    }
	
	 // 加载页面，给复选框一个点击事件
    $("#login_check").click(function(){
        var ischeck=$(this).is(":checked"); 
        var loginVal = "";
        var passwordVal = "";
        // 判断是否选中
        if(ischeck){
            loginVal = $("#username").val();
            passwordVal = $("#password").val();
        }
        // 设置cookie
        setCookie(usernameStr,loginVal);
        setCookie(passwordStr,passwordVal);
    });
});
</script>	
</html>
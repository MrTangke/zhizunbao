<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/login.css">
</head>
<body>
<div class="wrapper">
    <div class="container">
        <div class="login_bg">
            <div class="form">
                <form name="loginForm" id="loginForm">
                    <h2>注册至尊保</h2>
                    <div class="user_box">
                        <span class="icon"></span>
                        <input type="text" id="username" onblur="doVerify();" class="required userName" required="required" data-valid="isNonEmpty" data-error="用户名必填" name="userName" placeholder="用户名">
                        <p id="msg"></p>
                    </div>
                    <div class="pwd_box">
                        <span class="icon"></span>
                        <input type="password" id="user_password" required="required"  class="userPwd" name="userPassword" placeholder="密码">
                    </div>
                    <div class="pwd_box">
                        <span class="icon"></span>
                        <input type="password" id="user_passwordConfirm" required="required" class="userPwd" placeholder="确认密码">
                    </div>
                    <div class="tel_box">
                        <span class="icon"></span>
                        <input type="text" id="phone" class="userTel" name="userTel" required="required" placeholder="请输入您的手机号" maxlength="11">
                        <p id="phoneP"></p>
                    </div>
                   <div class="validate_box">
                        <input type="text" class="validate" name="validate" placeholder="请输入验证码"><input type="button" class="validate_btn" value="发送验证码">
                    </div>
                    <div class="detail_box">
                        
                    </div>
                    <div>
                        <input type="button" onclick="test();" class="login_btn" id="sub" value="注册">
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
<!-- js -->
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script src="<%=basePath %>styles/insurance/layer/layer.js" type="text/javascript"></script>
<!-- 判断两次密码是否一致 -->	
<script>
/* (function(){
    var sub = document.getElementById("sub");
    //初始化移入移出事件
    if(sub.addEventListener){
        sub.addEventListener("click", test);  
    }else if(sub.attachEvent){
        sub.attachEvent("onClick", test);
    }
})(); */
 
// 用户名验证唯一
    function doVerify(){
        //获取界面的账号
		var account = $("#username").val();
        
        //如果账号输入不为空，执行该方法
        if(account !=""){
          $.ajax({
            url:"<%=basePath %>userInfo/testUserName",//后台查询验证的方法
            data:{"userName": account},//携带的参数
            type: "post",
            success: function(msg){
              //根据后台返回前台的msg给提示信息加HTML
              if(msg){
                // 账号不存在
                $("#msg").html("<font size='4px' color='green'>恭喜，"+account+"可以注册！</font>");
                $("#sub").prop("disabled",false);
              }
              else{
                // 账号已经存在
                $("#msg").html("<font  size='4px' color='red'>抱歉，"+account+"已被注册，请更换！</font>");
                $("#sub").attr("disabled","disabled");
              }
            }
          });
        }else{
        	layer.msg('用户名不能为空！');
        	$("#sub").attr("disabled","disabled");
        	return false;
        }
      }	
 //表单提交事件
function test(){
    var password = document.getElementById("user_password");
    var passwordConfirm = document.getElementById("user_passwordConfirm");
    if(password.value != passwordConfirm.value){
    	layer.msg('对不起，您2次输入的密码不一致');
    	}
    else{
		var fl=testPhont();
		if(fl){
    		 $.post(
 					"<%=basePath %>userInfo/userRegister",
 					$("#loginForm").serialize(),
 					function(msg){
 						if(msg){
 							layer.confirm('注册成功！', {
 								  btn: ['确定'] //按钮
 								}, function(){
 									location="<%=basePath %>userInfo/toUserLogin";
 								});
 						}else{
 							layer.msg('注册失败！');
 						}
 						
 					},"json"
 				);
		   }else{
			   return false;
		   }
    	} 
}
 
//验证手机号
function testPhont(){
var phone = jQuery("#phone").val();  
var flag = false;  
var message = "";  
var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;         
if(phone == ''){  
  message = "手机号码不能为空！";  
}else if(phone.length !=11){  
  message = "请输入有效的手机号码！";  
}else if(!myreg.test(phone)){  
  message = "请输入有效的手机号码！";  
}else{  
    flag = true;  
}  
if(!flag){  
	  //提示错误效果  
  $("#phoneP").html("<font  size='4px' color='red'>"+message+"</font>");  
  $("#phone").focus();  
}else{  
  //提示正确效果   
  $("#phoneP").html("<font size='4px' color='green'>该手机号码可用</font>");  
}  
return flag;
}
</script>	
<script>
    //   兼容ie9的placeholder
    function isPlaceholder() {
        var input = document.createElement('input');
        return 'placeholder' in input;
    }
    if (!isPlaceholder()) {//不支持placeholder 用jquery来完成
        $(document).ready(function () {
            if (!isPlaceholder()) {
                $("input").not("input[type='password']").each(//把input绑定事件 排除password框
                        function () {
                            if ($(this).val() == "" && $(this).attr("placeholder") != "") {
                                $(this).val($(this).attr("placeholder"));
                                $(this).focus(function () {
                                    if ($(this).val() == $(this).attr("placeholder")) $(this).val("");
                                });
                                $(this).blur(function () {
                                    if ($(this).val() == "") $(this).val($(this).attr("placeholder"));
                                });
                            }
                        });
                //对password框的特殊处理1.创建一个text框 2获取焦点和失去焦点的时候切换
                $("input[type='password']").each(
                        function () {
                            var pwdField = $(this);
                            var pwdVal = pwdField.attr('placeholder');
                            pwdField.after('<input  class="login_input" type="text" value=' + pwdVal + ' autocomplete="off" />');
                            var pwdPlaceholder = $(this).siblings('.login_input');
                            pwdPlaceholder.show();
                            pwdField.hide();

                            pwdPlaceholder.focus(function () {
                                pwdPlaceholder.hide();
                                pwdField.show();
                                pwdField.focus();
                            });

                            pwdField.blur(function () {
                                if (pwdField.val() == '') {
                                    pwdPlaceholder.show();
                                    pwdField.hide();
                                }
                            });
                        })
            }
        });
    }
    //    end
</script>
</html>
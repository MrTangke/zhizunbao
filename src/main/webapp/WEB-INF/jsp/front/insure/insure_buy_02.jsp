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
    <title>填写保单</title>
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/book.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/easydropdown.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/detail.css">
</head>
<body>
<div class="wrapper">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：185-1566-9606（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <c:if test="${userInfo1!=null }">
	                <span class="my_insurance"><a href="<%=basePath%>userInfo/toUserinfoInsure">我的保险</a></span>
	                <span class="message"><a href="<%=basePath%>userInfo/toUserinfoMessage">消息<em>${userInfo1.userMsg }</em></a></span>
					<span><font>欢迎，${userInfo1.userName }</font></span>
					<a href="<%=basePath%>userInfo/userInvalidate?user_id=${userInfo1.userId }">注销登录</a>
				</c:if>
				<c:if test="${userInfo1==null }">
						 <span class="register"><a href="<%=basePath%>userInfo/toUserRegister">注册</a></span>
               			 <span class="fg"><a href="#"> &nbsp;|&nbsp; </a></span>
               			 <span><a href="<%=basePath%>userInfo/toUserLogin">登录</a></span>
				</c:if>
            </span>
        </div>
    </div>
    <!---------------------------------------header_user end-------------------------------------->
    <!---------------------------------------header_nav begin------------------------------------->
    <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">大特保保险官网-互联网保险服务平台</a></h1>
            <a style="float: right;margin-right: -155px" href="<%=basePath%>userInfo/toUserinfoInsure" class="my_policy fr">我的保单</a>
            <div class="menuBox">
               <ul class="menu">
               		<li>
               			<a href="<%=basePath %>home/page">首页</a>
                    </li>
		           <li class="special">
		               	<a href="<%=basePath %>frontInsure/findAllInsure">保险产品</a>
		           </li>
                    <li>
               			<a href="<%=basePath %>userInfo/userInfoClaims">理赔</a>
                    </li>
                     <li>
               			<a href="<%=basePath %>activit/tofrontActivity">活动</a>
                    </li>
                	 <li>
               			<a href="<%=basePath %>home/toContactUs">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
         <!--------------------------------- form section ---------------------->
    	<div style="float:left;margin:-38px 0 0 461px">
    		<div style="position: relative;">
	           <form id="myForm" action="<%=basePath %>frontInsure/findInsureListByName" method="post">
	           		<input value="请输入关键字" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 209px;height:31px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 213px"  type="image"  src="<%=basePath%>styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>        	
    </div>
	<!------------------------------------- end form section ---------------------->	
    <!----------------------------------------header_nav end-------------------------------------->
    <div class="container main_width">
        <div class="book_box">
            <h1>${insure.insureName }</h1>
            <div class="procedures mb10">
                <img src="<%=basePath %>styles/insurance/images/book/roll02.jpg" alt="图片消失了">
            </div>
            <!--被保人信息-->
            <div class="verificationBox">
                <h2 class="">被保人
                    <a href="javascript:" onclick="clearMyForm();" class="resetMess">清空以下输入信息</a>
                </h2>
                <form action="<%=basePath %>frontBuy/toBuyThree" id="myForm1" method="post">
                    <input type="hidden" name="insureId" value="${insure.insureId }">
                    <p>
                        <label for="recognizeName">姓&emsp;&emsp;名</label>
                        <input type="text" required="required" id="username" name="realName" value="${userInfo1.realName }" class="input" id="recognizeName">
                    </p>
                    <p>
                        <label for="papers">证&emsp;&emsp;件</label>
                        <select id="papers" class="dropdown">
                            <option value="1">身份证</option>
                        </select>
                    </p>
                    <p>
                        <label for="papers_num">证件号码</label>
                        <input type="text"  id="userCard" name="userCard" class="input" value="${userInfo1.userCard }">
                   		<span id="cardP"></span>
                    </p>
                    <p class="info_box">
                        <label>出生日期</label>
                        <input class="laydate-icon" id="birthDate" name="userBirthday" style="width:263px;" onfocus="laydate();" onmouseup="laydate();" name="userBirthday" value="${userInfo1.userBirthday }">
                    </p>
                    <p>
                        <label>性&emsp;&emsp;别</label>
                        <label>
                            <input type="radio" ${userInfo1.userSex==0?'checked':'' } value="0" name="userSex">男
                        </label>
                        <label>
                            <input type="radio" ${userInfo1.userSex==1?'checked':'' } value="1" name="userSex">女
                        </label>
                    </p>
                    <input type="button" onclick="tijiao();" class="subBtn" value="继续">
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
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script src="<%=basePath %>styles/insurance/laydate/laydate.js"></script>
<script src="<%=basePath %>styles/insurance/js/detail.js"></script>
<script src="<%=basePath %>styles/insurance/js/jquery.easydropdown.js"></script>
<script src="<%=basePath %>styles/insurance/layer/layer.js" type="text/javascript"></script>
<script>
	function clearMyForm(){
	 $("#papers_num").val("");
	 $("#username").val("");
	 $("#birthday").val("");
		
	}
	
	function tijiao(){
		var username=$("#username").val();
		if(username!=""){
		var flag = testCard();
		if(flag){
			layer.confirm('确认信息无误？', {
				  btn: ['确定','不确定'] //按钮
				}, function(){
					$("#myForm1").submit();
				}, function(){
					layer.msg('请确保身份信息无误在提交哦！');
				});
		}else{
			return false;
		}
	}else{
		layer.msg('姓名不能为空哦！');
	}
		
	}
    //验证身份证   
    function testCard(){
    var card = $("#userCard").val();  
    var flag = false;  
    var message = "";  
    var myreg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;         
    if(card == ''){  
      message = "身份证号不能为空！";  
    }else if(card.length !=18){  
      message = "请输入有效的身份证号！";  
    }else if(!myreg.test(card)){  
      message = "请输入有效的身份证号！";  
    }else{  
        flag = true;  
    }  
    if(!flag){  
    	  //提示错误效果  
      $("#cardP").empty();
      layer.tips(''+message+'', '#userCard'); 
      $("#userCard").focus();  
    }else{  
      //提示正确效果   
      $("#cardP").html("<font size='4px' color='green'>身份证验证通过</font>"); 
    }  
    return flag;
    }		
    $(function () {
        //手机输入法问题
        $("#recognizeName").focus(function () {
//            $("body").animate({
//                'scrollTop': '100'
//            })
            $("body").scrollTop(100);
        });
        $("#recognizeName").blur(function () {
            $("body").animate({
                'scrollTop': '0 '
            })
        });
    })
</script>
</body>
</html>
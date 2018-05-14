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
    <div class="main_width container">
        <h1>${insure1.insureName }</h1>
        <div class="procedures">
            <img src="<%=basePath %>styles/insurance/images/book/roll03.jpg" alt="图片消失了">
        </div>
        <div class="con_detail">
            <h2>产品信息</h2>
            <ul>
                <li>保险名称：${insure1.insureName }</li>
                <li>
                    价&nbsp;&nbsp;格：<span class="picFrom">5</span>元人民币
                </li>
                <li>保&nbsp;&nbsp;额：</li>
                <li>
	                <table border="1px">
	                	<tr>
	                		<th>保险范围</th>
	                		<th>保险金额</th>
	                	</tr>
	                	<c:forEach items="${insure1.safeGuards }" var="isa">
	                		<tr>
	                			<td>${isa.safeguardProject }</td>
	                			<td>${isa.safeguardMoney }</td>
	                		</tr>
	                	</c:forEach>
	                </table>
                </li>
            </ul>
            <h3>被保险人信息</h3>
            <ul>
                <li>姓&nbsp;&nbsp;名：${userInfo1.realName }</li>
                <li>性&nbsp;&nbsp;别：${userInfo1.userSex==0?'男':'女' }</li>
                <li>证件号码：身份证：${userInfo1.userCard }</li>
                <li>出生日期：${userInfo1.userBirthday }</li>
            </ul>
            <h2>受益人信息</h2>
            <ul>
                <li>
                    受益人：<em>法定</em>
                </li>
            </ul>
            <h2>支付金额</h2>
            <!--积分-->
            <div class="total">
                <p>
                    保险金额：
                    <span class="wprice">
                        <span>￥</span>
                        <em>${insure1.insurePrice }</em>
                    </span>
                </p>
                 <p>
                    优&nbsp;&nbsp;惠：
                    <span class="wprice">
                        <span class="dor">￥</span>
                        <select id="select" onchange="youhui();">
                        	<option value="0">0</option>
                        	<c:forEach items="${UserDiscounts }" var="udis">
                        		<option value="${udis.id }">${udis.userMoney }</option>
                        	</c:forEach>
                        </select>元
                    </span>
                </p> 
                <p>------------------------------</p>
                <p>
                    合&nbsp;&nbsp;计：
                    <span class="wprice">
                        <span>￥</span>
                        <em id="zuihou">${insure1.insurePrice }</em>
                    </span>
                </p>
            </div>
            <div class="payment"><a href="javascript:;" onclick="pay();" id="subBtn">立即付款</a></div>
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
    <div class="sideBar">
        <a href="#" class="slider_block app"><i></i></a>
        <a href="#" class="slider_block jimi"><i></i></a>
        <a href="#" class="slider_block feedback"><i></i></a>
        <a href="javascript:" class="slider_block backtop" id="backtop"><i></i></a>
    </div>
</div>
</body>
<script src="<%=basePath %>styles/behind/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath %>styles/insurance/laydate/laydate.js"></script>
<script src="<%=basePath %>styles/insurance/js/detail.js"></script>
<script type="text/javascript">
	//选取优惠金额
	function youhui(){
		var startMoney = ${insure1.insurePrice };
		var youhui = Number($("option:selected").text());
		//alert(youhui+typeof(youhui));
		var lastMoney = startMoney-youhui;
		$("#zuihou").text("");
		$("#zuihou").text(lastMoney); 
	}
	//付款
	function pay(){
		 var insureId = ${insure1.insureId};
		 var insurePrice = ${insure1.insurePrice };
		 var id = $("option:selected").val();
		 //alert(insureId+" "+insurePrice+" "+id);
		 location = "<%=basePath %>frontBuy/toPay?insureId="+insureId+"&id="+id;
	}
</script>
</html>
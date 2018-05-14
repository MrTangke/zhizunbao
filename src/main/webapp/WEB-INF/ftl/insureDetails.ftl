<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${userInfo.insureName }</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" href="${basePath}styles/behind/css/style.css" />
	<link href="${basePath}styles/behind/assets/css/codemirror.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="${basePath}styles/behind/assets/css/ace.min.css" />
	<link rel="stylesheet"
		href="${basePath}styles/behind/font/css/font-awesome.min.css" />
	<!--[if lte IE 8]>
			  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
			<![endif]-->
 <link rel="stylesheet" href="${basePath}styles/insurance/css/common.css">
    <link rel="stylesheet" href="${basePath}styles/insurance/css/index.css">
    <link rel="stylesheet" href="${basePath}styles/insurance/css/jquery.slideBox.css">
    <link rel="stylesheet" href="${basePath}styles/insurance/css/center.css">
    <script src="${basePath}styles/insurance/js/jquery-1.12.3.min.js"></script>
</head>
<body>
<div class="wrapper" style="height:1000px;">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：400-663-6600（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <#if userInfo1?? >
                <span class="my_insurance"><a href="${basePath}userInfo/toUserinfoInsure">我的保险</a></span>
                <span class="message"><a href="#">消息<em>${userInfo1.userMsg!''}</em></a></span>
						<span><font>欢迎，${userInfo1.userName }</font></span>
						<a href="${basePath}userInfo/userInvalidate?user_id=${userInfo1.userId }">注销登录</a>
				
				<#else>
						 <span class="register"><a href="${basePath}userInfo/toUserRegister">注册</a></span>
               			 <span class="fg"><a href="#"> &nbsp;|&nbsp; </a></span>
               			 <span><a href="${basePath}userInfo/toUserLogin">登录</a></span>
				</#if>
            </span>
        </div>
    </div>
    <!---------------------------------------header_user end-------------------------------------->
    <!---------------------------------------header_nav begin------------------------------------->
    <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">大特保保险官网-互联网保险服务平台</a></h1>
            <a style="float: right;margin-right: -155px" href="${basePath}userInfo/toUserinfoInsure" class="my_policy fr">我的保单</a>
            <div class="menuBox">
               <ul class="menu">
               		<li>
               			<a href="${basePath}home/page">首页</a>
                    </li>
		           <li class="special">
		               	<a href="${basePath}frontInsure/findAllInsure">保险产品</a>
		           </li>
                    <li>
               			<a href="${basePath}userInfo/userInfoClaims">理赔</a>
                    </li>
                     <li>
               			<a href="${basePath}45">活动</a>
                    </li>
                	 <li>
               			<a href="${basePath}home/toContactUs">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
         <!--------------------------------- form section ---------------------->
    	<div style="float:left;margin:-38px 0 0 461px">
    		<div style="position: relative;">
	           <form id="myForm" action="${basePath}frontInsure/findInsureListByName" method="post">
	           		<input value="请输入关键字" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 192px;height:23px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 213px"  type="image"  src="${basePath}styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>        	
    </div>        
	              <div style="float:left; width: 700px;margin-left: 375px;">
	                <p align="center" style="font-size: 20px; margin-top:50px;">保险类型：${userInfo.insureName}</p>
	              <p align="center" style="font-size: 20px; margin-top:50px;">
	                           被保险人：${userInfo.realName}&nbsp;&nbsp;&nbsp;&nbsp;
	                           投保时间：${userInfo.buyTime} 
	              </p>
	              <p align="center" style="font-size: 20px; margin-top:50px;">
	                           保单金额：￥${userInfo.buyMoney}&nbsp;&nbsp;&nbsp;&nbsp;
	                           实付款：￥${userInfo.buyMoney} 
	              </p>
	               <p  style="font-size: 20px; margin-top:50px; ">
	                           保单内容：
	              </p>
	               <p  style="font-size: 20px; margin-top:20px;  text-indent:2em;">
	               ${userInfo.insureContent}
	              </p>
	               <p   style="font-size: 20px; float:right; margin-top:100px">
	                 <a href="${basePath}userInfo/poiWord?id=${userInfo.id}" style="cursor:pointer; font-weight:bold; color:red;">点击生成Word文档</a>
	              </p>
	              </div>
            </div>
        </div>
    </div>
        <!--footer begin-->
        <div class="copyright">
        <div class="main_width footer">
            <div class="footer_nav">
                <p>
                    <a href="#">关于京东金融</a>
                    <span class="divider">|</span>
                    <a href="#">关于京东小金库</a>
                    <span class="divider">|</span>
                    <a href="#">关于京东钱包</a>
                    <span class="divider">|</span>
                    <a href="#">关于京东白条</a>
                    <span class="divider">|</span>
                    <a href="#">联系我们</a>
                    <span class="divider">|</span>
                    <a href="#">免责声明</a>
                </p>
                <p>Copyright © 2004-2016 京东JD.com 版权所有<span class="divider">|</span>投资有风险，购买需谨慎</p>
            </div>
            <div class="footer_contact">
                <div class="f_contact_time">
                    联系我们<span>（09:00-22:00）</span>
                </div>
                <div class="f_contact_content">
                    <div class="f_cc_left">
                        <span class="f_cc_item">个人业务：400-098-8511</span>
                        <span class="f_cc_item">企业业务：400-088-8816</span>
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
</div>
</body>
<script src="${basePath}/styles/insurance/js/jquery-1.12.3.min.js"></script>
<script>
    $(function(){
    	$(".mc").show();
        $("#mypolicyTab").find("ul").find("li").click(function () {
            index=$(this).index();
            $(this).addClass("active").siblings().removeClass("active");
            $(".mycenter_right").find("div.mypolicy_con").eq(index).show().siblings("div.mypolicy_con").hide();
        });
    });
    function findOne(id) {
		location.href="${basePath}userInfo/insureDetails?id="+id;
	}
</script>
</html>
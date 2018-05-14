<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link href="assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="font/css/font-awesome.min.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>管理权限</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link href="<%=basePath %>styles/behind/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=basePath %>styles/behind/assets/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<link rel="stylesheet"
	href="<%=basePath %>styles/behind/assets/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=basePath %>styles/behind/assets/css/ace-rtl.min.css" />
<link rel="stylesheet"
	href="<%=basePath %>styles/behind/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath %>styles/behind/css/style2.css" />
<!--[if lte IE 8]>
		  <link rel="<%=basePath %>styles/behind/stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="<%=basePath %>styles/behind/assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>
		<script src="<%=basePath %>styles/behind/assets/js/html5shiv.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/respond.min.js"></script>
		<![endif]-->
<!--[if !IE]> -->
<script src="<%=basePath %>styles/behind/js/jquery-1.9.1.min.js"></script>
<!-- <![endif]-->
<!--[if IE]>
         <script type="text/javascript">window.jQuery || document.write("<script src='<%=basePath %>styles/behind/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");</script>
        <![endif]-->
<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=basePath %>
	styles/behind/assets/js/jquery.mobile.custom.min.js'>"
						+ "<"+"script>");
</script>
<script src="<%=basePath%>styles/behind/assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>styles/behind/assets/js/typeahead-bs2.min.js"></script>
<!--[if lte IE 8]>
		  <script src="<%=basePath%>styles/behind/assets/js/excanvas.min.js"></script>
		<![endif]-->
<script src="<%=basePath%>styles/behind/assets/js/ace-elements.min.js"></script>
<script src="<%=basePath%>styles/behind/assets/js/ace.min.js"></script>
<script src="<%=basePath%>styles/behind/assets/layer/layer.js"
	type="text/javascript"></script>
<script src="<%=basePath%>styles/behind/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script src="<%=basePath%>styles/behind/js/jquery.nicescroll.js"
	type="text/javascript"></script>

</head>
<body>
	<div class="margin clearfix">
		<div class="border clearfix">
			<span class="l_f">
			</span> <span class="r_f">
			</span>
		</div>
		<div class="compete_list">
			<table id="sample-table-1"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>申请人</th>
						<th>保险名称</th>
						<th>申请时间</th>
						<th>伤残等级</th>
						<th>出险时间</th>
						<th>理赔金额</th>
						<th>理赔状态</th>
						<th class="hidden-480">操作</th>
					</tr>
				</thead>
				<c:forEach items="${userApplies}" var="app">
					<tbody>
						<tr>
							<td>${app.userName}
							</td>
							<td>${app.insureName}</td>
							<td>${app.claimDate}</td>
							<td>${app.claimLv}</td>
							<td>${app.problemDate}</td>
							<td>${app.applyMomey}</td>
							<td>
							<c:if test="${app.applyStatus==0}">
							未审核
							</c:if>
							<c:if test="${app.applyStatus==1}">
							已通过审核
							</c:if>
							<c:if test="${app.applyStatus==2}">
							未通过审核
							</c:if>
							</td>
							<td class="ss">
							<c:if test="${app.applyStatus==0}">
							<a title="通过审核" onclick="Competence_modify(${res.resId})"
								href="<%=basePath %>userApply/getApproved?applyId=${app.applyId} "
								class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
								<a title="未通过审核"
								href="<%=basePath %>userApply/unGetApproved?applyId=${app.applyId}"
								class="btn btn-xs btn-warning"><i
									class="icon-trash  bigger-120"></i></a>
									 </c:if>
									</td>
						</tr>
						 
				</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<!--添加权限样式-->
	<div id="Competence_add_style" style="display:none">
   <div class="Competence_add_style">
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 权限名称 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" placeholder=""  name="权限名称" class="col-xs-10 col-sm-5"></div>
	</div>
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 权限说明 </label>
       <div class="col-sm-9"><textarea name="权限说明" class="form-control" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span></div>
	</div>
   </div> 
  </div>
</body>

<script type="text/javascript">



	/*添加权限*/
	$(function(){
		if(${res.pId}==1||${res.pId}==2||${res.pId}==3}){
			$(".ss").each(function(){
				$(this).css({"display":"block"})
			})
		}
	})
	/*权限-删除*/
	function Competence_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			$(obj).parents("tr").remove();
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});
	}
	/*修改权限*/
	function Competence_modify(id) {
		window.location.href = "<%=basePath%>/resources/toUpdateResourcesById?=" + id;
	};
	/*字数限制*/
	function checkLength(which) {
		var maxChars = 200; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您出入的字数超多限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; //250 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	};
	//批量删除
	  function deleteAll() {
        	  var flag = false;
        	  var deId = document.getElementsByName("check");
        	  alert(deId)
        	  for (var i = 0; i < deId.length; i++) {
        	   if (deId[i].checked) {
        	    flag = true;
        	   }  
        	  }
        	  if (!flag) {
        	   alert("请选择需要删除的权限！");
        	   return ;
        	  }
        	  if (window.confirm("确认删除吗？")) {
            	  
         	return true;
        	 
        	  }return false;
        	} 
	//全选
	 function selectAll(){
		 var flag=document.getElementById("allChecks").checked;
		 var cks=document.getElementsByName("check");
		 for(var i=0;i<cks.length;i++){
		 cks[i].checked=flag;
		 }
	}
	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.Order_form ,#Competence_add').on('click', function() {
		var cname = $(this).attr("title");
		var cnames = parent.$('.Current_page').html();
		var herf = parent.$("#iframe").attr("src");
		parent.$('#parentIframe span').html(cname);
		parent.$('#parentIframe').css("display", "inline-block");
		parent.$('.Current_page').attr("name", herf).css({
			"color" : "#4c8fbd",
			"cursor" : "pointer"
		});
		//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
		parent.layer.close(index);

	});
</script>
</html>
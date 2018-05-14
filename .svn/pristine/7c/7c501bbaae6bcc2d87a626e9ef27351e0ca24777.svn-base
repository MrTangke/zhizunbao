<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/styles/common/behind/cssStyle.jsp" %>	
</head>
<body>

<div class=" clearfix">
 <div id="add_brand" style="margin-left: 20%" class="clearfix">
 <div>
<form id="myForm"  action="<%=basePath %>/role/Update" method="post"> 
   <ul class="add_conent">
    <li class=" clearfix"><label class="label_name"><i><font color="red"></font></i></label><input value="${role.roleId }" name="roleId" type="hidden" class="add_text"/></li>
    <li class=" clearfix"><label class="label_name"><i><font color="red">*</font></i>角色:</label><input value="${role.roleName }" name="roleName" type="text" class="add_text"/></li>
    <li class=" clearfix"><label class="label_name">角色描述:</label> <textarea name="roleContent"  cols="" rows="" class="textarea" onkeyup="checkLength(this);">${role.roleContent }</textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">255</span>字</span></li>
    <li><input type="button" onclick="Uptaseat()" class="btn btn-warning" value="保存"/><input onclick="javascript:history.go(-1);" type="button" value="取消" class="btn btn-warning"/></li>
   </ul>
 </form> 
 </div>
 </div>
 </div>
</body>
<%@include file="/styles/common/behind/jsStyle.jsp" %>	
</html>
<script type="text/javascript">
	
	//修改角色
	function Uptaseat(){
	var role =	$("#myForm").serialize();
	 var url =	"<%=basePath %>/role/Update";
	alert(role);
	$.post(
			 url,
		$("#myForm").serialize(),
		function(msg){
			if (msg) {
				location="<%=basePath%>role/toAdministrator";
			}else{
				layer.msg('添加失败!',{icon: 5,time:1000});
			}
		}
	) 
	}
     $(document).ready(function(){
 $(".left_add").height($(window).height()-60); 
  $(".right_add").width($(window).width()-600);
   $(".right_add").height($(window).height()-60);
  $(".select").height($(window).height()-195); 
  $("#select_style").height($(window).height()-220); 
 //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		  $(".right_add").width($(window).width()-600); 
		 $(".left_add").height($(window).height()-60);
		 $(".right_add").height($(window).height()-60); 
		 $(".select").height($(window).height()-195); 
		$("#select_style").height($(window).height()-220); 
	});
	 })
	function checkLength(which) {
	var maxChars = 255;
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您出入的字数超多限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; // 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}

</script>

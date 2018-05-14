<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改权限</title>
	<%@ include file="/styles/common/behind/cssStyle.jsp" %>
</head>
<body>
	<div class="left_Competence_add">
   <div class="title_name">修改权限</div>
   	<form action="updateResourcesById" method="post"> 
   		 <div class="Competence_add">
   		 
   	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">请选择父类权限</label>
       <div class="col-sm-9"><select class="pars"  id="form-field-1"  name="pId" class="col-xs-10 col-sm-5">
       							<option value="0">最高级</option>
       						</select>
       </div>
	</div>
    <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">  </label>
       <div class="col-sm-9"><input type="hidden" value="${resources.resId }" id="form-field-1" placeholder=""  name="resId" class="col-xs-10 col-sm-5"></div>
	</div>
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 权限名称 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="${resources.resName }" placeholder="请输入修改的名称"  name="resName" class="col-xs-10 col-sm-5"></div>
	</div>
	
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 权限网址 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="${resources.resUrl }" placeholder="请输入修改的网址"  name="resUrl" class="col-xs-10 col-sm-5"></div>
	</div>
	
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 权限队列 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="${resources.resOrder }" placeholder="请输入修改的网址"  name="resOrder" class="col-xs-10 col-sm-5"></div>
	</div>
	
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 权限描述 </label>
      <div class="col-sm-9"><textarea name="resContent" class="form-control"  id="form_textarea" placeholder="请输入对权限的描述" onkeyup="checkLength(this);">${resources.resContent }</textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span></div>
	</div>
   
   <!--按钮操作-->
   <div class="Button_operation">
				<button onclick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i> 保存并提交</button>
			</div>
   </div>
 		</form> 
   </div>
</body>
	<%@ include file="/styles/common/behind/jsStyle.jsp" %>
<script type="text/javascript">
//初始化宽度、高度  
 $(".left_Competence_add,.Competence_add_style").height($(window).height()).val();; 
 $(".Assign_style").width($(window).width()-500).height($(window).height()).val();
 $(".Select_Competence").width($(window).width()-500).height($(window).height()-40).val();
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	
	$(".Assign_style").width($(window).width()-500).height($(window).height()).val();
	$(".Select_Competence").width($(window).width()-500).height($(window).height()-40).val();
	$(".left_Competence_add,.Competence_add_style").height($(window).height()).val();;
	});
/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
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
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
	/*ajax查询*/
	$(function(){
		$.post(
			"findResourcesList",
			{},
			function(obj){
				for(var i in obj){
					$(".pars").append("<option value="+obj[i].resId+">"+obj[i].resName+"</option>");
				}
			},"json"
		)
	});
	
/*按钮选择*/
$(function(){
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
		
	});
});

</script>


</html>
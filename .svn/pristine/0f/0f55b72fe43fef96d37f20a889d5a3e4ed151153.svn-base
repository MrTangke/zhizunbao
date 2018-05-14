<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/styles/common/behind/cssStyle.jsp" %>	
	<title>保障范围管理</title>
</head>
<body>
<body>
 <div class="margin clearfix">
   <div class="border clearfix">
       <span class="l_f">
        <a title="添加保障范围" onclick="member_add('添加保障范围','<%=basePath %>insure/toAddSafeGuard','900','600')" href="javascript:;" class="btn btn-warning"><i class="fa fa-plus"></i> 添加保障范围</a>
        <a title="导入Excel" onclick="member_ImportExcel('导入Excel','<%=basePath %>insure/toImportExcel','600','600')" href="javascript:;" class="btn btn-success"><i class="fa fa-plus"></i> 导入Excel</a>
       </span>
     </div>
     <div class="compete_list">
       <table id="sample-table-1" class="table table-striped table-bordered table-hover">
		 <thead>
			<tr>
			  <th>序号</th>
			  <th width="260px">保障项目</th>
			  <th width="120px">保障金额</th>
			  <th>保障范围</th>
			  <th width="150px">操作</th>
             </tr>
		    </thead>
             <tbody>
	             <c:forEach items="${safeGuardList }" var="s" varStatus="n">
					  <tr>
						<td>${n.count }</td>
						<td>${s.safeguardProject}</td>
						<td>${s.safeguardMoney}</td>
						<td>${s.safeguardScope}</td>
						<td class="td-manage">
				          <a title="编辑" onclick="member_edit('修改','<%=basePath %>insure/toUpdateSafeGuard','${s.safeguardId }','900','600')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
				          <a title="删除" href="javascript:;"  onclick="member_del(this,'${s.safeguardId }','${s.safeguardProject }')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
				        </td>
					   </tr>
				  </c:forEach> 												
		      </tbody>
	        </table>
     </div>
 </div>
</body>
<%@include file="/styles/common/behind/jsStyle.jsp" %>	
</html>
<script type="text/javascript">
/*保障范围-新增*/
function member_add(title,url,w,h){
	/* url = url + "?insureId=" + insureId; */
	layer_show(title,url,w,h);
	
}
function member_ImportExcel(title,url,w,h){
	/* url = url + "?insureId=" + insureId; */
	layer_show(title,url,w,h);
	
}

/*保障范围-编辑*/
function member_edit(title,url,safeguardId,w,h){
	url = url + "?safeguardId=" + safeguardId;
	layer_show(title,url,w,h);
	
}

/*保障范围-删除*/
function member_del(obj,safeguardId,safeguardProject){
	layer.confirm("确定要删除  <span style='color:red'>" + safeguardProject + "</span> 这项吗?",function(index){
		var url = "<%=basePath%>insure/deleteSafeGuard";
		var params = {};
		params.safeguardId = safeguardId;
		$.post(url,params,function(result){
			if(result > 0){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			}else{
				layer.msg('删除失败!',{icon:1,time:1000});
			}
		});
	});
}

//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form ,#Competence_add').on('click', function(){
	var cname = $(this).attr("title");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe span').html(cname);
	parent.$('#parentIframe').css("display","inline-block");
    parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>
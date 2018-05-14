<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <%@include file="/styles/common/behind/cssStyle.jsp" %>	
 <%@include file="/styles/common/behind/jsStyle.jsp" %>	
<title>活动内容管理</title>
</head>

<body>
<div class="clearfix">
 <div class="article_style" id="article_style">
          
 <!--文章列表-->
 <div class="sort_style" style="width: 2000px; margin-left: 0px;">
    <div class="border clearfix">
       <span class="l_f">
        <a href="<%=basePath%>userRead/toAddRead"  title="添加文章" id="add_page" class="btn btn-warning"><i class="fa fa-plus"></i> 添加文章</a>
      
       </span>
       
     </div>
     <div class="article_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
       <thead>
		 <tr>
				<th width="25"><label><input type="checkbox"  class="ace"><span class="lbl"></span></label></th>
				<th width="80px">序号</th>
                <th  width="80px">标题</th>
				<th width="100">活动图片</th>
				<th>简介</th>
				<th width="60px">排序</th>
				<th width="150px">操作</th>
			</tr>
		</thead>
        <tbody>
        <c:forEach items="${readList }" var="r" varStatus="l">
          <tr>
          <td><label><input type="checkbox" value="${r.readId}" class="ace"><span class="lbl"></span></label></td>
          <td>${l.count }</td>
          <td>${r.readTitle }</td>
          <td><img alt="" class="round" src="<%=basePath %>/${r.readImg }" style="width: 60px;height: 60px;" /></td>
          <td>
          	<div style="height: 90px;overflow: auto;">${r.readContent }</div>
          </td>
          <td>${r.readOrder }</td>
          <td class="td-manage"> 
            <a title="上传图片" onclick="edit('上传图片','<%=basePath %>userRead/toUploadImg','${r.readId}','${r.readTitle}','700','700')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-cubes bigger-120"></i></a> 
           <a title="编辑" onclick="member_edit('编辑','<%=basePath %>userRead/toUpdUserRead','${r.readId}','','510')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>      
           <a title="删除" href="javascript:;"  onclick="member_del(this,'${r.readId}')" class="btn btn-xs btn-danger" ><i class="fa fa-trash  bigger-120"></i></a>
          </td>
         </tr>
        </c:forEach>
        </tbody>
       </table>    
     </div>
 </div>
 </div>
</div>
</body>
</html>
<script>
$(function () {  
        $(".displayPart").displayPart();  
   });
 //面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('#add_page').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
}); 
$(function() {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});

 $(function() { 
	$("#article_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		stylewidth:'220',
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		set_scrollsidebar:'.Ads_style',
		table_menu:'.Ads_list'
	});
});
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
 $(".Ads_list").width($(window).width()-220);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".Ads_list").width($(window).width()-220);
});

/*文章-删除*/
function member_del(obj,readId){
	
	layer.confirm("确定要删除此活动吗?",function(index){
		var url = "<%=basePath%>userRead/deleteUserRead";
		 var params = {};
		params.readId = readId;
		$.post(url,params,function(i){
			if(i > 0){
				layer.msg('已删除!',{icon:1,time:1000});
				 location.reload();
			}else{
				layer.msg('删除失败!',{icon:1,time:1000});
			}
		});  
	})   
};	
function edit(title,url,readId,readTitle,w,h){
	
	url = url + "?readId=" + readId+"&readTitle="+readTitle;
	layer_show(title,url,w,h);
};
function member_edit(title,url,readId,w,h){
	location = url + "?readId=" + readId;
	
}
</script>

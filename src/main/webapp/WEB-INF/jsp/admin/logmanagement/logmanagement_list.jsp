<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/styles/common/behind/cssStyle.jsp" %>	
	<title>特色管理</title>
</head>
<body>
<body>
<div class="page-content clearfix">
     <!--日志列表-->
      <div>
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
			  <th width="80px">序号</th>
			  <th width="118px">操作人员</th>
			  <th width="150px">操作时间</th>
			  <th width="360px">操作类</th>
			  <th width="180px">操作方法</th>
			  <th width="120px">操作级别</th>
			  <th width="">操作路径</th>
			  <th width="150px">操作结果</th>
			</tr>
		</thead>
	<tbody>
		 <c:forEach items="${logAll }" var="log" varStatus="n">
			  <tr>
				<td>${n.count }</td>
				<td>${log.userName}</td>
				<td><fmt:formatDate value="${log.logTime}" pattern="yyyy-MM-dd hh:mm" />
				</td>
				<td>${log.logClass}</td>
				<td>${log.logMethod}</td>
				<td>${log.logLevel}</td>
				<td>${log.logPath}</td>
				<td>${log.logMsg}</td>
			   </tr>
			</c:forEach> 	
        </tbody>
        </table>
        </div>
     </div>
    
  </div>
	
</body>
</html>
<%@include file="/styles/common/behind/jsStyle.jsp" %>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[1,3,4,6,7]}// 制定列不参与排序
		] } );
	
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});


//初始化宽度、高度  
 $(".chart_style").height($(window).height()-215);
  $(".table_menu_list").height($(window).height()-215);
  $(".table_menu_list ").width($(window).width()-440);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	 $(".chart_style").height($(window).height()-215);
	 $(".table_menu_list").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-440);
	});	
	//图层隐藏限时参数		 
$(function() { 
	$("#category").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		stylewidth:'400',
		spacingw:30,//设置隐藏时的距离
	    spacingh:440,//设置显示时间距
	});
});
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form ,.brond_name').on('click', function(){
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
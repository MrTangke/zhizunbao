<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@include file="/styles/common/behind/cssStyle.jsp" %>
    <title></title>
  </head>
  <body>
  	<%@include file="/styles/common/behind/jsStyle.jsp" %>	
  	<script type="text/javascript">
	  	$(function(){
  		// 父页面跳转
  		window.parent.location.href = "<%=basePath%>${redirectUrl }";
	  	// 关闭
	  		closeLayer();
		});
	 	// 关闭窗口
		function closeLayer(){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
	        return true;
		}
	</script>
  </body>
</html>

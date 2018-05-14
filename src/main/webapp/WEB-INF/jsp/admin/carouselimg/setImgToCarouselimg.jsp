<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/styles/common/behind/cssStyle.jsp" %>
</head>
<body>
	<div style="margin-top: 200px" ></div>
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">  </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="${resources.resName }" placeholder="请输入修改的名称"  name="resName" class="col-xs-10 col-sm-5"></div>
	</div>
		
</body>
<%@ include file="/styles/common/behind/jsStyle.jsp" %>
</html>
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
	<form action="updateImgOrder" method="post">
	<div class="form-group">
       <div class="col-sm-9"><input type="hidden" id="form-field-1" value="${carouselImg.imgId }" readonly="readonly" name="imgId" class="col-xs-10 col-sm-5"></div>
	</div>
	
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 图片</label>
       <div class="col-sm-9">
       		<img width="200" height="150" alt="暂无图片" src="<%=basePath %>${carouselImg.imgSrc }">
       </div>
	</div>
	
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 所属保险 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="${carouselImg.insureName }" readonly="readonly" name="" class="col-xs-10 col-sm-5"></div>
	</div>
	
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 图片原始顺序 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="${carouselImg.imgOrder }" readonly="readonly" name="" class="col-xs-10 col-sm-5"></div>
	</div>
	
	<div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 请输入更改顺序 </label>
       <div class="col-sm-9"><input type="text" id="form-field-1" value="" placeholder="请输入更改顺序"  name="imgOrder" class="col-xs-10 col-sm-5"></div>
	</div>
	
	<!--按钮操作-->
   <div class="Button_operation">
				<button  class="btn btn-primary radius" type="submit"><i class="fa fa-save "></i> 保存并提交</button>
			</div>
	
	</form>
</body>
<%@ include file="/styles/common/behind/jsStyle.jsp" %>
</html>
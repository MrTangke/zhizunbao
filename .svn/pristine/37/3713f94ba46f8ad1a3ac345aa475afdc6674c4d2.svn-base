<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>导入Excel</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<!-- 公共资源CSS  -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/bootstrap/css/bootstrap.min.css" />
</head>
<body>
  <article class="page-container">
	<form style="width:650px" action="<%=basePath%>insure/importExcel" class="form form-horizontal" id="Form" method="post" enctype="multipart/form-data">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>上传Excel：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="file" name="excelFile" id="excelFile"/>
			</div>
		</div>
		<div>
			<button style="margin-left: 210px;" onclick="downLoad();" type="button" class="btn btn-info">请先下载模板</button>
		</div>
		 <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;上传&nbsp;&nbsp;" id="submitId" />
			</div>
		</div>
	</form>
  </article>
</body>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<!-- My97 -->
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/My97DatePicker/WdatePicker.js"></script>
<!-- 表单校验 -->
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript" src="<%=basePath %>styles/behind/hui/js/ajaxfileupload.js"></script>
<script type="text/javascript">
	/* 表单校验 */
$(function(){
	/* 截取上传文件后缀，只能是图片形式 */
	$("#Form").submit(function(){	
		var filePath = $("input[type='file']").val();
		if(filePath!=""&&filePath!=null){
			var extStart = filePath.lastIndexOf(".");
			var ext = filePath.substring(extStart,filePath.length).toUpperCase();
			 if(ext!=".xls" && ext!=".XLS" && ext!=".xlsx" && ext!=".XLSX"){
				layer.msg('必须是Excel！',{icon:1,time:1000});
				return false;
			} 
		}else{
			layer.msg('请选择Excel！',{icon:1,time:1000});
			return false;
		};
	})
});

	
	// 关闭窗口
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
        return true;
	} 
	
	//下载模板
	function downLoad(){
		location ="<%=basePath%>styles/保障范围.xlsx";
	}
	
</script>
</html>
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
<title>添加文章</title>
</head>

<body>
<div class="margin clearfix">
 <div class="article_style">
        <div class="add_content" id="form-article-add">
    <form id="myForm" action="<%=basePath %>userRead/addUserRead" method="post">
     <ul>
      <li class="clearfix Mandatory">
      <label class="label_name"><i>*</i>活动标题</label><span class="formControls col-10"><input erro="活动标题" name="readTitle" type="text" id="form-field-1" class="col-xs-10 col-sm-5 f_input"></span>
      </li>
     
      <li class="clearfix"><label class="label_name"><i>*</i>排序</label><span class="formControls col-10"><input erro="排序" type="text" name="readOrder" id="form-field-1" class="col-xs-10 col-sm-1 f_input"></span></li>
    
      <li class="clearfix"><label class="label_name"><i>*</i>活动内容</label>
      <span class="formControls col-10"><script id="editor" class="f_input" name="readContent" erro="文章内容" type="text/plain" style="width:100%;height:400px; margin-left:10px;"></script>
      </li>
     </ul>
    <div class="Button_operation">
				<button onclick="article_save_submit();" class="btn btn-primary radius" type="button">保存并提交</button>
				<button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
    
    </div>
 </div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=basePath %>styles/behind/Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="<%=basePath %>styles/behind/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script> 
<script type="text/javascript">
/**提交操作**/
function article_save_submit(){
	     var num=0;
		 var str="";
     $(".f_input").each(function(n){
          if($(this).val()=="")
          {
			   layer.alert(str+=""+$(this).attr("erro")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,	
          });
		    num++; 
		    return false;
          } 
          else{
        	  var url = "<%=basePath %>userRead/addUserRead";
      		$.post(url,$("form").serialize(),function(i){
      			if(i==1){
      				 layer.alert('添加成功！',{
      	               title: '提示框',				
      				icon:1,		
      				  });
      				 location.href="<%=basePath %>userRead/toReadList";
      				 
      			}else{
      				layer.alert('添加失败！',{
       	               title: '提示框',				
       				icon:1,		
       				  });
      			}
      		})
          }
		 });
          					
	}
$(function(){
	var ue = UE.getEditor('editor');
});
/*radio激发事件*/
function Enable(){ $('.date_Select').css('display','block');}
function closes(){$('.date_Select').css('display','none')}
/**日期选择**/
var start = {
    elem: '#start',
    format: 'YYYY/MM/DD',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY/MM/DD',
    min: laydate.now(),
    max: '2099-06-16 ',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
</script>

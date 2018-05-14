<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/styles/common/behind/cssStyle.jsp" %>	
	<title>特色管理</title>
</head>
<body>
<body>
 <div class="margin clearfix">
   <div class="border clearfix">
       <span class="l_f">
        <a title="添加特色" onclick="member_add('添加特色','<%=basePath %>insure/toAddFeature','700','600')" href="javascript:;" class="btn btn-warning"><i class="fa fa-plus"></i> 添加特色</a>
       </span>
     </div>
     <div class="compete_list">
       <table id="sample-table-1" class="table table-striped table-bordered table-hover">
		 <thead>
			<tr>
			  <th>序号</th>
			  <th>特色简介</th>
             </tr>
		    </thead>
             <tbody>
	             <c:forEach items="${featureList }" var="f" varStatus="n">
					  <tr>
						<td>${n.count }</td>
						<td>${f.featureContent}</td>
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
/*特色-新增*/
function member_add(title,url,w,h){
	/* url = url + "?insureId=" + insureId; */
	layer_show(title,url,w,h);
	
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
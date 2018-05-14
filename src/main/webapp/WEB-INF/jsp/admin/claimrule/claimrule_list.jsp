<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/styles/common/behind/cssStyle.jsp" %>	
	<title>理赔规则</title>
</head>
<body>
<body>
 <div class="margin clearfix">
   <div class="border clearfix">
       <span class="l_f">
        <a title="查看规则说明" onclick="detailed()" href="javascript:;" class="btn btn-warning"><i class="fa fa-plus"></i> 查看规则说明</a>
       </span>
     </div>
     <div class="compete_list">
       <table id="sample-table-1" class="table table-striped table-bordered table-hover">
		 <thead>
			<tr>
			  <th>序号</th>
			  <th>伤残等级</th>
              <th>理赔比例</th>
			  
             </tr>
		    </thead>
             <tbody>
	             <c:forEach items="${ClaimRulesList }" var="t" varStatus="n">
					  <tr>
						<td>${n.count }</td>
						<td class="hidden-480">${t.claimLv}</td>
						<td>${t.claimRatio }%</td>
					   </tr>
				  </c:forEach> 												
		      </tbody>
	        </table>
     </div>
     <div id="detailed_style" class="add_menber" style="display:none">
        <p><span style="color: #ff7f27; font-size: 20px; font-weight: 10px;">一、被保者因意外伤害导致身故<br></span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这种一般采用定值保险理赔方式，也就是说保险公司与投保者双方约定的保险价值作为保险金额，当被保者因意外伤害导致身故时，保险公司将按照保单约定的保险金额进行赔偿。<br>
<span style="color: #ff7f27; font-size: 20px; font-weight: 10px;">二、被保者因意外伤害导致残疾</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这种一般按照伤残标准中所列明的伤残给付比例进行赔偿，<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;">计算公式为：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理赔金额=基本保险金额*伤残给付比例</span>。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其中伤残标准将人身保险伤残程度划分为一至十级，最重为第一级，最轻为第十级，与伤残标准相对应的保险金给付比例分为十档，伤残程度第一级对应的保险金给付比例为 100%，伤残程度第十级对应的保险金给付比例为 10%，每级相差 10%。<br>
<span style="color: #ff7f27; font-size: 20px; font-weight: 10px;">三、被保者因意外伤害导致住院治疗</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正常情况下，住院治疗产生的费用同样是按照一定比例报销的，但是每家的保险比例都不同，以一年期综合意外险为例，<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;">计算公式为：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、如医疗费用已从社会基本医疗保险或其他商业医疗保险保障计划获得补偿或赔偿，则<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;">意外伤害医疗保险金=（医疗费用-医疗费用中已从社会基本医疗保险和其他商业医疗保险保障计划获得的补偿或赔偿）×80%；</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 如医疗费用未从社会基本医疗保险或其他商业医疗保险保障计划获得补偿或赔偿，则<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;">意外伤害医疗保险金=医疗费用×50%。</span></p>
   </div>
    
 </div>
</body>
<%@include file="/styles/common/behind/jsStyle.jsp" %>	
</html>
<script type="text/javascript">

 

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
function detailed(){
	layer.open({
    type: 1,
	title:'理赔规则说明',
	area: ['1000px','500px'],
	shadeClose: false,
	content: $('#detailed_style'),
	
	});
}

</script>
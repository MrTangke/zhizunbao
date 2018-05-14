<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 类库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="<%=basePath%>styles/behind/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>styles/behind/css/style.css"/>  
    <link href="<%=basePath%>styles/behind/assets/css/codemirror.css" rel="stylesheet">     
    <link rel="stylesheet" href="<%=basePath%>styles/behind/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath%>styles/behind/assets/css/font-awesome.min.css" />
    <link href="<%=basePath%>styles/behind/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>styles/behind/font/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath %>styles/bootstrap/css/bootstrap.css" />
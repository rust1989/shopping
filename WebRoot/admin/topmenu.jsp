<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'topmenu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="Css/top.css">
	<link rel="stylesheet" type="text/css" href="Css/main.css">

  </head>
  
  <body>
    <div class="topnav">
	<div class="sitenav">
		<div class="welcome">你好，<span class="username"></span><a href="" target="_blank" style="display:none">THINKCMS</a> </div>
		<div class="sitelink"> 
			<a href="" target="_blank">网站主页</a> | 
			<a href="" target="_parent">安全退出</a>
      
		</div>
	</div>
	<div class="leftnav" style="float:left;">
		<ul>
			<li class="navleft"></li>
			<li id='d1' style="margin-left:-1px"><A href="" target="mcMenuFrame" class="tabon">首页</A></li>
			<li id='d2'><A href="" target="mcMenuFrame" >系统管理</A></li>
			<li class="navright"></li>
		</ul>
	</div>
</div>
  </body>
</html>

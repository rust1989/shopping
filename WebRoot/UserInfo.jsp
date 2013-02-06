<%@ page language="java" import="java.util.*,com.rust.shopping.user.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  User u=(User)session.getAttribute("user");
  if(u==null){
    response.sendRedirect("index.jsp");
    return;
  }
  String username=u.getUsername();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <center>
  		欢迎您： <%=username %>
  		<br>
  		<a href="UserModify.jsp">修改我的信息</a>
  		<br>
  		<a href="ChangePassword.jsp">修改我的密码</a>
  		<br>
  		<a href="MyOrders.jsp">浏览以往订单</a>
  		<br/>
  		<a href="index.jsp">返回首页</a>
  	</center>
  </body>
</html>

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
  		��ӭ���� <%=username %>
  		<br>
  		<a href="UserModify.jsp">�޸��ҵ���Ϣ</a>
  		<br>
  		<a href="ChangePassword.jsp">�޸��ҵ�����</a>
  		<br>
  		<a href="MyOrders.jsp">�����������</a>
  		<br/>
  		<a href="index.jsp">������ҳ</a>
  	</center>
  </body>
</html>

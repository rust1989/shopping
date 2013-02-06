<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="Css/base.css">
	

  </head>
  <frameset rows="76,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="admin/topmenu.jsp" name="mcTopFrame" id="mcTopFrame" frameborder="no" scrolling="No" noresize="noresize" />
  <frameset  cols="176,*" name="mcBodyFrame" id="mcBodyFrame" frameborder="no" border="0" framespacing="0">
         <frame src="admin/menu.jsp" name="mcMenuFrame" id="mcMenuFrame" frameborder="no" scrolling="No"  noresize="noresize"  />
  <frame src="admin/main.jsp" name="mcMainFrame" id="mcMainFrame" frameborder="no" scrolling="auto"  noresize="noresize"  />
  </frameset><noframes></noframes>
  <noframes>
  <body>
  </body>
</html>

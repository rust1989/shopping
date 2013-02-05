<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
  request.setCharacterEncoding("utf8");
  String action=request.getParameter("action");
  
  if(action!=null&action.equals("login")){
    String user=request.getParameter("user").trim();
    String pass=request.getParameter("pass").trim();
    
    if(!user.equals("admin")||!pass.equals("admin")){
      out.println("username or password not correct!");
       return;
    }
     session.setAttribute("admin","admin");
     response.sendRedirect("admin/AdminIndex.jsp");
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="Css/base.css">
  </head>
  
  <body>
  <div id="login">
   <form action="AdminLogin.jsp" method="post">
    <table>
      <tr height="40">
        <td> <label>用户名:</label></td>
        <td><input type="text" name="user" /></td>
      </tr>
     <tr height="40">
        <td><label>密&nbsp;码：</label></td>
        <td><input type="password" name="pass"/></td>
      </tr>
      <tr height="40">
        <td><input type="hidden" name="action" value="login"/> </td>
        <td><input type="submit" name="submit" value="提交" /></td>
      </tr>
    </table>
   </form>
  </div> 
  </body>
</html>

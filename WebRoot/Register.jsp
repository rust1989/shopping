<%@ page language="java" import="java.util.*,com.rust.shopping.util.*,java.sql.*" pageEncoding="GB18030"%>
<%@page import="com.rust.shopping.user.*"%>
<%@page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  String action=request.getParameter("action");
  if(action!=null&&action.equals("register")){
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String phone=request.getParameter("phone");
    String addr=request.getParameter("addr");
    
    User u=new User();
    u.setUsername(username);
    u.setPassword(password);
    u.setPhone(phone);
    u.setAddr(addr);
    u.setRdate(new Date());
    UserServer.save(u);
    out.println("register correct!");
    response.sendRedirect("index.jsp");
    return;
  }

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>register</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="Css/base.css">
	

  </head>
  
  <body>
  <div id="register">
     <form action="Register.jsp" method="post">
              <table>
               <tr>
                 <td>用户:</td>
                 <td><input type="text" name="username"/></td>
               </tr>
               <tr>
                 <td>密码:</td>
                 <td><input type="password" name="password"/></td>
               </tr>
                <tr>
                 <td>手机:</td>
                 <td><input type="text" name="phone"/></td>
               </tr>
                <tr>
                 <td>地址:</td>
                 <td><input type="text" name="addr"/></td>
               </tr>
               <tr>
                 <td><input type="hidden" name="action" value="register" /><a href="index.jsp"><input type="button" name="register" value="登录"/></a></td>
                 <td><input type="submit" name="submit" value="提交" /></td>
               </tr>
              </table>
           </form>  
  </div>         
  </body>
</html>

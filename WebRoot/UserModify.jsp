<%@ page language="java"
	import="java.util.*,com.rust.shopping.util.*,java.sql.*"
	pageEncoding="GB18030"%>
<%@page import="com.rust.shopping.user.*"%>
<%@page import="java.util.Date"%>
<%
	User us = (User) session.getAttribute("user");
	if (us == null) {
		response.sendRedirect("index.jsp");
		return;
	}

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String action = request.getParameter("action");
	if (action != null && action.trim().equals("modify")) {
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");

		us.setPhone(phone);
		us.setAddr(addr);
		UserServer.update(us);
		out.println("修改成功");
		response.sendRedirect("UserInfo.jsp");
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
			<form action="UserModify.jsp" method="post">
				<table>
					
					<tr>
						<td>
							手机:
						</td>
						<td>
							<input type="text" name="phone" value="<%=us.getPhone() %>" />
						</td>
					</tr>
					<tr>
						<td>
							地址:
						</td>
						<td>
							<input type="text" name="addr" value="<%=us.getAddr() %>" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="action" value="modify" />
						
						</td>
						<td>
							<input type="submit" name="submit" value="修改" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>

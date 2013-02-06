<%@ page language="java" import="java.util.*,com.rust.shopping.user.*"
	pageEncoding="GB18030"%>
<%
    User user=(User)session.getAttribute("user");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String action = request.getParameter("action");
	if (action != null && action.equals("login")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			User u = UserServer.check(username, password);
			if (u != null) {
				session.setAttribute("user", u);
				response.sendRedirect("UserInfo.jsp");
			}
		} catch (UserNotFindException e) {
			out.println(e.getMessage());
			return;
		} catch (PasswordNotCorrectException e) {
			out.println(e.getMessage());
			return;
		}

	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
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
		<div id="container">
			<header>
			</header>
			<div id="main">
				<aside id="nav" class="left">
				<div id="login">
				<% if(user!=null){ %>
					<table>
					  <tr>
					   <td>欢迎光临！<%=user.getUsername() %></td>
					   
					  </tr>
					  <tr>
					  <td><a href="UserInfo.jsp">个人中心</a></td>
					  </tr>
					</table>
				  <%}else{%>	
				  <form action="index.jsp" method="post">
						<table>
							<tr>
								<td>
									用户:
								</td>
								<td>
									<input type="text" name="username" />
								</td>
							</tr>
							<tr>
								<td>
									密码:
								</td>
								<td>
									<input type="text" name="password" />
								</td>
							</tr>
							<tr>
								<td>
									<input type="hidden" name="action" value="login" />
									<a href="Register.jsp"><input type="button" name="register"
											value="注册" /> </a>
								</td>
								<td algin="center">
									<input type="submit" name="submit" value="提交" />
								</td>
							</tr>
						</table>
					</form>
				  <% } %>
				</div>
				</aside>
				<div id="content" class="tlef">

				</div>
			</div>
		</div>
	</body>
</html>

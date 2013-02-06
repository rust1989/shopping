<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="Css/menu.css">
</head>	
<script language="javascript">
<!--
function $(objectId) 
{
	 return document.getElementById(objectId);
}

function showHide(objname)
{
    var obj = $(objname);
    if(obj.style.display == "none")
    {
        obj.style.display = "block";
    }
    else
    {
        obj.style.display = "none";
    }
    
    return false;
}

function refreshMainFrame(url)
{
    parent.mcMainFrame.location = url;
	
}
-->
</script>
<base target="mcMainFrame">
<body>
<div class="menu">
    <dl>
        <dt><a href="" onclick="return showHide('items0');" target="_self">系统管理</a></dt>
        <dd id="items0" style="display:block;">
            <ul>
				<li><a href=''>系统配置</a></li> 
            </ul>
        </dd>
    </dl>
<script type="text/javascript">refreshMainFrame('admin/main.jsp');</script>
</div>
</body>
</html>
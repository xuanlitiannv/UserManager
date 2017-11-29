<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>头部</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" tyle="text/css" href="css/bootstrap.min.css">
  </head>
  
  <body>
	  <div class="container-fluid" >
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#"style="padding:0px;"><img class="schoollogo" src="images/logo_school.png" style="height:50px;"></a>
	    </div>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="user/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
	      <li><a href="user/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	    </ul>
	  </div>
  </body>
</html>

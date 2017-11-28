<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>尾部</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" tyle="text/css" href="css/bootstrap.min.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <div class="col-lg-12 footer"style="background-color: #e5e8eb; padding: 3rem 0 3rem 0">
		 <div class="col-lg-12" style="text-align: center">地址：辽宁省 沈阳市沈阳航空航天大学</div>
		 <div class="col-lg-12" style="text-align: center;margin-top:3px;"><a href="#">版权所有：宋若仙&copy;辽ICP备15008579号-2</a></div>	
	</div>
  </body>
</html>

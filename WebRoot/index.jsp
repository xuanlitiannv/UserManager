<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-2.0.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </head>
  <body>
    <!-- 头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    
    <!-- 主体 -->
    <hr color="#e5e8eb" width="100%"style="margin-bottom:0px;"/>
	<div id="myCarousel" class="carousel slide">
	    <!-- 轮播（Carousel）指标 -->
	    <ol class="carousel-indicators">
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	        <li data-target="#myCarousel" data-slide-to="1"></li>
	        <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>   
	    <!-- 轮播（Carousel）项目 -->
	    <div class="carousel-inner">
	        <div class="item active">
	            <img src="images/1.jpg" style="width:100%;height:auto">
	        </div>
	        <div class="item">
	            <img src="images/2.jpg" style="width:100%;height:auto">
	        </div>
	        <div class="item">
	            <img src="images/3.jpg" style="width:100%;height:auto">
	        </div>
	    </div>
	    <!-- 轮播（Carousel）导航 -->
	    <a class="carousel-control left" href="#myCarousel" 
	        data-slide="prev">&lsaquo;
	    </a>
	    <a class="carousel-control right" href="#myCarousel" 
	        data-slide="next">&rsaquo;
	    </a>
	</div>
    
    <!-- 尾部 -->
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
 </html>
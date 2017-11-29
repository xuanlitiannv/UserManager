<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-2.0.1.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <!-- 头部信息 -->
    <jsp:include page="../header.jsp"></jsp:include>
    
    <!-- 主体部分 -->
    <hr color="#e5e8eb" width="100%" style="margin-bottom:10px"/>
    <div style="background-image:url(./images/4.png);background-repeat:no-repeat;background-size:cover;margin-top:-10px;">
	    <div class="container warp">
			<div class="row">
				<div class="col-md-4 col-md-offset-4" style="border:2px solid #e5e8eb;margin-top:15%;margin-bottom:15%;border-radius: 15px;">
					<form class="login" id="logForm" method="post" style="padding: 25px;">
	
						<div class="form-group">
							<label for="UserName">用户名</label> 
							<input type="text" class="form-control" id="UserName" name="UserName" placeholder="UserName">
						</div>
						<div class="form-group">
							<label for="Password">密码</label>
							<input type="password"class="form-control" id="Password" name="Password"placeholder="Password" maxlength="16">
						</div>
	
						<div class="row">
							<button type="submit" class="btn btn-default col-md-4 col-md-offset-4" id="submitBtn">登陆</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!--尾部部分  -->
	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript">
	   $(document).ready(function(){
	      $("#submitBtn").click(function(){
	          $("#logForm").validate({
	             rules:{
	                UserName:{required:true},
	                Password:{required:true}
	             },
	             messages:{
	                UserName:{required:"登录名不能为空<br/>",email:"请输入正确的电子邮箱<br/>"},
	                Password:{required:"密码不能为空"}
	             },
	             submitHandler:function(){
	                $.post(
	                   "user/login.do",
	                   {
	                      "email":$("#UserName").val(),
	                      "password":$("#Password").val()
	                   },
	                   function(reponse){
	                       if(reponse.tip=="success"){
	                            alert("登陆成功");
	                            location.href="user/listUser.jsp";
	                       }else{
	                           alert("登录失败");
	                       }
	                   }
	                
	                )
	             }
	          
	          })
	      })
	   })
	</script>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet"/>
    <link href="css/table/table.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-2.0.1.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/additional-methods.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style>
	     .error{
	         color:red;
	     }
	</style>
  </head>
  
  <body>
 
     <!-- 头部信息-->
      <%if(session.getAttribute("loguser")==null)//如果login.jsp页面获取的数据为空 
		{ response.sendRedirect("login.jsp");}  //跳转到login.jsp页面 %>
      <div class="container-fluid" >
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#"style="padding:0px;"><img class="schoollogo" src="images/logo_school.png" style="height:50px;"></a>
	    </div>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="user/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
	      <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span>${loguser.email}欢迎您！</a></li>
	      <!-- 退出后session数据清空，下次进入listUser.jsp界面需要重新登录 -->
	      <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span><%if(session.getAttribute("loguser") != null){ out.println("退出");}%></a></li>
	    </ul>
	  </div>
     <!-- 主体部分 -->
     <hr color="#e5e8eb" width="100%" style="margin-bottom:10px"/>
     <div  style="background-image:url(./images/4.png);background-repeat:no-repeat;background-size:cover;margin-top:-10px;">
	     <div class="container" style="padding-top:30px;height:100%;width:78%">
	         <div class="content-box">
	             <!-- 非隐藏的用户列表 -->
	             <div class="wrapper">
	                 <!-- 表头信息 -->
	                 <div class="widget">
			             <div class="navbar">
			                  <h4>用户列表</h4>
			             </div>
			             <!-- 查询信息 -->
			             <div class="well" style="height:12.5%">
		                       <form class="form-inline" role="form" id="query">
		                           <div class="form-group" style="margin-right:10px">
		                                <label for="Email">电子邮箱</label>
		                                <input type="text" class="form-control" id="Email" name="Email" placeholder="Email">
		                           </div>
		                           <div class="form-group" style="margin-right:10px">
		                                <label for="Phone">手机号码</label>
		                                <input type="text" class="form-control" id="Phone" name="Phone" placeholder="Phone" maxlength="11">
		                           </div>
		                           <div class="form-group" style="margin-right:10px">
		                                <label for="Phone">真实姓名</label>
		                                <input type="text" class="form-control" id="RealName" name="RealName" placeholder="RealName" maxlength="4" minlength="2">
		                           </div>
		                           <div class="form-group" style="margin-right:10px">
		                                <label for="Permission">权限</label>
		                                <select name="Permission" id="Permission" class="form-control">
													  <option value=""></option>
													  <option value="普通用户">普通用户</option>
													  <option value="管理员">管理员</option>
									    </select>
		                           </div>
		                           <!-- 切记使用button类型，如果想实现刷新功能，一般提交给服务器才是sumbit -->
		                           <div class="form-group">
		                                <button type="button" class="btn btn-info" id="selectBtn">查询</button>
		                           </div>
		                       </form>	             
		                 </div>
	                 </div>
	                 <!-- 添加信息 -->
	                 <ul class="toolbar">
					     <li><a href="javascript:void(0)" id="addUser"><i class="fa fa-user"></i><span>添加用户</span></a></li>
				     </ul>
	                 <!-- 数据表格信息 -->
	                 <table class="table table-striped table-bordered table-hover" id="UserTable" style="font-size:14">
	                     <thead>
	                         <tr>
	                             <th>#</th>
	                             <th>电子邮箱</th>
	                             <th>手机号码</th>
	                             <th>真实姓名</th>
	                             <th>性别</th>
	                             <th>权限</th>
	                             <th>操作</th>
	                         </tr>
	                     </thead>
	                     <!-- 这个显示数据内容 -->
	                     <tbody>					
						 </tbody>
	                        <tfoot>
								<tr>
									<td colspan="7">
										<div id="total" class="pull-left" style="padding-top:20px;padding-left:10px">&nbsp;</div>
										<div class="pull-right"><ul class="pagination" id="pagination"></ul></div>
									</td>
								</tr>
							</tfoot>
	                 </table>
	             </div>
	             <!-- 弹跳隐藏信息列表 -->
	             
	             <!--添加用户-->
				 <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
				            </div>
				            <form role="form" id="addform" method="post">
					            <div class="modal-body">
						                <div class="well">
												<div id="sucUpd" class="alert alert-success">
												    <button type="button" class="close" id="close" aria-hidden="true">&times;</button>
													<strong>添加成功！</strong>
												</div>
												<div id="failUpd" class="alert alert-warning">
												    <button type="button" class="close" id="close"   aria-hidden="true">&times;</button>
													<strong>添加失败！</strong>
												</div>					
												 
												<div class="alert alert-danger hide" id="tipError" style='color: white'>&nbsp;</div>
			                                        <div class="form-group" style="margin-right: 10px">
														<label>电子邮箱:</label>
														 <input type="text"class="form-control" name="Email" id="Email" placeholder="电子邮箱">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>手机号码:</label> 
														<input type="text"class="form-control" name="Phone" id="Phone" placeholder="手机号码">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>密码:</label> <input type="password"
															class="form-control" name="Password" id="Password" placeholder="密码">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>确认密码:</label> <input type="password"
															class="form-control" name="rePassword" id="rePassword" placeholder="确认密码">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>真实姓名:</label> 
														<input type="text"class="form-control" name="RealName" id="RealName" placeholder="真实姓名">
													</div>
													<div class="form-group" style="margin-right: 10px">
		                                                <label>性别：</label>
														<select name="Sex" id="Sex" class="form-control">
														    <option value=""></option>
														    <option value="男">男</option>
															<option value="女">女</option>
														</select>
		                                            </div>
													<div class="form-group" style="margin-right: 10px">
														<label>权限:</label> 
														<select name="Permission" id="Permission" class="form-control">
														    <option value=""></option>
														    <option value="普通用户">普通用户</option>
															<option value="管理员">管理员</option>								
														</select>
													</div>
													<div class="form-group">
		                                               <label>个人介绍：</label>
									                   <textarea class="form-control" rows="3" name="Introduce" maxlength="100">100字以内</textarea>
		                                            </div>
											        <div class="form-group">
		                                                <label>喜好新闻：</label>
													    <label class="checkbox-inline">
						                                   <input type="checkbox" id="inlineCheckbox1" name="News" value="娱乐"> 娱乐
						                                </label>
						                                <label class="checkbox-inline">
						                                   <input type="checkbox" id="inlineCheckbox2" name="News" value="政治"> 政治
						                                </label>
						                                <label class="checkbox-inline">
						                                   <input type="checkbox" id="inlineCheckbox3" name="News" value="体育"> 体育
						                                </label>	
		                                            </div>
										</div>
					            </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">取消</button>
									<button type="submit" class="btn btn-primary" id="addBtn">添加</button>
								</div>
						    </form>
				        </div><!-- /.modal-content -->
				    </div><!-- /.modal -->
				</div>
				<!-- /添加用户-->
				<!-- 修改用户 -->
				<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
				            </div>
				            <form role="form" id="updateform" method="post">
					            <div class="modal-body">
						                <div class="well">
												<div id="sucUpd" class="alert alert-success">
												    <button type="button" class="close" id="close" aria-hidden="true">&times;</button>
													<strong>修改成功！</strong>
												</div>
												<div id="failUpd" class="alert alert-warning">
												    <button type="button" class="close" id="close"   aria-hidden="true">&times;</button>
													<strong>修改失败！</strong>
												</div>					
												 
												<div class="alert alert-danger hide" id="tipError" style='color: white'>&nbsp;</div>
			                                        <div class="form-group" style="margin-right: 10px">
														<label>电子邮箱:</label>
														 <input type="text"class="form-control" name="Email" id="Email" placeholder="电子邮箱">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>手机号码:</label> 
														<input type="text"class="form-control" name="Phone" id="Phone" placeholder="手机号码">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>真实姓名:</label> 
														<input type="text"class="form-control" name="RealName" id="RealName" placeholder="真实姓名">
													</div>
													<div class="form-group" style="margin-right: 10px">
														<label>权限:</label> 
														<select name="Permission" id="Permission" class="form-control">
														    <option value=""></option>
														    <option value="普通用户">普通用户</option>
															<option value="管理员">管理员</option>								
														</select>
													</div>
													
										</div>
					            </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">取消</button>
									<button type="submit" class="btn btn-primary" id="addBtn">添加</button>
								</div>
						    </form>
				        </div><!-- /.modal-content -->
				    </div><!-- /.modal -->
				</div>
				<!-- 修改用户 -->
	         </div>
	     </div>
	 </div>
     <!-- 尾部部分 -->
     <jsp:include page="../footer.jsp"></jsp:include>
     
     <!-- 表的渲染 -->
     <script type="text/javascript" src="js/common.js"></script>
     <!-- 分页 -->	
     <script src="js/jqPaginator/jqPaginator.min.js"></script>
     <script type="text/javascript">
        //管理员才能添加用户
        $("a#addUser").click(function(){
       
            $(".error").remove();
            $("div#addModal #sucUpd").hide();
		    $("div#addModal #failUpd").hide();
		    //验证用户是否是管理员
		    var email='${loguser.email}'
            
            $.post(
               "user/getUserByEmail.do",
               {
                  "email":email
               },function(response){
                  user=response.user;
                  permission=user.permission;
                  if(permission=="管理员"){
                      $("#addModal").modal('show');
                      
                  }else{
                      alert("亲，您不是管理员,不能添加用户呦");
                  }
               }
            )
            //验证邮箱是否重复
            $("#addform #Email").blur(function(){
               $("#addform #Email").parent().find(".error").remove();
               $.post(
                   "user/isEmail.do",
                   {
                      "Email":$("#addform #Email").val()
                   },function(response){
                       if(response.valid=="false"){
                             $("#addform #Email").parent().append("<label class='error'>该电子邮箱已被注册</label>")
                            // $("#addform #Email").focus();
                       }
                       
                   }
                )
               
            })
               
            //设置表单验证
            $("#addform").validate({
                 onkeyup:false,
                 rules:{
                     Email:{required:true,email:true},
                     Phone:{required:true,isMobile:true},
                     Password:{required:true,rangelength:[6,16]},
                     rePassword:{equalTo:"#addform #Password"},
                     RealName:{required:true,rangelength:[2,4],isChinese:true},
                     Sex:{required:true},
                     Permission:{required:true},
                     Introduce:{maxlength:100},
                     News:{required:true}
                 },
                 messages:{
                     Email:{required:"邮箱地址不能为空<br/>",email:"请输入正确的邮箱地址<br/>"},
                     Phone:{required:"手机号码不能为空<br/>",isMobile:"手机号码格式不正确<br/>"},
                     Password:{required:"密码不能为空<br/>",rangelength:"密码长度在6~16位<br/>"},
                     rePassword:{equalTo:"两次密码输入不一致<br/>"},
                     RealName:{required:"真实姓名不能为空<br/>",rangelength:"真实姓名在2~4位",isChinese:"请输入汉字<br/>"},
                     Sex:{required:"性别不能为空<br/>"},
                     Permission:{required:"权限不能为空<br/>"},
                     Introduce:{maxlength:"个人介绍不能少于100字<br/>"},
                     News:{required:"新闻不能为空"}
                 },
                 submitHandler:function(){
                  if(!$("#addform").valid()){
                          $("div#addModal #sucUpd").hide();
                          $("div#addModal #failUpd").hide();
                     }else{
                         $.post(
                            "user/addUser.do",
                            {
                               "email":$("#addform #Email").val(),
                               "phone":$("#addform #Phone").val(),
                               "password":$("#addform #Password").val(),
                               "realname":$("#addform #RealName").val(),
                               "sex":$("#addform #Sex").val(),
                               "permission":$("#addform #Permission").val(),
                               "introduce":$("#addform #Introduce").val(),
                               "news":$("#addform #News").val()
                            },
                            function(response){
                                if(response.tip=="success"){
                                    $("div#addModal #sucUpd").show();
                                    $("div#addModal #failUpd").hide();
                                    $("#addform #Password").val("");
								    $("#addform #rePassword").val("");
								    
								    //添加完用户后点击取消自动刷新页面
								    $("#addform #cancel").click(function(){
								         listUser();
								    })
                                }else{
                                    $("div#addModal #sucUpd").hide();
                                    $("div#addModal #failUpd").show();
                                }
                            }
                         )
                     }
                 }
            })
         
        })
        //查询数据（最终表头为“email,phone,realname,sex,permission,id”）
        $(document).ready(function(){
            //显示全部用户信息
            listUser();
            //显示查询后的信息
            $("#selectBtn").click(function(){
                listUser();
            })
        
        })
            //显示信息的函数
            //自动生成简单查询结果列表
			/*
			 * 参数说明:
			 * tableId：显示表格数据的id值。
			 * colNum：表列数。(不包括序号列，和复选框列)
			 * attrlist：表头名对应单元格显示数据属性名列表。(顺序与数据在表中显示的顺序一致)。数据库的表头名
			 * page：结果数据列表或分页信息。
			 * pageUrl：分页跳转时，请求地址。
			 * param：分页参数信息。
			 * hasChk：是否有复选框。
			 * chkValue：复选框属性值对应属性名。
			 * hasNo:显示序号
			 * hasPage:是否分页
			 * hasOper：是否有操作列。
			 * operRow：操作列信息。
			 * operValue：操作列属性名。
			 * emptyTip：结果为空时的页面提示信息。(可选)
			 */ 
          function listUser(){
                //注意要找不同表格下的id,name值可能是相同的则执行混乱导致不能执行
                var email=$("form#query #Email").val();
                var phone=$("form#query #Phone").val();
                var realname=$("form#query #RealName").val();
                var permission=$("form#query #Permission").val();
                $.post(
                     "user/listUser.do",
                     {
                        "email":email,
                        "phone":phone,
                        "realname":realname,
                        "permission":permission
                     },
                     function(response){
                     
                         //调用common.js中的function initDataTable生成结果列表
                         initDataTable("UserTable",6,new Array("email","phone","realname","sex","permission"),response.page,"user/listUser.do",
                            {
                                "email":email,
                                "phone":phone,
                                "realname":realname,
                                "permission":permission
                            },false,'',true,true,true,
                            "<a href='javascript:void(0)' id='update' title='修改' style='padding-right:20px' onclick='updateUser(this)'><i class='fa fa-edit'></i></a>"+
					        "<a href='javascript:void(0)' title='删除' id='del' style='padding-right:20px' onclick='delUser(this)'><i class='fa fa-trash'></i></a>",
					        "id"
                         );
                         //alert('1');
                        
                     }
                )
            }
           //修改数据
           /*
			 *表格<tbody></tobdy>中的结构为
			     <tbody>
			         <tr>
			            <td>i+1</td>
			            <td>{{email}}</td>
			            <td>{{phone}}</td>
			            <td>{{realname}}</td>
			            <td>{{sex}}</td>
			            <td>{{permission}}</td>
			            <td id='"+element[operValue]+"'><a href='javascript:void(0)' id='update'><a href='javascript:void(0)' title='删除'>{{id}}</td>
			         <tr>
			     </tbody>
			 */ 
			 //验证用户是否是管理员
            
            function updateUser(obj){
              //首先获取user对象,给修改模态框附初值（每个对象数据库中的数据）
               var id = $(obj).parent("td").attr("id");
               //alert(id);
               var email;
               $.post(
                  "user/getUserById.do",
                  {
                     "id":id
                  },function(response){
                      user=response.user;
                      $("#updateform #Email").val(user.email);
                      $("#updateform #Phone").val(user.phone);
                      $("#updateform #RealName").val(user.realname);
                      $("#updateform #Permission").val(user.permission);
                      email=user.email;
                  }
               )
               $(".error").remove();
               $("div#updateModal #sucUpd").hide();
		       $("div#updateModal #failUpd").hide();
		       //验证用户是否是管理员
			    var email='${loguser.email}'
	            $.post(
	               "user/getUserByEmail.do",
	               {
	                  "email":email
	               },function(response){
	                  user=response.user;
	                  permission=user.permission;
	                  if(permission=="管理员"){
	                     $("#updateModal").modal('show');
	                      
	                  }else{
	                      alert("亲，您不是管理员,不能更改用户呦");
	                  }
	               }
	            ) 
		      //验证邮箱是否重复
		      $("#updateform #Email").blur(function(){
		           $("#updateform #Email").parent().find(".error").remove();
		           if($("#updateform #Email").val()!=email){
		               $.post(
		                   "user/isEmail.do",
		                   {
		                     "Email":$("#updateform #Email").val()
		                   },function(response){
		                       if(response.valid=="false"){
		                          $("#updateform #Email").parent().append("<label class='error'>该电子邮箱已被注册</label>");
		                       }
		                   }
		               )
		           }
		      })
		      //表单验证
		      $("#updateform").validate({
		        onkeyup:false,
                 rules:{
                     Email:{required:true,email:true},
                     Phone:{required:true,isMobile:true},
                     RealName:{required:true,rangelength:[2,4],isChinese:true},
                     Permission:{required:true} 
                 },
                 messages:{
                     Email:{required:"邮箱地址不能为空<br/>",email:"请输入正确的邮箱地址<br/>"},
                     Phone:{required:"手机号码不能为空<br/>",isMobile:"手机号码格式不正确<br/>"},
                     RealName:{required:"真实姓名不能为空<br/>",rangelength:"真实姓名在2~4位",isChinese:"请输入汉字<br/>"},
                     Permission:{required:"权限不能为空<br/>"},
                 },
                 submitHandler:function(){
                  if(!$("#updateform").valid()){
                          $("div#updateModal #sucUpd").hide();
                          $("div#updateModal #failUpd").hide();
                     }else{
                         $.post(
                            "user/modifyUser.do",
                            {
                               "id":id,
                               "email":$("#updateform #Email").val(),
                               "phone":$("#updateform #Phone").val(),  
                               "realname":$("#updateform #RealName").val(),
                               "permission":$("#updateform #Permission").val()
                            },
                            function(response){
                                if(response.tip=="success"){
                                    $("div#updateModal #sucUpd").show();
                                    $("div#updateModal #failUpd").hide();
								    //添加完用户后点击取消自动刷新页面
								    $("#updateform #cancel").click(function(){
								         listUser();
								    })
                                }else{
                                    $("div#updateModal #sucUpd").hide();
                                    $("div#updateModal #failUpd").show();
                                }
                            }
                         )
                     }
                 }
		         
		      })
            }
            //删除用户
            function delUser(obj){
                if(confirm("亲，你真的要删掉这个用户嘛！！！")){
                   var id=$(obj).parent("td").attr("id");
                   //验证用户是否是管理员
				    var email='${loguser.email}'
		            
		            $.post(
		               "user/getUserByEmail.do",
		               {
		                  "email":email
		               },function(response){
		                  user=response.user;
		                  permission=user.permission;
		                  if(permission=="管理员"){
		                    $.post(
                             "user/delUser.do",
		                     {
		                        "id":id
		                     },function(response){
		                         if(response.tip=="success"){
		                            alert("用户删除成功");
		                            listUser();
		                         }else{
		                            alert("用户删除失败");
		                         }
		                     }
                            )   
		                  }else{
		                      alert("亲，您不是管理员,不能删除用户呦");
		                  }
		               }
		            )
                   
                }
            }
     </script>
        
  </body>
</html>

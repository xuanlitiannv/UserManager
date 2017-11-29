<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" tyle="text/css" href="css/bootstrap.min.css">
	<script src="js/jquery-2.0.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <style>
     .container{
         backgroud-color:rgb(0,0,0,0.3);
     }
  </style>
  <body>
     <!-- 头部信息 -->
     <jsp:include page="../header.jsp"></jsp:include>
     
     <!-- 主体部分 -->
     <hr color="#e5e8eb" width="100%" style="margin-bottom:10px"/>
     <div style="background-image:url(./images/4.png);background-repeat:no-repeat;background-size:cover;margin-top:-10px">
		 <div class="container">
		       <div class="row">
		            <div class="col-md-5 col-md-offset-4" style="border:2px solid #e5e8eb;margin-bottom:10px;">
		                <form class="form-horizontal" id="regForm" method="post">
		                    <div class="row">
		                        <div class="col-md-5 col-md-offset-4">
		                             <h3 style="color:white;margin:0">注册信息</h3>
		                        </div>
		                    </div>
		                    <div class="form-group" style="padding-top:25px">
		                          <label for="Email" class="col-md-3 control-label">电子邮箱：</label>
		                          <div class="col-sm-9">
		                              <input type="text" class="form-control" id="Email" name="Email" placeholder="Email">
		                          </div>
		                    </div>
		                    <div class="form-group">
		                          <label for="Phone" class="col-md-3 control-label">手机号码：</label>
		                          <div class="col-sm-9">
		                              <input type="text" class="form-control" id="Phone" name="Phone" placeholder="Phone" maxlength="11">
		                          </div>
		                    </div>
		                     <div class="form-group">
		                          <label for="Password" class="col-md-3 control-label">*密码：</label>
		                          <div class="col-sm-9">
		                              <input type="password" class="form-control" id="Password" name="Password" placeholder="Password（必填项）" maxlength="16">
		                          </div>
		                     </div>
		                     <div class="form-group">
		                          <label for="rePassword" class="col-md-3 control-label">*确认密码：</label>
		                          <div class="col-sm-9">
		                              <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="rePassword（必填项）" maxlength="16">
		                          </div>
		                     </div>
		                     <div class="form-group">
		                          <label for="Realname" class="col-md-3 control-label">*真实姓名：</label>
		                          <div class="col-sm-9">
		                              <input type="text" class="form-control" id="Realname" name="Realname" placeholder="RealName（必填项）"maxlength="4" minlength="2">
		                          </div>
		                     </div>
		                     <div class="form-group">
		                           <label for="Sex" class="col-md-3 control-label">性别：</label>
		                           <div class="col-sm-9">
									   <select name="Sex" id="Sex" class="form-control">
											  <option value=""></option>
											  <option value="男">男</option>
											  <option value="女">女</option>
									   </select>
								  </div>
		                     </div>
		                     <div class="form-group">
		                           <label for="Permission" class="col-md-3 control-label">权限：</label>
		                           <div class="col-sm-9">
									   <select name="Permission" id="Permission" class="form-control">
											  <option value=""></option>
											  <option value="普通用户">普通用户</option>
											  <option value="管理员">管理员</option>
									   </select>
								  </div>
		                     </div>
		                     <div class="form-group">
		                           <label for="Introduce" class="col-md-3 control-label">个人介绍：</label>
		                           <div class="col-sm-9">
									    <textarea class="form-control" rows="3" name="Introduce" maxlength="100">100字以内</textarea>
								  </div>
		                     </div>
		                     <div class="form-group">
		                           <label for="News" class="col-md-3 control-label">喜好新闻：</label>
		                           <div class="col-sm-9">
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
		                     <div class="form-group" style="padding-top:25px">
		                       <div class="col-md-12">
		                           <div class="col-md-6" >
		                                  <button type="submit" class="btn btn-info" style="float:right" id="submitBtn">注册</button>
		                           </div>
		                           <div class="col-md-6">
		                                 <button type="button" class="btn btn-info" id="resetBtn">重置</button>
		                           </div>
		                        </div>
		                    </div>
		                </form>
		            </div>
		       </div>
		   </div>
	   </div>
     <!-- 尾部部分 -->
     <jsp:include page="../footer.jsp"></jsp:include>
     <script type="text/javascript">
        $(document).ready(function(){
           /**
            * 下面是进行插件初始化
            * 只需传入相应的键值对
            * */
            $("#regForm").bootstrapValidator({
            
                 message: 'This value is not valid',
                 feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                     valid: 'glyphicon glyphicon-ok',
                     invalid: 'glyphicon glyphicon-remove',
                     validating: 'glyphicon glyphicon-refresh'
                 },
                 fields:{
                     Email: {
                         validators: {
                             notEmpty: {
                                 message: '邮箱地址不能为空'
                             },
                             emailAddress: {
                                 message: '邮箱地址格式有误'
                             },
                             threshold :6,
                             remote:{
                                url:'user/isEmail.do',
                                message:'邮箱已被注册',
                                delay:2000,
                                type:'POST'
                             }
                         }
                     },
                     Phone: {
                         message: '手机号码无效',
                         validators: {
                             notEmpty: {
                                 message: '手机号码不能为空'
                             },
                             regexp: {
                                 regexp:/^1(3|4|5|7|8)\d{9}$/,
                                 message: '请正确填写手机号'
                             }
                         }
                     },
                     Password: {
                         validators: {
                              notEmpty: {
                                  message: '密码不能为空'
                              },
                              stringLength: {
                                  min: 6,
                                  max: 16,
                                  message: '密码长度必须在6到16之间'
                              },
                              identical: {
                                  field: 'rePassword',
                                  message: '两次密码输入不一致'
                             }
                          }
                      },
                      rePassword: {
                          validators: {
                              notEmpty: {
                                 message: '确认密码不能为空'
                              },
                              identical: {
                                  field: 'Password',
                                  message: '两次密码输入不一致'
                              }
                          }
                      },
                      Realname:{
                    	  validators: {
                              notEmpty: {
                                 message: '真实姓名不能为空'
                              },
                              stringLength: {
                                  min: 2,
                                  max: 4,
                                  message: '姓名长度必须在2到4之间'
                              },
                              regexp: {
                                  regexp:/^[\u4e00-\u9fa5]+$/,
                                  message: '请输入中文'
                              }
                         }
                     },
                     Sex:{
                    	 validators: {
                             notEmpty: {
                                message: '性别不能为空'
                             }
                    	 }
                     },
                     Permission:{
                         validators: {
                             notEmpty: {
                                message: '权限不能为空'
                             }
                    	 } 
                     },
                     News:{
                    	 validators:{
                    		 choice: {
                                 min: 1,
                                 max: 3,
                                 message: '请选择1-3个你感兴趣的新闻'
                             }
                    	 }
                     }
                 }
            }).on('success.form.bv',function(e){
                    e.preventDefault();
                    var $form = $(e.target);
                    var bv = $form.data('bootstrapValidator');
                    
                    $.post('user/regist.do', $form.serialize(), function(reponse) {
                            if(reponse.tip=="success"){
                                alert("添加成功");
                                location.href="index.jsp";
                            }else{
                                alert("1");
                            }
                    });
            })
            
            $("#resetBtn").click(function() {
                $('#regForm').data('bootstrapValidator').resetForm(true);
            });
        })
     </script>
  </body>
</html>

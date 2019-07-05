<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String root=request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title>Bootstrap响应式登录界面模板</title>
<script type="text/javascript" src="<%=root %>/js/jquery-1.9.0.min.js"></script>
<script src="<%=root %>/js/updatePassword.js"  type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=root %>/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=root %>/css/updatePassword.css" />

<style type="text/css">

</style>

</head>

<body>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>修改密码</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="/myssm/user/updatePassword.do" method="post">
				<div id="remind" class="remind" align="center" >提示消息</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="password" id="pass" name="password" class="form-control" placeholder="原密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="newpass" name="newpass" class="form-control" placeholder="新密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="repass" name="repass" class="form-control" placeholder="确认密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button type="submit" id="update" class="btn btn-sm btn-info">
						<span class="glyphicon glyphicon-off"></span> 修改密码</button>
					</div>
				</div>
				
<!-- 				<div class="form-group"> -->
<!-- 					<div class="col-xs-6 link"> -->
<!-- 						<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-6 link"> -->
<!-- 						<p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" ><small>注册</small></a> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</form>
			</div>
		</div>
	</div>
</div>

<!-- <div style="text-align:center;"> -->
<!-- <p>来源：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p> -->
<!-- </div> -->

</body>
</html>
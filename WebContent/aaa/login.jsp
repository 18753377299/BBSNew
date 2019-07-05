<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link rel="stylesheet" type="text/css" href="../aaa/Css/styles.css">
</head>
<body>
<div class="wrapper">
	<div class="container">
		<h1>风险论坛后台管理</h1>
		<form class="form" action="/myssm/user/adminLogin.do" method="post">
			<div id="remind" class="remind"><font color="red">${msg}</font></div><br/>
			<input type="text" value="${user.username}" placeholder="username" name = "username">
			<input type="password" value="${user.password}"  placeholder="password" name = "password"><br>
			<button type="submit" id="login-button"><strong>登陆</strong></button>
		</form>
	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
	</ul>
</div>
</body>
</html>
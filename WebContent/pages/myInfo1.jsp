<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setAttribute("domain", "http://localhost:8080/myssm");
    	String root=request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link href="<%=root %>/css/myInfo.css" rel="stylesheet" type="text/css"/>
<title>CSS学生档案表单样式代码 - 源码之家</title>
<style>
	
</style>
</head>
<body>
<form action="${domain}/pages/updateInfo.jsp">
	<fieldset>
		<legend>我的信息</legend>
		<label for="">
			头像:<img src="${user.image}" style="width:60px;height:80px;"/>
<!-- 			<input type="text" required autofocus placeholder="请输入姓名"> -->
		</label>
		<label for="">
			用户名: ${user.username}
<!-- 			<input type="text" required autofocus placeholder="请输入姓名"> -->
		</label>
		<label for="">
			性别: ${user.sex}
<!-- 			<input type="tel" pattern="1\d{10}" placeholder="请输入手机号码"> -->
		</label>
		<label for="">
			年龄: ${user.age}
<!-- 			<input type="tel" pattern="1\d{10}" placeholder="请输入手机号码"> -->
		</label>
		<label for="">
			邮箱: ${user.email}
<!-- 			<input type="email" placeholder="请输入邮箱地址"> -->
		</label>
<!-- 		<label for=""> -->
<!-- 			所属学院: <input type="text" list="course" placeholder="前端与移动开发学院"> -->
<!-- 			<datalist id="course"> -->
<!-- 				<option value="前端与移动开发"></option> -->
<!-- 				<option value="PHP"></option> -->
<!-- 				<option value="JAVA"></option> -->
<!-- 				<option value="Android"></option> -->
<!-- 				<option value="IOS"></option> -->
<!-- 				<option value="UI设计"></option> -->
<!-- 				<option value="C++"></option> -->
<!-- 			</datalist> -->
<!-- 		</label> -->
<!-- 		<label for=""> -->
<!-- 			入学成绩: <input type="number" max="100" id="score" step="10" value="80"> -->
<!-- 		</label> -->
<!-- 		<label for=""> -->
<!-- 			基础水平: <meter min="0" max="100" low="60" high="80" value="80" id="level"></meter> -->
<!-- 		</label> -->
<!-- 		<label for=""> -->
<!-- 			入学日期: <input type="date" value="2016-01-01"> -->
<!-- 		</label> -->
<!-- 		<label for=""> -->
<!-- 			毕业时间: <input type="date" value="2016-05-01"> -->
<!-- 		</label> -->
<!-- 		<label for=""> -->
<!-- 			课程进度: <progress min="0" max="100" value="10"></progress> -->
<!-- 		</label> -->
		<label for="" class="btn">
			<input type="submit" value="编辑">
		</label>
	</fieldset>
</form>
<script>
	var score = document.getElementById('score');
	var level = document.getElementById('level');

	score.oninput = function () {
		level.value = this.value;
	}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String root=request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=root%>/lib/html5.js"></script>
<script type="text/javascript" src="<%=root%>/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=root%>/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="<%=root%>/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=root%>/static/h-ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=root%>/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="<%=root%>/lib/bootstrapSwitch/bootstrapSwitch.css" rel="stylesheet" type="text/css" />
<link href="<%=root%>/lib/font-awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]>
<link href="lib/font-awesome/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<link href="<%=root%>/lib/iconfont/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="<%=root%>/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>Hi，H-ui</title>
<meta name="keywords" content="关键词,5个左右,单个8汉字以内">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">
</head>
<body>
<!-- <header class="header"> -->
<!-- 	<nav class="mainnav Hui-wraper"> -->
<!-- 		<ul class="cl"> -->
<!-- 			<li class="current"><a href="#">首页</a></li> -->
<!-- 			<li><a href="#">核心</a></li> -->
<!-- 			<li><a href="#">扩展</a></li> -->
<!-- 			<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">一级导航 <i class="iconfont">&#xf02a9;</i></a> -->
<!-- 				<ul class="dropDown-menu radius box-shadow"> -->
<!-- 					<li><a href="#">二级导航</a></li> -->
<!-- 					<li><a href="#">二级导航</a></li> -->
<!-- 					<li><a href="#">二级导航</a></li> -->
<!-- 				</ul> -->
<!-- 			</li> -->
<!-- 			<li><a href="#">联系我们</a></li> -->
<!-- 		</ul> -->
<!-- 	</nav> -->
<!-- </header> -->
<section class="Hui-container" >
<!-- 	<nav class="breadcrumb"> -->
<!-- 	<i class="iconfont">&#xf012b;</i>  -->
<!-- 	<a href="/" class="c-primary">首页</a> -->
<!-- 	<span class="c-gray en">&gt;</span> -->
<!-- 	<a href="#">组件</a><span class="c-gray en">&gt;</span> -->
<!-- 	<span class="c-gray">当前页面</span></nav> -->
	<div class="Hui-wraper">
<!-- 		<h1>Hi,H-ui!</h1> -->
<!-- 		<p>开始前端之旅！</p> -->
<!-- 		<h2>表单</h2> -->
		<div class="line"></div>
		<form action="/myssm/user/editMyInfo.do" method="post" enctype="multipart/form-data" class="form form-horizontal responsive" id="demoform">
			
			<div class="row cl">
				<label class="form-label col-2">用户名：</label>
				<div class="formControls col-3">
					<input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="username" id="username" value="${user.username}" datatype="*4-16" nullmsg="用户名不能为空">
				</div>
				<div class="col-7"> </div>
			</div>
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">账户：</label> -->
<!-- 				<div class="formControls col-5"> -->
<!-- 					<input type="text" class="input-text" autocomplete="off" placeholder="手机/邮箱" name="username" id="username" datatype="m|e" nullmsg="账户不能为空"> -->
<!-- 				</div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">密码：</label> -->
<!-- 				<div class="formControls col-5"> -->
<!-- 					<input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password" id="password" datatype="*6-18" nullmsg="请输入密码！" > -->
<!-- 				</div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">密码验证：</label> -->
<!-- 				<div class="formControls col-5"> -->
<!-- 					<input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password2" id="password2" recheck="password" datatype="*6-18" nullmsg="请再输入一次密码！" errormsg="您两次输入的密码不一致！" > -->
<!-- 				</div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
			<div class="row cl">
				<label class="form-label col-2">性别：</label>
				<div class="formControls skin-minimal col-5">
					<div class="radio-box">
						<input type="radio" id="sex-1" name="sex" value="男" datatype="*" nullmsg="请选择性别！">
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" name="sex" value="女">
						<label for="sex-2">女</label>
					</div>
<!-- 					<div class="radio-box"> -->
<!-- 						<input type="radio" id="sex-3" name="sex"> -->
<!-- 						<label for="sex-3">保密</label> -->
<!-- 					</div> -->
				</div>
				<div class="col-5"> </div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">年龄：</label>
				<div class="formControls col-3">
					<input type="text" class="input-text" placeholder="只能是数字" name="age" id="age" value="${user.age }" datatype="e" nullmsg="请输入年龄！">
				</div>
				<div class="col-7"> </div>
			</div>
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">爱好：</label> -->
<!-- 				<div class="formControls skin-minimal col-5"> -->
<!-- 					<div class="check-box"> -->
<!-- 						<input type="checkbox" id="checkbox-5" name="checkbox2" datatype="*" nullmsg="爱好不能为空！"> -->
<!-- 						<label for="checkbox-5">上网</label> -->
<!-- 					</div> -->
<!-- 					<div class="check-box"> -->
<!-- 						<input type="checkbox" id="checkbox-6" name="checkbox2"> -->
<!-- 						<label for="checkbox-6">摄影</label> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
			<div class="row cl">
				<label class="form-label col-2">当前头像：</label>
				<div class="formControls col-3"> 
				   <span class="btn-upload form-group">
					<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly  datatype="*" nullmsg="请添加附件！" style="width:175px">
					<a href="javascript:void();" class="btn btn-primary upload-btn">
					<i class="iconfont">&#xf0020;</i> 浏览文件</a>
					<input type="file" id="image" name="image"  multiple name="file-2" class="input-file">
					</span> 
				</div>
				<div class="col-7"> </div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-2">邮箱：</label>
				<div class="formControls col-3">
					<input type="text" class="input-text" placeholder="@" name="email" value="${user.email }" id="email" datatype="e" nullmsg="请输入邮箱！">
				</div>
				<div class="col-7"> </div>
			</div>
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">所在城市：</label> -->
<!-- 				<div class="formControls col-5"> <span class="select-box"> -->
<!-- 					<select class="select" size="1" name="demo1" datatype="*" nullmsg="请选择所在城市！"> -->
<!-- 						<option value="" selected>请选择城市</option> -->
<!-- 						<option value="1">北京</option> -->
<!-- 						<option value="2">上海</option> -->
<!-- 						<option value="3">广州</option> -->
<!-- 					</select> -->
<!-- 					</span> </div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">网址：</label> -->
<!-- 				<div class="formControls col-5"> -->
<!-- 					<input type="text" class="input-text" placeholder="http://" name="username" id="username" datatype="url" nullmsg="网址不能为空"> -->
<!-- 				</div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
<!-- 			<div class="row cl"> -->
<!-- 				<label class="form-label col-2">备注：</label> -->
<!-- 				<div class="formControls col-5"> -->
<!-- 					<textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-500" nullmsg="备注不能为空！" onKeyUp="textarealength(this,500)"></textarea> -->
<!-- 					<p class="textarea-numberbar"><em class="textarea-length">0</em>/500</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-5"> </div> -->
<!-- 			</div> -->
			
			<div class="row cl">
				<div class="col-10 col-offset-2">
					<input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
</section>
<!-- <footer class="footer"> -->
<!-- 	<p>Copyright &copy;2013-2015 H-ui.net All Rights Reserved.</p> -->
<!-- </footer> -->
<script type="text/javascript" src="<%=root%>/lib/jquery.min.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/layer1.8/layer.min.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/laypage/laypage.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/bootstrapSwitch/bootstrapSwitch.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/Validform_v5.3.2.js"></script> 
<script type="text/javascript" src="<%=root%>/lib/passwordStrength-min.js"></script> 
<script type="text/javascript" src="<%=root%>/static/h-ui/js/H-ui.js"></script> 
<script>
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$("#demoform").Validform({
		tiptype:2
	});
});
</script> 
<!--下方是百度统计代码，请在自己项目中干掉--> 
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>
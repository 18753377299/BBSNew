<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../aaa/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>后台管理系统</title>
    <link href="../aaa/styles/Common.css" rel="stylesheet" />
    <link href="../aaa/styles/Index.css" rel="stylesheet" />
</head>
<body>
    <div class="header">

        <img class="logo" src="../aaa/images/logo.png" />
        <label class="logo-title">风险后台管理系统</label>
        <ul class="inline">
            <li>
                <img src="../aaa/images/32/client.png" />&nbsp;&nbsp;欢迎您,${sessionScope.user.username}
            </li>
          
            <li>
                <img src="../aaa/images/32/200.png" />&nbsp;&nbsp;<a class="loginout" href="/myssm/user/adminQuit.do">退出</a>
            </li>

        </ul>


    </div>


    <div class="nav">

        <ul class="breadcrumb">
            <li>
                <img src="../aaa/images/32/5025_networking.png" />
            </li>
            <li><a href="#">首页</a> <span class="divider">>></span></li>
            <li class="active"></li>
        </ul>
    </div>



    <div class="container-fluid content">
        <div class="row-fluid">
            <div class="span2 content-left">
                <div class="accordion">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                <img class="left-icon" src="../aaa/images/32/5026_settings.png" /><span class="left-title">系统设置</span>
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse in">
                            <div class="accordion-inner" id = "divSection">
                                <img class="left-icon-child" src="../aaa/images/32/4962_sitemap.png" /><span class="left-body"> 版块管理</span>
                            </div>
                            <div class="accordion-inner" id = "divUser">
                                <img class="left-icon-child" src="../aaa/images/32/4992_user.png" /><span class="left-body"> 用户管理</span>
                            </div>
                            <div class="accordion-inner" id = "divPost">
                                <img class="left-icon-child" src="../aaa/images/32/4957_customers.png" /><span class="left-body"> 帖子管理</span>
                            </div>            
                        </div>
                    </div>
                </div>

            </div>

            <div class="span10 content-right">
                <iframe src="../aaa/Views/Index2.html" class="iframe" id = "iframe"></iframe>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="foot"></div>
    <script src="../aaa/scripts/jquery-1.9.1.min.js"></script>
    <script src="../aaa/bootstrap2.3.2/js/bootstrap.min.js"></script>
    <script src="../aaa/scripts/Index.js"></script>
	<div style="text-align:center;">
</div>

</body>
</html>

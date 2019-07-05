<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String root=request.getContextPath();
  request.setAttribute("domain", "http://localhost:8080/myssm/");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
</head>
<title>个人博客</title>
<meta name="keywords" content="个人博客" />
<meta name="description" content="" />
<link rel="stylesheet" href="<%=root %>/css/index.css"/>
<link rel="stylesheet" href="<%=root %>/css/style.css"/>
<!--     分页地址栏的配置 -->
<link rel="stylesheet" type="text/css" href="<%=root %>/css/pageGroup.css"/>
<script type="text/javascript" src="<%=root %>/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="<%=root %>/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="<%=root %>/js/pageGroup.js"></script>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
</head>

<body>
<!--header start-->
<div id="header">
<p style="float:right">
 <c:choose>
    <c:when test="${empty sessionScope.user}">
    <a href="${domain}pages/loginAndRegist.jsp">登录/注册</a>&nbsp;&nbsp;
    </c:when>
    <c:otherwise>
                欢迎  用户：${sessionScope.user.username}&nbsp;来论坛交流学习&nbsp;&nbsp;
      <a href="/myssm/user/quit.do">退出</a>&nbsp;&nbsp;
      <a href="${domain}pages/updatePassword1.jsp">修改密码</a>&nbsp;&nbsp;
      <a href="${domain}App/View/Home/index_index.jsp">发表帖子</a>
<%--       <a href="${domain}bbb.jsp">发表帖子2</a> --%>
    </c:otherwise>
  </c:choose>
  </p>
  <h1>BBS论坛</h1>
<!--   <p>欢迎来论坛交流学习</p> -->
  
</div>
<!--header end-->
<!--nav-->
<div id="nav">
  <ul>
    <li><a href="${domain}index.jsp">首页</a></li>
    <li><a href="about.html">看帖</a></li>
    <li><a href="shuo.html">精品</a></li>
    <li><a href="riji.html">置顶</a></li>
    <li><a href="xc.html">我的帖子</a></li>
    <li><a href="learn.html">帖子类型</a></li>
    <li><a href="${domain}App/View/Home/reply.jsp">回复帖子</a></li>
<!--     <li><a href="guestbook.html">留言板</a></li> -->
    <div class="clear"></div>
  </ul>
</div>
<!--nav end-->
<!--content start-->
<div id="content">
  <!--left-->
  <div class="left" id="c_left">
    <div class="s_tuijian">
      <h2>今日<span>话题</span></h2>
    </div>
    <div class="content_text">
      <!--wz-->
      <div class="wz">
        <h3><a href="#" title="浅谈：html5和html的区别">浅谈：html5和html的区别</a></h3>
        <dl>
          <dt>
           <img src="images/s.jpg" width="200"  height="123" alt=""></dt>
          <dd>
            <p class="dd_text_1">最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联
              网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对"XP系统"不提供更新补丁、维护的情况下。
              html5+css3也逐渐的成为新一代web前端技术.....</p>
            <p class="dd_text_2">
              <span class="left author">段亮</span><span class="left sj">时间:2014-8-9</span>
              <span class="left fl">分类:<a href="#" title="学无止境">学无止境</a></span><span class="left yd"><a href="#" title="阅读全文">阅读全文</a>
               </span>
            <div class="clear"></div>
            </p>
          </dd>
          <div class="clear"></div>
        </dl>
      </div>
      <!--wz end-->
      <!--wz-->
      <div class="wz">
        <h3><a href="#" title="浅谈：html5和html的区别">浅谈：html5和html的区别</a></h3>
        <dl>
          <dt><img src="images/s1.jpg" width="200" height="123" alt=""></dt>
          <dd>
            <p class="dd_text_1">最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联
              网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对"XP系统"不提供更新补丁、维护的情况下。
              html5+css3也逐渐的成为新一代web前端技术.....</p>
            <p class="dd_text_2">
              <span class="left author">段亮</span><span class="left sj">时间:2014-8-9</span>
              <span class="left fl">分类:<a href="#" title="学无止境">学无止境</a></span><span class="left yd"><a href="#" title="阅读全文">阅读全文</a>
               </span>
            <div class="clear"></div>
            </p>
          </dd>
          <div class="clear"></div>
        </dl>
      </div>
      <!--wz end-->
      <!--wz-->
      <div class="wz">
        <h3><a href="#" title="浅谈：html5和html的区别">浅谈：html5和html的区别</a></h3>
        <dl>
          <dt><img src="images/s2.jpg" width="200" height="123" alt=""></dt>
          <dd>
            <p class="dd_text_1">最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联
              网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对"XP系统"不提供更新补丁、维护的情况下。
              html5+css3也逐渐的成为新一代web前端技术.....</p>
            <p class="dd_text_2">
              <span class="left author">段亮</span><span class="left sj">时间:2014-8-9</span>
              <span class="left fl">分类:<a href="#" title="学无止境">学无止境</a></span><span class="left yd"><a href="#" title="阅读全文">阅读全文</a>
               </span>
            <div class="clear"></div>
            </p>
          </dd>
          <div class="clear"></div>
        </dl>
      </div>
      <!--wz end-->
      <!--wz-->
      <div class="wz">
        <h3><a href="#" title="浅谈：html5和html的区别">浅谈：html5和html的区别</a></h3>
        <dl>
          <dt><img src="images/s3.jpg" width="200" height="123" alt=""></dt>
          <dd>
            <p class="dd_text_1">最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联
              网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对"XP系统"不提供更新补丁、维护的情况下。
              html5+css3也逐渐的成为新一代web前端技术.....</p>
            <p class="dd_text_2">
              <span class="left author">段亮</span><span class="left sj">时间:2014-8-9</span>
              <span class="left fl">分类:<a href="#" title="学无止境">学无止境</a></span><span class="left yd"><a href="#" title="阅读全文">阅读全文</a>
               </span>
            <div class="clear"></div>
            </p>
          </dd>
          <div class="clear"></div>
        </dl>
      </div>
      <!--wz end-->
      <!--wz-->
      <div class="wz">
        <h3><a href="#" title="浅谈：html5和html的区别">浅谈：html5和html的区别</a></h3>
        <dl>
          <dt><img src="images/s3.jpg" width="200" height="123" alt=""></dt>
          <dd>
            <p class="dd_text_1">最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联
              网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对"XP系统"不提供更新补丁、维护的情况下。
              html5+css3也逐渐的成为新一代web前端技术.....</p>
            <p class="dd_text_2">
              <span class="left author">段亮</span><span class="left sj">时间:2014-8-9</span>
              <span class="left fl">分类:<a href="#" title="学无止境">学无止境</a></span><span class="left yd"><a href="#" title="阅读全文">阅读全文</a>
               </span>
            <div class="clear"></div>
            </p>
          </dd>
          <div class="clear"></div>
        </dl>
      </div>
      <!--wz end-->
      <!-------------------------------------------分页----------------------------------------------------------------->
<div id="pageGro" class="cb">
	<div class="pageUp">上一页</div>
    <div class="pageList">
        <ul>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
        </ul>
    </div>
    <div class="pageDown">下一页</div>
</div>


    </div>
  </div>
  <!--left end-->
  
  <!--right-->
  <div class="right" id="c_right">
    <div class="s_about">
      <h2>我在论坛<h2>
      <img src="images/my.jpg" width="230" height="230" alt="博主"/>
      <p>版主：<a href="/myssm/user/find.do">${user.username}</a></p>
      <p>职业：web前端、视觉设计</p>
      <p>简介：</p>
      <p>
<!--         <a href="#" title="联系博主"><span class="left b_1"></span></a> -->
<!--         <a href="#" title="加入QQ群，一起学习！"><span class="left b_2"></span></a> -->
      <div class="clear"></div>
      </p>
    </div>
    <!--栏目分类-->
    <div class="lanmubox">
      <div class="hd">
        <ul><li>精心推荐</li><li>最新文章</li><li class="hd_3">随机文章</li></ul>
      </div>
      <div class="bd">
        <ul>
          <li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
          <li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
          <li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
          <li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
          <li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
        </ul>
        <ul>
          <li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
          <li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
          <li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
          <li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
          <li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
        </ul>
        
        <ul>
          <li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
          <li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
          <li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
          <li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
          <li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
        </ul>


      </div>
    </div>
    <!--end-->
    <div class="link">
      <h2>友情链接</h2>
      <p><a href="http://www.duanliang920.com">段亮个人博客</a></p>
    </div>
  </div>
  <!--right end-->
  <div class="clear"></div>
</div>


<!--content end-->
<!--footer start-->
<div id="footer">
  <p>Design by:<a href="http://www.duanliang920.com" target="_blank">少年</a> 2014-8-9</p>
</div>
<!--footer end-->
<script type="text/javascript">jQuery(".lanmubox").slide({easing:"easeOutBounce",delayTime:400});</script>
<script  type="text/javascript" src="js/nav.js"></script>
</body>
</html>
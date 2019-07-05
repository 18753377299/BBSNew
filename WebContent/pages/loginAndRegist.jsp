<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 		String root=request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=root %>/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=root %>/images/login.js"></script>
<link href="<%=root %>/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 	<h1>简洁大气快速登录注册模板<sup>2015</sup></h1> -->

<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
				<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>
				<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 300px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
             <div class="login-box">
   
			<div class="login_form">
				<form action="/myssm/user/login.do" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
				 <input type="hidden" name="did" value="0"/>
                 <input type="hidden" name="to" value="log"/>
                 <div class="uniArea" id="loginCue">错误提示</div>
                 <div class="uinArea" id="uinArea">
                	<label class="input-tips" for="u">帐号：</label>
	                <div class="inputOuter" id="uArea">
	  
	                    <input type="text" id="u" name="username" class="inputstyle"/>
	               
	                </div>
                </div>
                
                <div class="pwdArea" id="pwdArea">
	               <label class="input-tips" for="p">密码：</label> 
	               <div class="inputOuter" id="pArea">
	                    
	                    <input type="password" id="p" name="password" class="inputstyle"/>
	                </div>
                </div>
                
                <div class="pwdArea" id="pwdArea">
	               <label class="input-tips" for="p">验证码：</label> 
	               <div class="inputOuter" id="pArea">
	                    
	                     <input type="text" id="verify" name="verifyCode" class="inputstyle" value="${user.verifyCode}" style="width:80pt"/>
	                     <img id="vCode" src="/myssm/verifyCode/get.do" border="1" onclick="javascript:_change()"/>
	                
	                </div>
                </div>
               
                <div style="padding-left:50px;margin-top:20px;">
                	<input type="submit" id="login" value="登 录" style="width:150px;" class="button_blue"/>
                </div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
    </div>

  <!--注册-->
    <div class="qlogin" id="qlogin" style="display: none; ">
   
    <div class="web_login">
    	<form name="form2" id="regUser" accept-charset="utf-8"  action="/myssm/user/regist.do" method="post">
	      	<input type="hidden" name="to" value="reg"/>
		    <input type="hidden" name="did" value="0"/>
        	<ul class="reg_form" id="reg-ul">
        		<div id="userCue" class="cue">快速注册请注意格式${img}</div>
                <li>
                	
                    <label for="user"  class="input-tips2">用户名：</label>
                    <div class="inputOuter2">
                     
                        <input type="text" id="user" name="username" maxlength="16" class="inputstyle2" value="${user.username}"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd" class="input-tips2">密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd"  name="password" maxlength="16" class="inputstyle2" value="${user.password }"/>
                    </div>
                    
                </li>
                
                <li>
                <label for="passwd2" class="input-tips2">确认密码：</label>
                    <div class="inputOuter2">
                        <input type="password" id="passwd2" name="repassword" maxlength="16" class="inputstyle2" value="${user.repassword}" />
                    </div>
                    
                </li>
                         
                            
                
                <li>
                 <label for="qq" class="input-tips2">邮箱：</label>
                    <div class="inputOuter2">
                       
                        <input type="text" id="qq" name="email" maxlength="20" class="inputstyle2" value="${user.email}"/>
                    </div>
                   
                </li>
                <li>
                 <label for="registVerify" class="input-tips2">验证码：</label>
                    <div class="inputOuter2">           
                          <input type="text" id="registVerify" name="verifyCode" class="inputstyle" value="${user.verifyCode}" style="width:80pt"/>
	                     <img id="vCode" src="/myssm/verifyCode/get.do" border="1" onclick="javascript:_change()"/>
	                
                    </div>     
                </li>
                
                <li>
                    <div class="inputArea">
                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/>
                         <a href="#" class="zcxy" target="_blank">注册协议</a>
                    </div>
                    
                </li>
                <div class="cl"></div>
            </ul>
         </form>
           
    
    </div>
   
    
    </div>
    <!--注册end-->
</div>

<!-- <div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div> -->
</body>
</html>
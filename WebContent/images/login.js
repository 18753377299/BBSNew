$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		});
		if(getParam("a")=='0')
		{
			$('#switch_login').trigger('click');
		}
	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  


var reMethod = "GET",
	pwdmin = 2;

$(document).ready(function() {
	
	$("#user").blur(function(){
		validateRegistUsername();
		
	});
	$("#u").blur(function(){
		validateUsername();
	});
	
    //登录校验
	$("#login").click(function(){
		//用户名不能为空
		if($("#u").val()==""){
			$("#u").focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
		 //校验用户名的长度
		if($("#u").val().length<1||$("#u").val().length>16){
			$('#u').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginCue').html("<font color='red'><b>×用户名位1-16字符</b></font>");
			return false;
		}
		//校验密码
		if($("#p").val()==""){
			$("#p").focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginCue').html("<font color='red'><b>×密码不能为空</b></font>");
			return false;
		}
		if ($('#p').val().length < pwdmin) {
			$('#p').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		}
		//验证码校验
		if($("#verify").val().length!=4){
			$("#verify").focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#loginCue').html("<font color='red'><b>验证码长度为四位</b></font>");
			return false;
		}
					
	});
	//注册校验
	$('#reg').click(function() {
		//用户名不能为空
		if ($('#user').val() == "") {
			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
	 

		if ($('#user').val().length < 1 || $('#user').val().length > 16) {

			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位1-16字符</b></font>");
			return false;

		}
//		$.ajax({
//			type: reMethod,
//			url: "/member/ajaxyz.php",
//			data: "uid=" + $("#user").val() + '&temp=' + new Date(),
//			dataType: 'html',
//			success: function(result) {
//
//				if (result.length > 2) {
//					$('#user').focus().css({
//						border: "1px solid red",
//						boxShadow: "0 0 2px red"
//					});
//					$("#userCue").html(result);
//					return false;
//				} else {
//					$('#user').css({
//						border: "1px solid #D7D7D7",
//						boxShadow: "none"
//					});
//				}
//
//			}
//		});
		
		


		if ($('#passwd').val().length < pwdmin) {
			$('#passwd').focus();
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		}
		if ($('#passwd2').val() != $('#passwd').val()) {
			$('#passwd2').focus();
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}

//		var sqq = /^[1-9]{1}[0-9]{4,9}$/;
		var sqq=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		//邮箱校验
		if (!sqq.test($('#qq').val())) {
//			if (!sqq.test($('#qq').val()) || $('#qq').val().length < 5 || $('#qq').val().length > 20) {
					
			$('#qq').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×邮箱格式不正确</b></font>");
			return false;
		} else {
			$('#qq').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}
		//验证码校验
		if($("#registVerify").val().length!=4){
			$("#registVerify").focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>验证码长度为四位</b></font>");
			return false;
		}
		

		$('#regUser').submit();
				
		
	});
	
	
	
});
//登录名校验方法
function validateUsername(){

	$.ajax({
		url:"/myssm/user/ajaxValidateUsername.do",
		data:"username="+$("#u").val(),
		type:"post",
		dataType:'json',
		async:false,
		cache:false,
		success:function(result){
			if(!result){
				$("#u").css({					
						border: "1px solid #D7D7D7",
						boxShadow: "none"
				});
				$("#loginCue").html("<font color='green'><b>用户名可以使用</b></font>");	
				return true;
			}else{
				$('#u').focus().css({
					border:"1px solid red",
					boxShadow:"0 0 2px red"						
				});
				$("#loginCue").html("<font color='red'><b>用户名不能使用</b></font>");	
				return false;
				
			}
		}
		
	});
}
//注册校验方法
function validateRegistUsername(){
	//是否注册校验
	$.ajax({
		url:"/myssm/user/ajaxValidateUsername.do",
		data:"username="+$("#user").val(),
		type:"post",
		dataType:'json',
		async:false,
		cache:false,
		success:function(result){
			if(!result){
				$("#user").focus().css({
					border:"1px solid red",
					boxShadow:"0 0 2px red"
				});
				$("#userCue").html("<font color='red'><b>用户名已经注册过！</b></font>");					
				return false;
			}else{
				$('#user').css({
					border: "1px solid #D7D7D7",
					boxShadow: "none"
				});
				$("#userCue").html("<font color='green'><b>用户名可以注册</b></font>");
				return true;
				
			}
		}
		
	});
}



function _change(){
	$("#vCode").attr("src","/myssm/verifyCode/get.do?a="+new Date().getTime());
}
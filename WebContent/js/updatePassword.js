$(function(){
	alert("bbbb");
	$("#update").click(function(){
		
		alert("aaa");
		
		if($("#pass").val()==""){
			$("#pass").focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#remind').html("<font color='red'><b>×密码不能为空</b></font>");
			return false;
		}
	});
	$("#pass").blur(function(){
		validatePassword();
	});
});

//登录名校验方法
function validatePassword(){
    Integer userId=${user.userId};
	$.ajax({
		url:"/myssm/user/ajaxValidatePassword.do",
		data:"password="+$("#pass").val()+"&userId="+userId,
		type:"post",
		dataType:'json',
		async:false,
		cache:false,
		success:function(result){
			if(!result){
				$("#pass").css({					
						border: "1px solid #D7D7D7",
						boxShadow: "none"
				});
				$("#remind").html("<font color='green'><b>用户名可以使用</b></font>");	
				return true;
			}else{
				$('#pass').focus().css({
					border:"1px solid red",
					boxShadow:"0 0 2px red"						
				});
				$("#remind").html("<font color='red'><b>用户名不能使用</b></font>");	
				return false;
				
			}
		}
		
	});
}
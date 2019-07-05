$(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
})
$("#divUser").click(function () {
    $("#iframe").attr("src","../aaa/Views/UserManager.html");
    $(".active").html($(this).find(".left-body").text());
})
$("#divSection").click(function () {
    $("#iframe").attr("src","../aaa/Views/Index2.html");
    $(".active").html($(this).find(".left-body").text());
})
$("#divPost").click(function () {
    $("#iframe").attr("src","../aaa/Views/PostManager.html");
    $(".active").html($(this).find(".left-body").text());
})

//$(".accordion-inner").click(function () {
//    $(".active").html($(this).find(".left-body").text());
//})

$(window).resize(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
})
//$("loginout")click(function(){
//	$.ajax({
//		type:"post",
//		url:"/myssm/user/quit.do",
//		dataType: "json",
//		success:function(data){
//			alert(data);
////			fgroupname = $("#sectionId").val();
////			jiSuanPage(fgroupname);
//		}
//	});
//})


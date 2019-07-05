$(function () {
	totalPages = 0; //总页数
	pageIndex = 1; //当前页面数
	allRecords = 0;//分组总记录数
	$("#sectionId").val(0);
	queryGroup();
	jiSuanPage();	

    $("#sectionId").change(function(){
		 $(".tabletd").empty();
		 pageIndex = 1;
		 jiSuanPage($("#sectionId").val());
	 });
})

function queryGroup(){
	$.ajax({
		type:"post",
		url:"/myssm/bbsSection/querySection.do",
		dataType: "json",
		success:function(sectionList){
			for(i in sectionList){
				$("#sectionId").append("<option value='"
						+sectionList[i].sectionId+"' >"+sectionList[i].sectionName+"-----版块"+sectionList[i].sectionId+"</option>");
			}
//			fgroupname = $("#sectionId").val();
//			jiSuanPage(fgroupname);
		}
	});
}
function load(pageIndex) {
    $.ajax({
        url: "/myssm/bbsYPost/queryPost.do",
        data:{"page":pageIndex,"rows":2,"sectionId":$("#sectionId").val()},
        timeout: 300000,
        dataType: "json",
        success: function (data) {
            var html = "";
            $.each(data, function (i, item) {
                html += " <tr class = 'tabletd'> " +
                        " <td>" + item.postId + "</td> " +
                        " <td>" + item.topic + "</td> " +
                        " <td>" + item.username + "</td> " +
                        " <td>" + item.sectionId + "</td> " +
                        " <td>" + item.topPost + "</td> " +
                        " <td>" + item.bestPost + "</td> " +
                        " <td>" + item.postTime + "</td> " +
                        " <td><a class=\"btn btn-info\" onclick='openedt(\"" + item.postId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + item.postId + "\");'>删除</a></td> " +
                        " </tr>";
            })
            $("#tbody").html(html);
        }
    })
}

//计算总页数
function jiSuanPage(){
	$.ajax({
		type:"post",
		url:"/myssm/bbsYPost/queryCountBySectionId.do",
		data:{"sectionId":$("#sectionId").val()},
		success:function(count){
			allRecords = count;
			if( 0 == allRecords % 2){
				totalPages = allRecords/2;
			}else{
				totalPages= parseInt(allRecords/2)+1;
			}
			$("#totalPages").html(totalPages);
			$("#pageIndex").html(pageIndex);
		},
		typedata:"json"
	});
    load(pageIndex);
}

$("#first").click(function () {
    first();
})

//首页
function first(){
	if(pageIndex != 1){
		$(".tabletd").empty();
	    pageIndex = 1;
	    load(pageIndex);
	    $("#pageIndex").html(pageIndex);
	}
};

$("#end").click(function () {
    end();
})
//尾页
function end(){
	if(pageIndex !=totalPages){
		$(".tabletd").empty();
	    pageIndex = totalPages;
	    load(pageIndex);
	    $("#pageIndex").html(pageIndex);
	}
};

$("#last").click(function () {
    last();
})

//上一页
function last(){
	if(pageIndex >=2){
		$(".tabletd").empty();
	    pageIndex = pageIndex-1;
	    load(pageIndex);
	    $("#pageIndex").html(pageIndex);
	}
};

$("#next").click(function () {
    next();
})

//下一页
function next(){
	if(pageIndex <totalPages){
		$(".tabletd").empty();
	    pageIndex = pageIndex+1;
	    load(pageIndex);
	    $("#pageIndex").html(pageIndex);
	}
};

function openedt(postId) {
    $.ajax({
        url: "/myssm/bbsYPost/queryByPostId.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: { "postId": postId },
        success: function (data) {
            $("#myModalLabel").text("修改帖子");
            $("#bestPost").val(data[0].bestPost);
            $("#bestPost").attr("readonly", false);
            $("#topPost").attr("readonly", false);
            $("#topPost").val(data[0].topPost);
            $("#userId").attr("readonly", true);
            $("#postId").val(postId);
            $("#edt").show();
            $("#add").hide();
            $("#addModal").modal("show");
        }
    })
}

function edt() {
    if ($("#bestPost").val() == "") {
        layer.tips('精品贴不能为空', '#bestPost');
        return;
    }
    if ($("#topPost").val() == "") {
        layer.tips('置顶帖不能为空', '#topPost');
        return;
    }
    var formdata = {
        flag: "edt",
        bestPost: $("#bestPost").val(),
        postId:$("#postId").val(),
        topPost:$("#topPost").val(),
    }
    $.ajax({
        url: "/myssm/bbsYPost/updatePost.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: formdata,
        success: function (data) {
        	if(data == true){
        		$("#addModal").modal("hide");
                layer.alert("修改成功");
                $("input").val("");
                $("#sectionId").val(0);
                load(pageIndex);
        	}else{
        		$("#addModal").modal("hide");
                layer.alert("修改失败，，请重新修改！！！");
                $("input").val("");
        	}
        }
    })
}


function del(postId) {
    //询问框
    layer.confirm('您确定要删除？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: "/myssm/bbsYPost/deletePost.do",
            timeout: 300000,
            dataType: "json",
            type: "post",
            data: { "flag": "del", "postId": postId },
            success: function (data) {
            	if(data == true){
            		layer.alert("删除成功");
            		jiSuanPage();
            		$("#sectionId").val(0);
            		pageIndex=1;
                    load(pageIndex);
            	}else{
            		layer.alert("删除失败，请重新删除！！！");
            	}
                
            }
        })
    });
}
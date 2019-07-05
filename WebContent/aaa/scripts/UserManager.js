$(function () {
	totalPages = 0; //总页数
	pageIndex = 1; //当前页面数
	allRecords = 0;//分组总记录数
	jiSuanPage();
    load(pageIndex);
})


function load(pageIndex) {
    $.ajax({
        url: "/myssm/bbsUser/queryUser.do",
        data:{"page":pageIndex,"rows":2},
        timeout: 300000,
        dataType: "json",
        success: function (data) {
            var html = "";
            $.each(data, function (i, item) {
                html += " <tr class = 'tabletd'> " +
                        " <td>" + item.userId + "</td> " +
                        " <td>" + item.username + "</td> " +
                        " <td>" + item.password + "</td> " +
                        " <td>" + item.sex + "</td> " +
                        " <td>" + item.age + "</td> " +
                        " <td>" + item.email + "</td> " +
                        " <td>" + item.permission + "</td> " +
                        " <td>" + item.registTime + "</td> " +
                        " <td><a class=\"btn btn-info\" onclick='openedt(\"" + item.userId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + item.userId + "\");'>删除</a></td> " +
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
		url:"/myssm/bbsUser/queryUserCount.do",
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

function openadd() {
	$("#myModalLabel").text("添加版块");
	$("#hideSectionId").hide();
    $("#SectionName").attr("readonly", false);
    $("input").val("");
    $("#addModal").modal("show");
    $("#add").show();
    $("#edt").hide();
}


function add() {
    if ($("#SectionName").val() == "") {
        layer.tips('版块名称不能为空', '#SectionName');
        return;
    }
    
    var formdata = {
        flag: "add",
        SectionName: $("#SectionName").val(),
    }
    $.ajax({
        url: "/myssm/bbsSection/addSection.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: formdata,
        success: function (data) {
        	if(data == true){
        		$("#addModal").modal("hide");
                layer.alert("添加成功");
                $("input").val("");
                load();
        	}else{
        		$("#addModal").modal("hide");
                layer.alert("添加失败，，请重新添加！！！");
                $("input").val("");
        	}
            
        }
    })
}


function openedt(userId) {
    $.ajax({
        url: "/myssm/bbsUser/queryByUserId.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: { "userId": userId },
        success: function (data) {
            $("#myModalLabel").text("修改用户");
            $("#password").val(data[0].password);
            $("#password").attr("readonly", false);
            $("#permission").attr("readonly", false);
            $("#permission").val(data[0].permission);
            $("#userId").attr("readonly", true);
            $("#userId").val(userId);
            $("#edt").show();
            $("#add").hide();
            $("#addModal").modal("show");
        }
    })
}

function edt() {
    if ($("#password").val() == "") {
        layer.tips('密码不能为空', '#password');
        return;
    }
    if ($("#permission").val() == "") {
        layer.tips('用户权限不能为空', '#permission');
        return;
    }
    var formdata = {
        flag: "edt",
        password: $("#password").val(),
        userId:$("#userId").val(),
        permission:$("#permission").val(),
    }
    $.ajax({
        url: "/myssm/bbsUser/updateUser.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: formdata,
        success: function (data) {
        	if(data == true){
        		$("#addModal").modal("hide");
                layer.alert("修改成功");
                $("input").val("");
                load(pageIndex);
        	}else{
        		$("#addModal").modal("hide");
                layer.alert("修改失败，，请重新修改！！！");
                $("input").val("");
        	}
        }
    })
}


function del(userId) {
    //询问框
    layer.confirm('您确定要删除？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: "/myssm/bbsUser/deleteUser.do",
            timeout: 300000,
            dataType: "json",
            type: "post",
            data: { "flag": "del", "userId": userId },
            success: function (data) {
            	if(data == true){
            		layer.alert("删除成功");
            		jiSuanPage();
            		pageIndex = 1;
                    load(pageIndex);
            	}else{
            		layer.alert("删除失败，请重新删除！！！");
            	}
                
            }
        })
    });
}
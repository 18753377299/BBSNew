$(function () {
    load();
})


function load() {
    $.ajax({
        url: "/myssm/bbsSection/querySection.do",
        timeout: 300000,
        dataType: "json",
        success: function (data) {
            var html = "";
            $.each(data, function (i, item) {
                html += " <tr> " +
                        " <td>" + item.sectionId + "</td> " +
                        " <td>" + item.sectionName + "</td> " +
                        " <td>" + item.count + "</td> " +
                        " <td><a class=\"btn btn-info\" onclick='openedt(\"" + item.sectionId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + item.sectionId + "\");'>删除</a></td> " +
                        " </tr>";
            })
            $("#tbody").html(html);
        }
    })
}

function openadd() {
	$("#myModalLabel").text("添加版块");
	$("#hideSectionId").hide();
    $("#SectionName").attr("readonly", false);
    $("input").val("");
    $("#addModal").modal("show");
    $("#add").show();
    $("#edt").hide();
}

function querySection(sectionName){
	 $.ajax({
	        url: "/myssm/bbsSection/queryBySectionName.do",
	        timeout: 300000,
	        dataType: "json",
	        type: "post",
	        data: { "sectionName": sectionName },
	        success: function (data) {
	        	if (data == false) {
	                layer.tips('该版块已存在', '#SectionName');
	                return;
	            }else{
	                addSection();
	            }
	        }
	    })
}

function add() {
    if ($("#SectionName").val() == "") {
        layer.tips('版块名称不能为空', '#SectionName');
        return;
    }
    querySection($("#SectionName").val());
}

function addSection(){
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

function openedt(sectionId) {
    $.ajax({
        url: "/myssm/bbsSection/queryBySectionId.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: { "sectionId": sectionId },
        success: function (data) {
            $("#myModalLabel").text("修改版块名称");
            $("#SectionName").val(data[0].sectionName);
            $("#SectionName").attr("readonly", false);
            $("#SectionId").attr("readonly", true);
            $("#SectionId").val(sectionId);
            $("#edt").show();
            $("#add").hide();
            $("#addModal").modal("show");
        }
    })
}

function edt() {
    if ($("#SectionName").val() == "") {
        layer.tips('版块名称不能为空', '#SectionName');
        return;
    }
    var formdata = {
        flag: "edt",
        sectionName: $("#SectionName").val(),
        sectionId:$("#SectionId").val(),
    }
    $.ajax({
        url: "/myssm/bbsSection/updateSection.do",
        timeout: 300000,
        dataType: "json",
        type: "post",
        data: formdata,
        success: function (data) {
        	if(data == true){
        		$("#addModal").modal("hide");
                layer.alert("修改成功");
                $("input").val("");
                load();
        	}else{
        		$("#addModal").modal("hide");
                layer.alert("修改失败，，请重新修改！！！");
                $("input").val("");
        	}
        }
    })
}


function del(sectionId) {
    //询问框
    layer.confirm('您确定要删除？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: "/myssm/bbsSection/deleteSection.do",
            timeout: 300000,
            dataType: "json",
            type: "post",
            data: { "flag": "del", "sectionId": sectionId },
            success: function (data) {
            	if(data == true){
            		layer.alert("删除成功");
                    load();
            	}else{
            		layer.alert("删除失败，请重新删除！！！");
            	}
                
            }
        })
    });
}
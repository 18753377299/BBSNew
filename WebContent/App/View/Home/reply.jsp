<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	String root=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NODEJS帖子回复</title>
    <script src="<%=root%>/js/jquery.min.js"></script>
  <script charset="utf-8" src="<%=root%>/www/resource/ueditor1_4_3/ueditor.config.js"></script>
  <script charset="utf-8" src="<%=root%>/www/resource/ueditor1_4_3/ueditor.all.js"> </script>
  <script charset="utf-8" src="<%=root%>/www/resource/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
 
    <style>
        body{font-size: 13px;background-color:	#F2F2F2;}
        textarea{width: 300px;height: 200px;resize: none;}
        input{width:80px;height:30px;border-radius:3px;}
        hr{width:1000px;font-weight:900;}
        span{font-family: Arial;}
        .mailcontent-title{font-size:20px;margin-left:-876px;font-weight:700;}
        .title{width: 380px;border: 1px solid #ddd;}
        .mailform{margin-top: 10px;align:center;}
        .H-info{color: red;visibility: hidden;}
        .st{margin-left:-920px;margin-top:-20px;}
    </style>
</head>
<body>
 <center>
    <form action="/myssm/bbsYPost/replyPost.do" method="post" id="J_mailForm" class="mailform">
<!--         <div class="mailcontent"> -->
<!--             <span class="mailcontent-title">帖子标题:</span> -->
<!--             <select id="sectionId" name="sectionId"> -->
<!--             	  <option value="0">==版块选择==</option>     -->
<!--             </select> -->
                   
<!--             <input type="text"   name="topic" value="" id="J_title" class="title"  maxlength="80"/>还可输入80个字符 -->
<!--         </div> -->
        <div class="mailcontent">
            <span class="mailcontent-title">回复帖子正文:</span>
            <hr>
            <textarea name="content" id="J_content"></textarea>
        </div>
        <br/><br/>
        <input type="submit" name="st" class="st" value="发表回复">
    </form> 
    <div id="J_info" class="H-info">回复中..</div>
    </center>
    <script>
    
        $(function(){

            var ue = UE.getEditor('J_content',{
                serverUrl:'/index/uploads',
                toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
             'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars',  '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'help', 'drafts'
        ]]
            });



            $("#J_mailForm").submit(function(){
                var data = {};
                data.title = $("#J_title").val();
                data.content = ue.getContent();

                if(data.content == ''){
                    alert('请填写完整内容!')
                    return false;
                }
                $("#J_info").css('visibility','visible');
                $.post('/index/index',data,function(result){

                    $("#J_info").text(result.msg);
                    setTimeout(function(){
                        $("#J_info").css('visibility','hidden').text('发送中..');
                    }, 2000);

                },'json')
                return true;

            });
//             $.ajax({
//         		type:"post",
//         		url:"/myssm/bbsSection/querySection.do",
//         		dataType: "json",
//         		success:function(sectionList){
//         			for(i in sectionList){
//         				$("#sectionId").append("<option value='"
//         						+sectionList[i].sectionId+"' >"+sectionList[i].sectionName+"</option>");
        			
//         		}
//         	});
            
            //CODE END
        });
    </script>
</body>
</html>
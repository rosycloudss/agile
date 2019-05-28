<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/background/js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	

function changepic() {
    var reads= new FileReader();
    var filename='file'+arguments[1];
    var imgName='img'+arguments[1];
    
    f=document.getElementById(filename).files[0];
    reads.readAsDataURL(f);
    reads.onload=function (e) {
        document.getElementById(imgName).src=this.result;
    };
}

</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">轮播图管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    <div class="formbody">
    
    <div class="formtitle"><span>更新轮播</span></div>
    <ul class="classlist">
    
    <li>
    <form action="<%=request.getContextPath() %>/background/manage/rotation_update.action?number=1" method="post" enctype="multipart/form-data">
    <span>
    <a href="javascript:;" class="a-upload" style="width:400px;height:225px;">
	   	<input id="file1" type="file" name="img" onchange="changepic(this,1)" />
	   	<c:choose>
	   		<c:when test="${not empty rotation1.imgLink }">
	   			<img id="img1" src="<%=request.getContextPath() %>/${rotation1.imgLink}"/>
	   		</c:when>
	   		<c:otherwise>
	   			<img src="<%=request.getContextPath() %>/foreground/images/add.jpg"/>
	   		</c:otherwise>
	   	</c:choose>
    </a>
    </span>
    <div>
    <h3 style="margin:10px;">点击图片进行上传</h3>
    <input type="submit" class="btn" value="确认修改"/>
    <cite><font color="red">${msg1 != null ? msg1 : "" }</font></cite>
    </div>
    </form>
    </li>
    
    <li>
    <form action="<%=request.getContextPath() %>/background/manage/rotation_update.action?number=2" method="post" enctype="multipart/form-data">
    <span>
    <a href="javascript:;" class="a-upload" style="width:400px;height:225px;">
    	<input id="file2" type="file" name="img" onchange="changepic(this,2)" />
    	<img id="img2" src="<%=request.getContextPath() %>/${rotation2.imgLink}" />
    </a>
    </span>
    <div>
    <h3 style="margin:10px;">点击图片进行上传</h3>
    <input type="submit" class="btn" value="确认修改"/>
    <cite><font color="red">${msg2 != null ? msg2 : "" }</font></cite>
    </div>
    </form>
    </li>
    
    <li>
    <form action="<%=request.getContextPath() %>/background/manage/rotation_update.action?number=3" method="post" enctype="multipart/form-data">
    <span>
    <a href="javascript:;" class="a-upload" style="width:400px;height:225px;">
    	<input id="file3" type="file" name="img" onchange="changepic(this,3)" />
    	<img id="img3" src="<%=request.getContextPath() %>/${rotation3.imgLink}" />
    </a>
    </span>
    <div>
    <h3 style="margin:10px;">点击图片进行上传</h3>
    <input type="submit" class="btn" value="确认修改"/>
    <cite><font color="red">${msg3 != null ? msg3 : "" }</font></cite>
    </div>
    </form>
    </li>
    </ul>
    </div>    
    </div>
</body>
</html>
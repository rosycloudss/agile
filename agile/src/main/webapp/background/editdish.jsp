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

var dishid;

$(document).ready(function(){
  $(".edit").click(function(){
	    $.ajax({url:"/agile/background/manage/querydish.action?id="+$(this).attr("id"),async:true,success:function(result){
	    	var obj = JSON.parse(result);
			$('#dishId').val(obj.dishId);
			$('#name').val(obj.name);
			$('#category').val(obj.categoryId);
			$('#leftnum').val(obj.leftNum);
			$('#price').val(obj.price);
			$('#description').val(obj.description);
	    }});
	  $("#editform").fadeIn(200);
  });
  
  $(".delete").click(function(){
	 dishid=$(this).attr("id")
	  $("#deletetip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
	  $("#tip").fadeOut(200);
  });
  
  $(".editformtop a").click(function(){
	  $("#editform").fadeOut(200);
  });
  
  $("#deletetop a").click(function(){
	  $("#deletetip").fadeOut(200);
  });

  $("#sure").click(function(){
	  $.ajax({url:"/agile/background/manage/deletedish.action?id="+dishid,async:true,success:function(result){
	    	var obj = JSON.parse(result);
	    	if(obj) 	alert("删除成功！");
	    	else   alert("删除失败！");
	  	  	$("#editform").fadeOut(200);
	  	  	window.location.reload();  /* 刷新当前页面 */
	    }});
	  $("#deletetip").fadeOut(100);
  });

  $(".cancel").click(function(){
	  $("#tip").fadeOut(100);
  });
  
  $("#submit").click(function(){
	     
	  var data = $("#updateform").serialize();   //表单里进行序列化    
	   $.ajax({ 
	    type:'post',
	    url:"/agile/background/manage/updatedish.action",
	    cache: false,
	    data:data,
	    dataType:'text', 
	    success:function(data){
	  	  	$("#editform").fadeOut(200);
	  	  	window.location.reload();  /* 刷新当前页面 */
	    },
	    error:function(){ 
	     alert("请求失败")
	    }
	   })
	   return false;
  });

});
</script>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">编辑菜品信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <ul class="imglist">
    
    <c:forEach items="${dishList}" var="dish">
	    <li class="selected">
	    <span><img width="168px" height="126px" src="<%=request.getContextPath() %>/${dish.img.imgUrl}"/></span>
	    <h2>${dish.name}</h2>
	    <p><a class="edit" id="${dish.dishId}" >编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
	       <a class="delete" id="${dish.dishId}">删除</a>
	    </p>
	    </li>
    </c:forEach>
    </ul>
    
    <div class="xline"></div>
   
   <div class="pagin">
    	<div class="message">共<i class="blue">${pageItem.totalRecord}</i>条记录，当前显示第&nbsp;<i class="blue">${pageItem.pageCurrent }&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <c:forEach var="i" begin="1" end="${pageItem.totalPage}" step="1">
        <li class="paginItem"><a href="<%=request.getContextPath() %>/background/manage/getdishes.action?type=2&page=${i}">${i}</a></li>
        </c:forEach>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    <p id="ddd"></p>
	<div class="editform" id="editform">
		<div class="editformtop"><span>提示信息</span><a></a></div>
		<div class="editforminfo">
			<div class="editformright">
			<div class="formtitle"><span>基本信息</span></div>
			<form id="updateform" >
			<ul class="forminfo">
			<li><label>id</label><input id="dishId" name="dishId" type="text" readonly="readonly" class="dfinput" /></li>
			<li><label>名称</label><input id="name" name="name" type="text" class="dfinput" /><i>名称不能超过30个字符</i></li>
			<li><label>菜品种类</label><input id="category" name="categoryId" type="text" class="dfinput"/><i>输入数字</i></li>
			<li><label>上架份数</label><input id="leftnum" name="leftNum" type="text" class="dfinput" /><i>输入数字</i></li>
			<li><label>图片信息</label><cite><input type="file" /></cite></li>
			<li><label>定价(￥)</label><input id="price" name="price" type="text" class="dfinput" /><i>输入数字</i></li>
			<li><label>菜品介绍</label><textarea id="description" name="description" cols="" rows="" class="textinput"></textarea></li>
			<li><label>&nbsp;</label><cite><font color="red">${msg != null ? msg : "" }</font></cite></li>
			<li><label>&nbsp;</label><input id="submit" type="button" class="btn" value="确认修改"/></li>
			</ul>
			</form>
			</div>
		 </div>
    </div>
    <div class="tip" id="deletetip">
	    <div class="tiptop" id="deletetop"><span>提示信息</span><a></a></div>
	      <div class="tipinfo">
	        <span><img src="<%=request.getContextPath() %>/background/images/ticon.png" /></span>
	        <div class="tipright">
	        <p>是否删除该菜品 ？</p>
	        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
	        </div>
	        </div>
	        <div class="tipbtn">
	        <input name="" type="button"  class="sure" id="sure" value="确定" />&nbsp;
	        <input name="" type="button"  class="cancel" value="取消" />
	        </div>
	    </div>
    </div>
</body>
</html>

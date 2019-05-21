<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>404错误提示</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/background/js/jquery.js"></script>

<script language="javascript">
	$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    })  
});  
</script> 

</head>

<body style="background:#edf6fa;">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>404错误提示</li>
    </ul>
    </div>
    
    <div class="error">
    
    <h2>非常遗憾，您访问的页面不存在！请重新登录</h2>
    <p>看到这个提示，就自认倒霉吧!</p>
    <div class="reindex"><a href="<%=request.getContextPath() %>/background/manage/employeelogin.action" target="_parent">返回重新登录</a></div>
    
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath() %>/background/js/jquery.js" language="JavaScript" ></script>
<script src="<%=request.getContextPath() %>/background/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  

<div class="logintop">    
    <span>欢迎XX餐厅后台管理平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <form action = "<%=request.getContextPath() %>/background/manage/employeelogin.action"  method="post">
    
    <ul>
    <li style="height: 0px"><label><font color="red">${msg != null ? msg : "" }</font></label></li>
    <li><input name="account" type="text" class="loginuser" value="1759840027" /></li>
    <li><input name="password" type="password" class="loginpwd" value="123456" /></li>
    <li><input name="" type="submit" class="loginbtn" value="登录" /><label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
 
    </ul>
    </form>
    
    </div>
    
    </div>
    
    <div class="loginbm">版权所有  2019  .com XX餐厅后台管理平台</div>
</body>
</html>
<!--<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户注册</title>
    <link href="<%=request.getContextPath() %>/foreground/css/login/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <link href="<%=request.getContextPath() %>/foreground/css/login/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/foreground/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/foreground/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/foreground/js/Validform_v5.3.2_min.js"></script>
   
</head>
<body style="background: #0C0C0C">
<div class="header">
    <h1 class="headerLogo"><a title="餐厅" target="_blank" href="#"><img alt="logo" src="<%=request.getContextPath() %>/foreground/images/logo-login.png"></a></h1>
</div>
<div class="banner">
    <div class="login-aside">
        <div id="o-box-up"></div>
        <div id="o-box-down"  style="table-layout:fixed;">
            <div class="error-box">${msg != null ? msg : "" } </div>
            <form class="registerform" onsubmit="return checkForm()" action = "<%=request.getContextPath() %>/foreground/customer/register.action"  method="post">
				<div class="fm-item">
                    <label for="logonId" class="form-label">账号：</label>
                    <input id="account" class="i-text" type="text" placeholder="输入电话号码" name="account">
                    <<div id="error" class="ui-form-explain error-box"></div>
                </div>
                <div class="fm-item">
                    <label for="logonId" class="form-label">密码：</label>
                    <input id="password" type="password" class="i-text" name="password" placeholder="请输入密码">
                    <div class="ui-form-explain error-box"></div>
                    
                </div>
				<div class="fm-item">
				    <label for="logonId" class="form-label">重输密码：</label>
				    <input id="confirmPassword"  type="password" class="i-text" name="confirmPassword" placeholder="请再次输入密码" >
				    <div class="ui-form-explain"></div>
				</div>
                <div class="fm-item">
                    <label for="logonId" class="form-label"></label>
                    <input type="submit" value="注册" tabindex="4" id="send-btn" class="btn-login">
                    <div class="ui-form-explain"></div>
                    <a href="<%=request.getContextPath() %>/foreground/login.jsp">已有账号？去登陆</a>
                </div>
            </form>
        </div>
    </div>
    <div class="bd">
        <ul>
            <li style="background:url(<%=request.getContextPath() %>/foreground/images/login.jpg) #CCE1F3 center 0 no-repeat;"><a href="#"></a></li>
        </ul>
    </div>
    <div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>
<div class="banner-shadow"></div>
</body>
 <script type="text/javascript">     
	var phone = /^1(3|4|5|7|8)\d{9}$/;
	var canRegist = false;
	function checkForm() {
		var account = $("#account").val();
		var password = $("#password").val();
		var confirmPassword = $("#confirmPassword").val();
		if (account == "") {
			$("#account").val("");
			alert("请输入电话号码");
			return false;
		} else if (!(phone.test(account))) {
			alert("电话号码格式错误");
			return false;
		} else if (password == "请输入密码" ||  password == "") {
			$("#password").val("");
			alert("请输入密码");
			return false;
		} else if(password != confirmPassword) {
			alert("两次密码输入不相同");
			return false;
		}else{
			return canRegist;
		}
	}
	
	$("#account").blur(function(){
		$.ajax({
			type:"GET",
			url:'<%=request.getContextPath() %>/foreground/customer/phoneIsExist?account=' + $('#account').val(),
			dataType:"json",
			success:function(data){
				if(data.result > 0){
					$("#error").text("电话号码已注册");
				}else{
					$("#error").text("");
					canRegist = true;
				}
			}
		});
	});
 </script>
</html>

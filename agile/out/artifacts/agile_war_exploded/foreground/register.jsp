<!--<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统注册</title>
    <link href="<%=request.getContextPath() %>/foreground/css/login/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <link href="<%=request.getContextPath() %>/foreground/css/login/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="<%=request.getContextPath() %>/foreground/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/foreground/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/foreground/js/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#send-btn").click = function () {
                $(".i-text").focus(function(){
                    $(this).addClass('h-light');
                });
                $(".i-text").focusout(function(){
                    $(this).removeClass('h-light');
                });
                $("#account").focus(function(){
                    var username = $(this).val();
                    if(username=='输入账号'){
                        $(this).val('');
                        return false;
                    }
                });
                $("#account").focus(function(){
                    var username = $(this).val();
                    if(username==''){
                        $(this).val('输入账号');
                        return false;
                    }
                });
                var password;
                $("#password").focus(function(){
                    password = $(this).val();
                    if('请输入密码' === password){
                        $(this).val('');
                        return false;
                    }
                });
                alert(password);
                $("#password2").focus(function() {
                    var password2 = $(this).val();
                    if (password2 !== password){
                        alert("两次密码不一致");
                        $("#password").focus();
                        return false;
                    }
                });
                return true;
            }
        });

    </script>
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
            <form class="registerform" action = "<%=request.getContextPath() %>/foreground/customer/register.action"  method="post">
				<div class="fm-item">
                    <label for="logonId" class="form-label">账号：</label>
                    <input type="text" placeholder="输入电话号码" name="account" maxlength="100" id="account" class="i-text" ajaxurl="demo/valid.jsp"  datatype="s6-18" errormsg="用户名至少6个字符,最多18个字符！"  >
                    <div class="ui-form-explain"></div>
                </div>
                <div class="fm-item">
                    <label for="logonId" class="form-label">密码：</label>
                    <input type="password" name="password" placeholder="请输入密码" maxlength="100" id="password" class="i-text" datatype="*6-16" nullmsg="请输入密码" errormsg="密码范围在6~16位之间！">
                    <div class="ui-form-explain"></div>
                </div>
				<div class="fm-item">
				    <label for="logonId" class="form-label">重输密码：</label>
				    <input type="password" name="password2" placeholder="请再次输入密码" maxlength="100" id="password2" class="i-text" datatype="*6-16" nullmsg="请重新输入密码" errormsg="密码范围在6~16位之间！">
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
</html>

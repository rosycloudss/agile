<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=request.getContextPath() %>/background/js/jquery.js"></script>
<script type="text/javascript">
function validate() {
	var newPasswd = document.getElementById("newPasswd");
	var newPasswd1 = document.getElementById("newPasswd1");
	if(newPasswd.value!=newPasswd1.value) {
		alert('新旧密码不同，请重新输入');
		document.getElementById("newPasswd").value ="";
		document.getElementById("newPasswd1").value ="";
		newPasswd.focus();
		return false;
	}
	return true;
	}
function putPwd(){
	var newPasswd = document.getElementById("newPasswd");
	var newPasswd1 = document.getElementById("newPasswd1");
	if(newPasswd.value=="") {
		alert("请输入密码");
		document.getElementById("newPasswd1").value ="";
	}
}
function putTEL(){
	var tel = document.getElementById("phone");
	if(tel.valeu == "")
	alert("请输入联系方式")
	}
</script>

</head>
<body>	
<div class="formbody">
    <div class="formtitle"><span>管理员基本信息</span></div>
    <form action="<%=request.getContextPath() %>/background/feng/defineCode.action?vcode=vcode&newPasswd=newPasswd" method="post" onsubmit="return validate();">
	    <ul class="forminfo">
	    <li><label>ID值</label><input name="account" type="text" class="dfinput" readonly="readonly"  value="${sessionScope.employee.employeeId}" /></li>
	    
	    <li><label>联系方式</label><input id="phone" name="phone" type="text" readonly="readonly" value="${sessionScope.employee.phone}" class="dfinput" /> 
	        <a href="<%=request.getContextPath() %>/background/feng/sendVcode.action">发送验证码</a></li>
	    
	    <li><label>请输入验证码</label><input name="vcode" id="vcode" type="text" class="dfinput" /></li>
	    <li><label>新密码</label><input name="newPasswd" id="newPasswd" type="password" class="dfinput"  onblur="putTEL()" /></li>
	    <li><label>确认密码</label><input name="newPasswd1" id="newPasswd1" type="password" class="dfinput" onblur="putPwd()"/></li>
	    

	    <li><label>&nbsp;</label><cite><font color="red">${msg != null ? msg : "" }</font></cite></li>
	    <li><label>&nbsp;</label><input type="submit" class="btn" value="修改信息"/></li>
	    </ul>
    </form>
    
    </div>
</body>
</html>
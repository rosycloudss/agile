<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
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
</script>

</head>
<body>
<div align="center">
	     <h2> 更改我的密码</h2>
		<form action="../StudentServlet?flag=updateUserPasswd" method="post" onsubmit="return validate();">
		<table>
			<tr>
				<td>学号：</td><td><input type="text" name="userNum" id="userNum" readonly="readonly" value=${sessionScope.user.userNumber}></td>
			</tr>
			<tr>
				<td>原密码：</td><td><input type="password" name="oldPasswd" id="oldPasswd"> </td>
			</tr>
			<tr>
				<td>新密码：</td><td><input type="password" name="newPasswd" id="newPasswd"> </td>
			</tr>
			<tr>
				<td>确认新密码：</td><td><input type="password" name="newPasswd1" id="newPasswd1"> </td>
			</tr>
			<tr>
				<td><input name="submit" type="submit" value="提交"></td>
				<td><input type="reset" value="重置"> </td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>
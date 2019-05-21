<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改个人信息</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=request.getContextPath() %>/background/js/jquery.js"></script>
</head>

<body>
    
    <div class="formbody">
    <div class="formtitle"><span>管理员基本信息</span></div>
    <form action="<%=request.getContextPath() %>/background/feng/updateEmployeeInfo.action" method="post">
	    <ul class="forminfo">
	    <li><label>ID值</label><input name="employeeId" type="text" class="dfinput" readonly="readonly"  value="${queryemployee.employeeId}" /></li>
	    <li><label>账号</label><input name="account" type="text" class="dfinput" readonly="readonly"  value="${queryemployee.account}" /></li>
	    <li><label>密码</label><input id="passwd" name="pwdfirst" type="password" class="dfinput" value="${queryemployee.pwd}" /></li>
	    <li><label>姓名</label><input name="name" type="text" class="dfinput" value="${queryemployee.name}" /></li>
	    <li><label>联系方式</label><input name="phone" type="text" class="dfinput" value="${queryemployee.phone}" /></li>
	    <li><label>&nbsp;</label><cite><font color="red">${msg != null ? msg : "" }</font></cite></li>
	    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认"/></li>
	    </ul>
    </form>
    
    </div>
</body>
</html>
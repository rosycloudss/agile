<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加菜品类别</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="dishcategory_add.jsp">添加菜品类别</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"><span>基本信息</span></div>
    <form action="<%=request.getContextPath() %>/background/feng/dishcategory_add.action" method="post">
	    <ul class="forminfo">
		    <li><label>菜品类别名称</label><input name="name" type="text" class="dfinput" /><i>名称不能超过10个字符</i></li>
		    <li><label>菜品类别介绍</label><textarea name="description" cols="" rows="" class="textinput"></textarea></li>
		    <li><label>&nbsp;</label><cite><font color="red">${msg != null ? msg : "" }</font></cite></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认添加"/></li>
	    </ul>
    </form>
    
    </div>
</body>
</html>
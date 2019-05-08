<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加菜品</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="<%=request.getContextPath() %>/background/manage/adddish.action" method="post">
    <ul class="forminfo">
    <li><label>名称</label><input name="name" type="text" class="dfinput" /><i>名称不能超过30个字符</i></li>
    <li><label>菜品种类</label><input name="category" type="text" class="dfinput" /><i>输入数字</i></li>
    <li><label>上架份数</label><input name="leftnum" type="text" class="dfinput" /><i>输入数字</i></li>
    <li><label>图片信息</label><cite><input type="file"/></cite></li>
    <li><label>定价(￥)</label><input name="price" type="text" class="dfinput" /><i>输入数字</i></li>
    <li><label>菜品介绍</label><textarea name="description" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><cite><font color="red">${msg != null ? msg : "" }</font></cite></li>
    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认添加"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
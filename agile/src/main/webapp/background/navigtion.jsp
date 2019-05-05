<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导航</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=request.getContextPath() %>/background/js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>通讯录</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>菜单管理
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="<%=request.getContextPath() %>/background/manage/alldishes.action" target="rightFrame">菜单信息列表</a><i></i></li>
        <li><cite></cite><a href="<%=request.getContextPath() %>/background/adddish.jsp" target="rightFrame">增加新菜单</a><i></i></li>
        <li><cite></cite><a href="<%=request.getContextPath() %>/background/editdish.jsp" target="rightFrame">编辑菜品信息</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>菜单类别管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="#">编辑菜品类别</a><i></i></li>
        <li><cite></cite><a href="#">发布菜品类别</a><i></i></li>
        <li><cite></cite><a href="#">菜品类别查询</a><i></i></li>
        </ul>     
    </dd> 
    
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>公告信息管理（待定）</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">添加新公告</a><i></i></li>
        <li><cite></cite><a href="#">公告历史查询</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="images/leftico04.png" /></span>销售订单管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">销售订单列表</a><i></i></li>
        <li><cite></cite><a href="#">销售订单查询</a><i></i></li>
        <li><cite></cite><a href="#">本日销售统计</a><i></i></li>
    </ul>
	
	<dd><div class="title"><span><img src="images/leftico04.png" /></span>系统用户管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">修改密码</a><i></i></li>
    </ul>
    
    </dd>  
    
    </dl>
</body>
</html>

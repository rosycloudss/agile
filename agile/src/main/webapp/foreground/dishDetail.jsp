<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>特色美食</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/product_cn.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/basic.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/showproduct_cn.css">
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/foreground/js/jquery-3.4.1.js"></script>
<script type="application/javascript"
	src="<%=request.getContextPath()%>/foreground/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!--头部-->
	<div class="head layui-col-xs12">
		<div class="layui-col-xs12">
			<a href="<%=request.getContextPath()%>/foreground/home.jsp"><img
				src="<%=request.getContextPath()%>/foreground/images/logo.png"></a>
			<div style="float: right; margin-top: 10px; margin-right: 30px;">
				<c:choose>
					<c:when test="${customer == null }">
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/login.jsp">登录</a></label>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/register.jsp">注册</a></label>
					</c:when>
					<c:otherwise>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></label>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/customer/logout.action">退出登录</a></label>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="layui-col-xs12">
			<ul class="layui-nav nav">
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/home.jsp">网站首页</a></li>
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0">特色美食</a></li>
				<c:if test="${customer != null }">
					<li class="layui-nav-item"><a
						href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></li>
				</c:if>
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/about.jsp">关于我们</a></li>
			</ul>
		</div>
		<div class="layui-col-xs12">
			<img style="width: 100%; height: 100%"
				src="<%=request.getContextPath()%>/foreground/images/1527671199.jpg">
		</div>
	</div>
	<!-- 面包屑 -->
	<div class="layui-col-xs12" >
		<div class="layui-col-xs6">
			<ul class="breadcrumb" style="margin-left: 200px;">
			    <li><a href="<%=request.getContextPath()%>/foreground/home.jsp">网站首页</a></li>
			    <li><a href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0">特色美食</a></li>
			    <li class="active">${category.getName() }</li>
			</ul>
		</div>
		<hr/>
	</div>
	<!-- 面包屑 -->
	<!-- 菜品信息 -->
	<div class="layui-col-xs12">
		<!-- 菜品图片 -->
		<div class="layui-col-xs6">
			<div style="margin-left: 200px;margin-top: 50px;margin-right: 100px;float: right;">
				<img width="600px" src="<%=request.getContextPath()%>/${dish.getImg().getImgUrl() }" alt="${dish.getName() }">
			</div>
		</div>
		
		<!-- 菜品详情 -->
		<div class="layui-col-xs6" style="float: left;padding-right: 20px">
			<!-- 菜品简介 -->
			<div>
				<h1 style="color: #bf9764">${dish.getName() }</h1>
				<h4 style="color: #848484;">${dish.getDescription() }</h4>
			</div>
			<div class="layui-card" style="margin-top: 30px">
				<div class="layui-card-header" style="color: #bf9764;font-size: 17px">详细信息</div>
				<div class="layui-card-body" style="font-size: 15px">
					${dish.getDescription() }
				</div>
			</div>
		</div>
	</div>
	
	<!-- 热门推荐 -->
	<div class="layui-col-xs12">
		<hr style="margin-top:30px;"/>
		<h2 style="margin-left:200px;color:#848484;">热门推荐</h2>
		<!-- 热门推荐 -->
		<div style="margin-left:200px;margin-right: 50px;margin-top: 20px;">
			<ul class="list-inline">
			<c:forEach items="${dishList}" var="hotDish">
			    <li><img width="300px"  src="<%=request.getContextPath()%>/${hotDish.getImg().getImgUrl() }" alt="${hotDish.getName() }"> </li>
			</c:forEach>
			</ul>
		</div>
	</div>
	
</body>
<script>
	layui.use('carousel', 'laypage', 'layer', function() {
		var carousel = layui.carousel;
		var laypage = layui.laypage
		var layer = layui.layer;
		//建造实例
		carousel.render({
			elem : '#ration',
			width : '100%' //设置容器宽度
			,
			height : '600px',
			arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			,
			autoplay : true
		});
	});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/style.css">
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
	<!--头部-->
	<div class="head layui-col-xs12">
		<div class="layui-col-xs12">
			<img src="<%=request.getContextPath()%>/foreground/images/logo.png">
			<div style="float: right; margin-top: 10px; margin-right: 30px;">
				<c:choose>
					<c:when test="${customer == null }">
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/login.jsp">登录</a></label>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/register.jsp">注册</a></label>
					</c:when>
					<c:otherwise>
						<label style="margin-right: 10px"><a href="#">个人中心</a></label>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/customer/logout.action">退出登录</a></label>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="layui-col-xs12">
			<ul class="layui-nav nav">
				<li class="layui-nav-item layui-this"><a
					href="<%=request.getContextPath()%>/foreground/home.jsp">网站首页</a></li>
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0">特色美食</a></li>
				<c:if test="${customer != null }">
					<li class="layui-nav-item"><a href="#">个人中心</a></li>
				</c:if>
				<li class="layui-nav-item"><a href="<%=request.getContextPath()%>/foreground/about.jsp">关于我们</a></li>
			</ul>
		</div>
	</div>
	<!--轮播图-->
	<div class="layui-col-xs12">
		<div class="layui-carousel" id="ration">
			<div carousel-item="">
				<img src="<%=request.getContextPath()%>/foreground/images/ration1.jpg"> 
				<img src="<%=request.getContextPath()%>/foreground/images/ration2.jpg"> 
				<img src="<%=request.getContextPath()%>/foreground/images/ration3.jpg">
			</div>
		</div>
	</div>
	<!--特色美食-->
	<div class="layui-col-xs12 container">
		<div class="title">
			<h2 class="">特色美食</h2>
			<p class="desc">special delicious food</p>
		</div>
		<div style="width: 70%; margin-left: auto; margin-right: auto;">
			<ul class=" newpd-list clearfix">
				<li class="layui-col-md6" style="height: 686.875px;">
					<div class="widget">
						<figure class="widget-header">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=11"
								title="西式菜系" target="_self">
								<div class="cover-image"
									style="background-image: url(https://images.mituo.cn/mui144/upload/mui144/201805/1527652181.jpg);"
									alt="西式菜系"></div>
							</a>
						</figure>
						<h4 class="widget-title" data-plugin="appear"
							data-animate="slide-bottom50" data-repeat="false" color="#212121"
							tr="0.7" trh="0.75" style="background: rgba(33, 33, 33, 0.7);">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=11"
								title="西式菜系" target="_self">
								<h3>西式菜系</h3>
								<p class="desc">西餐，顾名思义是西方国家的餐食。西方国家，是相对于东亚而言的欧洲白人世界文化圈，西餐的准确称呼应为欧...</p>
							</a>
						</h4>
					</div>
				</li>
				<li class="layui-col-md6 " style="height: 343.438px;">
					<div class="widget">
						<figure class="widget-header">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=12"
								title="中式菜系" target="_self">
								<div class="cover-image layui-anim"
									data-anim="layui-anim-scaleSpring"
									style="background-image: url(https://images.mituo.cn/mui144/upload/mui144/201805/1527653106.jpg);"
									alt="中式菜系"></div>
							</a>
						</figure>
						<h4 class="widget-title" data-plugin="appear"
							data-animate="slide-right50" data-repeat="false" color="#212121"
							tr="0.7" trh="0.75" style="background: rgba(33, 33, 33, 0.7);">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=12"
								title="中式菜系" target="_self">
								<h3 style="color: #c8c8c8;">中式菜系</h3>
								<p class="desc">中国八大菜系菜品选料考究、 技法多样、 制作精良的烹饪技艺闻名于世。 基于此，
									《中国八大菜系及中式...</p>
							</a>
						</h4>
					</div>
				</li>
				<li class="layui-col-md6 " style="height: 343.438px;">
					<div class="widget">
						<figure class="widget-header">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=13"
								title="面类点心" target="_self">
								<div class="cover-image"
									style="background-image: url(https://images.mituo.cn/mui144/upload/mui144/201805/1527652515.jpg);"
									alt="面类点心"></div>
							</a>
						</figure>
						<h4 class="widget-title" data-plugin="appear"
							data-animate="slide-right50" data-repeat="false" color="#212121"
							tr="0.7" trh="0.75" style="background: rgba(33, 33, 33, 0.7);">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=13"
								title="面类点心" target="_self">
								<h3>面类点心</h3>
								<p class="desc">面点是中国烹饪的主要组成部分，素以历史悠久、制作精致、品类丰富、风味多样著称于世。春秋战国时，谷物品...</p>
							</a>
						</h4>
					</div>
				</li>
				<li class="layui-col-md12 " style="height: 343.438px;">
					<div class="widget">
						<figure class="widget-header">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=14"
								title="蔬菜类菜肴" target="_self">
								<div class="cover-image"
									style="background-image: url(https://images.mituo.cn/mui144/upload/mui144/201805/1527653712.jpg);"
									alt="蔬菜类菜肴"></div>
							</a>
						</figure>
						<h4 class="widget-title" data-plugin="appear"
							data-animate="slide-right50" data-repeat="false" color="#212121"
							tr="0.7" trh="0.75" style="background: rgba(33, 33, 33, 0.7);">
							<a
								href="https://mb.mituo.cn/mui144/product/product.php?class2=14"
								title="蔬菜类菜肴" target="_self">
								<h3>蔬菜类菜肴</h3>
								<p class="desc">在夏日时光,我倾向于用玫瑰红葡萄酒(rosé)配蔬菜类的菜肴,尤其是普罗旺斯(Provence)产区...</p>
							</a>
						</h4>
					</div>
				</li>
			</ul>
		</div>


	</div>
	

	<script>
		layui.use('carousel', function() {
			var carousel = layui.carousel;
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
</body>

</html>
>
</html>
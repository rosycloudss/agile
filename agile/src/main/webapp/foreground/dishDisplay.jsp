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
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/foreground/js/jquery-3.4.1.js"></script>	
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
						<label style="margin-right: 10px"><a href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></label>
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
				<li class="layui-nav-item layui-this"><a
					href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0">特色美食</a></li>
				<c:if test="${customer != null }">
					<li class="layui-nav-item"><a href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></li>
				</c:if>
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/about.jsp">关于我们</a></li>
			</ul>
		</div>
		<div class="layui-col-xs12">
			<img style="width: 100%; height: 100%"
				src="<%=request.getContextPath()%>/foreground/images/1527671199.jpg">
		</div>
		<div class="layui-col-xs12">
			<ul class="layui-nav nav ">
				<c:forEach items="${dishCategorys }" var="category">
					<li
						class="layui-nav-item ${category.getCategoryId() == categoryId ? 'layui-this' : '' } "><a
						href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=${category.getCategoryId() } ">${category.getName() }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div style="width: 90%; margin-left: auto; margin-right: auto;"
		class="">
		<ul
			class="product_list_page_met_11_1_44-list blocks blocks-xs-2 blocks-md-2 blocks-lg-3 blocks-xxl-3 ulstyle met-pager-ajax imagesize"
			id="met-grid" data-scale=''>
			<c:forEach items="${dishList }" var="dish">
				<li class='p-r-15  item'>
					<div class="card ">
						<figure class="overlay overlay-hover">
							<img class="overlay-figure"
								src="<%=request.getContextPath()%>/${dish.getImg().getImgUrl() }"
								alt="${dish.getName() }">
							<a href="<%=request.getContextPath()%>/foreground/dish/dishDetail.action?dishId=${dish.getDishId() }" target=_self
								class="overlay-panel overlay-background overlay-fade overlay-icon">
								<i class="fa fa-search"></i>
							</a>
						</figure>
						<h4 class="card-title p-y-20 font-szie-16 ">
							<div class="layui-row">
								<div class="layui-col-md4">
									<h4>${dish.getName() }</h4>
								</div>
								<div class="layui-col-md4">
									<h4>${dish.getPrice() }</h4>
								</div>
								<div class="layui-col-md4">
									<button class="layui-btn layui-btn-lg" onclick="addToCar(${dish.getDishId() })">
										<h4>加入餐车</h4>
									</button>
								</div>
							</div>
						</h4>
					</div>
				</li>
			</c:forEach>
		</ul>
		<!-- 分页设置 -->
		<div align="center">
			<!--******************** 设置上一页和下一页******************************** -->
			<c:set var="previousPage"
				value="${requestScope.page.getPageCurrent() - 1 }"></c:set>
			<c:set var="nextPage"
				value="${requestScope.page.getPageCurrent() + 1 }"></c:set>

			<c:if test="${previousPage <= 0 }">
				<c:set var="previousPage" value="1"></c:set>
			</c:if>

			<c:if test="${nextPage > requestScope.page.getTotalPage() }">
				<c:set var="nextPage" value="${requestScope.page.getTotalPage() }"></c:set>
			</c:if>

			<ul class="pagination">
				<li><a href="${page.getPath()}&currentPage=1">&laquo;</a></li>
				<li><a href="${page.getPath()}&currentPage=${previousPage}">上一页</a></li>

				<c:choose>
					<c:when test="${requestScope.page.getTotalPage() <= 5 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="${requestScope.page.getTotalPage()}"></c:set>
					</c:when>
					<c:when test="${requestScope.page.getPageCurrent() <= 3 }">
						<c:set var="begin" value="1"></c:set>
						<c:set var="end" value="5"></c:set>
					</c:when>
					<c:otherwise>
						<c:set var="begin"
							value="${requestScope.page.getPageCurrent() - 2 }"></c:set>
						<c:set var="end"
							value="${requestScope.page.getPageCurrent() + 2 }"></c:set>
						<c:if test="${end > requestScope.page.getTotalPage() }">
							<c:set var="begin"
								value="${requestScope.page.getTotalPage() - 4 }"></c:set>
							<c:set var="end" value="${requestScope.page.getTotalPage() }"></c:set>
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${begin }" end="${end}" var="num">
					<c:if test="${num == requestScope.page.getPageCurrent() }">
						<li class="active"><a
							href="${page.getPath()}&currentPage=${num}">${num}</a></li>
					</c:if>
					<c:if test="${num != requestScope.page.getPageCurrent() }">
						<li><a href="${page.getPath()}&currentPage=${num}">${num }</a></li>
					</c:if>
				</c:forEach>
				<li><a href="${page.getPath()}&currentPage=${nextPage}">下一页</a></li>
				<li><a
					href="${page.getPath()}&currentPage=${requestScope.page.totalPage}">&raquo;</a></li>
			</ul>
		</div>
		<!-- 分页结束 -->
		
		  <div id="car_button" class="car" onclick="showCar()">
                <img src="<%=request.getContextPath()%>/foreground/images/car.png">
            </div>
	</div>


	<script>
		layui.use('carousel','laypage', 'layer', function() {
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
		function showCar(){
			var isLogin = "${customer != null ? 1 : 0}"; //判断用户是否登录
			if(isLogin == 1){
		        layui.use('layer', function(){
		            var layer = layui.layer;
		           
		            layer.open({
		                type: 2,
		                title: '餐车',
		                content: ["<%=request.getContextPath()%>/foreground/car/getCarList/${customer.getCustomerId() }"],
		                area: ['1000px', '600px']
		            });
	
		        });
			}else{
				alert("你还未登录,请登录！");
			}
	    }
		
		function addToCar(dishId){
			var isLogin = "${customer != null ? 1 : 0}"; //判断用户是否登录
			if(isLogin == 1){
				$.ajax({
					  url:"/agile/foreground/car/addDish/${customer.getCustomerId() }/"+dishId,
					  success:function(data){	
						var obj = JSON.parse(data)
						if(obj.result == 1){
							alert("添加成功");
						}else{
							alert("添加失败")
						}
					  },
					  error:function(data){
						  alert("失败了");
					  }
				  })
			}else{
				alert("你还未登录,请登录后再进行点菜！");
			}
		}
		
		function checkLogin(){
			
			
		
		}
		
	</script>
</body>

</html>


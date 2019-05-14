<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.order.entity.Dish"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>关于我们</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css" />
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
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0">特色美食</a></li>
				<c:if test="${customer != null }">
					<li class="layui-nav-item"><a href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></li>
				</c:if>
				<li class="layui-nav-item layui-this"><a
					href="<%=request.getContextPath()%>/foreground/about.jsp">关于我们</a></li>
			</ul>
		</div>
	</div>
	<div class="layui-col-xs12">
		<img style="width: 100%;height:100% "
			src="<%=request.getContextPath()%>/foreground/images/1527671199.jpg">
	</div>
	<!--切换卡 -->
	<div class="layui-col-xs12" style="font-size: 24px;">
		<!--品牌故事-->
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title"
				style="text-align: center; color: #c8c8c8;">
				<li class="layui-this" style="font-size: 24px;">品牌故事</li>
				<li style="font-size: 24px;">奖项荣誉</li>
				<li style="font-size: 24px;">联系我们</li>
			</ul>
			<div class="layui-tab-content"
				style="height: 100px; padding-left: 100px; padding-right: 100px;">
				<div class="layui-tab-item layui-show">
					<h4
						style="color: rgb(165, 165, 165); padding-bottom: 10px; padding-top: 20px; font-size: 24px;";>简介/About</h4>
					<hr
						style="overflow: visible; margin-top: 22px; margin-bottom: 22px; border-top-color: rgb(228, 234, 236); white-space: normal; color: rgb(34, 34, 34);" />
					<p>
						<span style="color: rgb(165, 165, 165)"> <span
							style="color: rgb(165, 165, 165);">
								集团兼具品牌集成、标准供应链、人才及组织竞争力等多重优势。旗下涉及中餐、西
								餐、休闲餐饮、饮品等多种业态，经营与投资上海小南国、南小馆、慧公馆、ORENO、 Pokka Café、Wolfgang
								Puck、DOUTOR、米芝莲等众多知名餐饮品牌。 </span>
						</span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <span
							style="color: rgb(165, 165, 165);">
								餐饮有限公司聚集社会各界各领域精英，在有丰富从业经验的基础不断摸索学习，形
								成了一套符合多种美食的科学管理体系。餐饮有限公司以市场为导向，以技术为依托，
								以健康环保的现代化生产技术代替老旧生产线作业；以公司标准化运营代替家族式企
								业管理；以线上营销推广拉动线下门店客流量；以国际化服务标准提供个性化服务。
								公司80、90后团队博采各行业之众长，不断向餐饮行业注入新的激情和理念。 </span>
						</span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <span
							style="color: rgb(165, 165, 165);">
								公司坚持“用心做味道，良心做品质”的经营理念，传承餐饮有限公司文化之精髓，经过
								市场的磨砺和公司团队的不懈追求，餐饮有限公司在技术研发、品牌建设、运营管理等
								各个方面均取得了瞩目的成绩，得到社会各界的认可，也奠定了在行业的地位及影响力。 </span>
						</span>
					</p>
					<p>
						<strong> <span style="color: rgb(255, 192, 0);">使命</span>
						</strong>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)">以食为天，让天下尽享美食的幸福 </span>
					</p>
					<p>
						<strong> <span style="color: rgb(255, 192, 0);">愿景</span>
						</strong>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)">国际一流的餐饮品牌运营集成平台 </span>
					</p>
					<p>
						<strong> <span style="color: rgb(255, 192, 0);">价值观</span>
						</strong>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)">客户第一 战略驱动 </span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)">坚持品质 自我革新 </span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)">激情 协同 合作 分享 </span>
					</p>
					<br> <br> <br> <br>
				</div>
				<!--奖项荣誉-->
				<div class="layui-tab-item">
					<!-- 2017-->
					<p>
						<strong> <span style="color: rgb(255, 192, 0);">2017年</span>
						</strong>
					</p>
					<hr />
					<p style="padding-left: 90px;">
						<span style="color: rgb(165, 165, 165)">
							2016年度中国餐饮百强企业中国烹饪协会 <br>
						</span>
					</p>
					<p style="padding-left: 90px;">
						<span style="color: rgb(165, 165, 165)"> 中国餐饮30年卓越企业奖中国烹饪协会
							<br>
						</span>
					</p>
					<p style="padding-left: 90px;">
						<span style="color: rgb(165, 165, 165)"> <span
							style="color: rgb(165, 165, 165); white-space: pre;"></span>
							2017中国首届餐饮外卖大会外卖风向标正餐知名品牌 <br>
						</span>
					</p>
					<!-- 2016-->
					<p>
						<strong> <span style="color: rgb(255, 192, 0);">2016年</span>
						</strong>
					</p>
					<hr />
					<p style="padding-left: 90px;">
						<span style="color: rgb(165, 165, 165)">
							2016年度中国餐饮百强企业中国烹饪协会 <br>
						</span>
					</p>
					<p style="padding-left: 90px;">
						<span style="color: rgb(165, 165, 165)"> 中国餐饮30年卓越企业奖中国烹饪协会
							<br>
						</span>
					</p>
					<p style="padding-left: 90px;">
						<span style="color: rgb(165, 165, 165)">
							2017中国首届餐饮外卖大会外卖风向标正餐知名品牌 <br>
						</span>
					</p>
					<br> <br> <br> <br>
				</div>
				<!--联系我们-->
				<div class="layui-tab-item" style="padding-left: 150px;">
					<br> <br>
					<p>
						<span style="color: rgb(255, 192, 0);"> <strong>地址：</strong>
						</span> <span style="color: rgb(165, 165, 165)">湖南省长沙市洋湖总部经济区 </span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <strong>
								<span style="color: rgb(255, 192, 0);">电话：</span>
						</strong> 0731-00000000
						</span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <strong>
								<span style="color: rgb(255, 192, 0);">手机：</span>
						</strong> 13300000000
						</span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <strong>
								<span style="color: rgb(255, 192, 0);">联系人：</span>
						</strong> 陈先生
						</span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <strong>
								<span style="color: rgb(255, 192, 0);">邮箱：</span>
						</strong> email@email.mt
						</span>
					</p>
					<p>
						<span style="color: rgb(165, 165, 165)"> <strong>
								<span style="color: rgb(255, 192, 0);">邮箱：</span>
						</strong> www.@@@.www
						</span> <br> <br> <br> <br>
					</p>
				</div>
			</div>
		</div>
	</div>

	<script>
		layui.use('element', function() {
			var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

			//触发事件
			var active = {
				tabChange : function() {
					//切换到指定Tab项
					element.tabChange('demo', '22'); //切换到：用户管理
				}
			};

			$('.site-demo-active').on('click', function() {
				var othis = $(this), type = othis.data('type');
				active[type] ? active[type].call(this, othis) : '';
			});
		});
	</script>

</body>
</html>

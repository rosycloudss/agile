<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.order.entity.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>个人中心</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/style.css">
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.all.js"></script>
<script type="text/javascript" 
    src="<%=request.getContextPath()%>/layui/jquery-3.4.1.js"></script>
	<style> 
		body{ text-align:center} 
		.div1{ margin-left:550px; width:400px; height:100px; border:1px } 
		.div2{ margin-left:1050px; width:300px; height:100px; border:1px }
		.div3{margin-left:150px; width:300px; height:100px; border:1px}
	</style> 
	<script type="text/javascript">
	$(function() {
		 $("#addAddress").click(function(){
			// window.open('address.jsp','添加地址','width=200,height=100');
			   var that = this; 
			      //多窗口模式，层叠置顶
			      layer.open({
			        type: 2 //此处以iframe举例
			        ,title: '添加地址'
			        ,area: ['390px', '260px']
			        ,shade: 0
			        ,maxmin: true
			        ,content: 'address.jsp'
			        ,yes: function(){
			          $(that).click(); 
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			          layer.setTop(layero); //重点2
			        }
			      });
		 });
	});
	</script>
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
						<label style="margin-right: 10px"><a href="<%=request.getContextPath()%>/foreground/personalCenter.jsp">个人中心</a></label>
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
					<li class="layui-nav-item layui-this"><a href="<%=request.getContextPath()%>/foreground/personalCenter.jsp">个人中心</a></li>
				</c:if>
				<li class="layui-nav-item "><a
					href="<%=request.getContextPath()%>/foreground/about.jsp">关于我们</a></li>
			</ul>
			<br><br>
		</div>
	</div>
<!-- 	<div class="layui-col-xs12"> -->
<!-- 		<img style="width: 100%;height:100% " -->
<%-- 			src="<%=request.getContextPath()%>/foreground/images/1527671199.jpg"> --%>
<!-- 	</div> -->

<%--      <form method="post" action="<%=request.getContextPath() %>/foreground/customer/getAddressByCistomerId.action"> --%>
<!--          <input type="text" id="customerId" name="customerId"> -->
<!--          <button type="submit">click</button> -->
<!--      </form> -->
<%--      <c:forEach items="${list}" var="dish"> --%>
<!-- 				<li class='p-r-15  item'> -->
<!-- 					<div class="card "> -->
<!-- 						<h4 class="card-title p-y-20 font-szie-16 "> -->
<!-- 								<div class="layui-col-md4"> -->
<%-- 									<h4>${list.get }</h4> --%>
<!-- 								</div> -->
<!-- 								<div class="layui-col-md4"> -->
<%-- 									<h4>${list.get }</h4> --%>
<!-- 								</div> -->
<!-- 						</h4> -->
<!-- 					</div> -->
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
     
	 <form class="layui-form">
		 <div class="div3">
		        <label for="address" class="form-label"><font color="#ffA500" size="5" >收货地址</font></label>
		     
		 </div>
	 </form>
	
    <form class="layui-form">
	<div class="div1" id="o-box-down"  style="table-layout:fixed;">
	    <div class="layui-form-item layui-form-text"><label><font color="#ffA500" size="5" >个人信息</font></label></div>
		<div class="layui-form-item layui-form-text">
	        <label for="customerId" class="form-label"><font color="#ffA500" size="5" >客户编号：</font></label>
	        <input type="text" name="customerId" maxlength="100" id="customerId" class="i-text" readonly="true" style="height:25px;font-size:20px"
	              value="<%=((Customer)(request.getSession().getAttribute("customer"))).getCustomerId()%>">
	        
	    </div>
	    <div class="layui-form-item layui-form-text">
	        <label for="phone" class="form-label"><font color="#ffA500" size="5" >电话号码：</font></label>
	        <input type="text" name="phone" maxlength="100" id="phone" class="i-text" style="height:25px;font-size:20px"
	              value="<%=((Customer)(request.getSession().getAttribute("customer"))).getPhone()%>">
	     
	    </div>
	    <div class="layui-form-item layui-form-text">
	        <label for="pwd" class="form-label"><font color="#ffA500" size="5" >客户密码：</font></label>
	        <input type="text" name="pwd" maxlength="100" id="pwd" class="i-text" style="height:25px;font-size:20px"
	             value="<%=((Customer)(request.getSession().getAttribute("customer"))).getPwd()%>">
	        
	    </div>
	    <div class="layui-form-item layui-form-text">
	        <label for="status" class="form-label"><font color="#ffA500" size="5" >订单状态：</font></label>
	        <input type="text" name="status" maxlength="100" id="status" class="i-text" style="height:25px;font-size:20px"
	            value="<%=((Customer)(request.getSession().getAttribute("customer"))).getStatus()%>">
	        
	    </div>
	    <div class="layui-form-item layui-form-text" style="margon-left:350px">
	        <input type="button" name="addAddress" maxlength="100" id="addAddress" class="i-text" style="height:25px;
	        font-size:20px;background-color:black;color:#ffA500" value="添加收货地址" > 
	    </div>
    </div>
    </form>
    <div class="div2">
<%-- 	    <img alt="" src="<%=((Customer)(request.getSession().getAttribute("customer"))).getImgId()%>"> --%>
	    <label for="img" class="form-label"><font color="#ffA500" size="5" >个人头像</font></label>
    </div>
    
	<script>
// <!-- // 		layui.use('element', function() { -->
// <!-- // 			var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块 -->

// <!-- // 			//触发事件 -->
// <!-- // 			var active = { -->
// <!-- // 				tabChange : function() { -->
// <!-- // 					//切换到指定Tab项 -->
// <!-- // 					element.tabChange('demo', '22'); //切换到：用户管理 -->
// <!-- // 				} -->
// <!-- // 			}; -->

// <!-- // 			$('.site-demo-active').on('click', function() { -->
// <!-- // 				var othis = $(this), type = othis.data('type'); -->
// <!-- // 				active[type] ? active[type].call(this, othis) : ''; -->
// <!-- // 			}); -->
// <!-- // 		}); -->
<!-- 	</script> -->
	

</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.order.entity.*"%>
<%@ page isELIgnored="false" %>
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
		.div1{ margin-left:600px; width:400px; height:100px; border:1px } 
		.div2{ margin-left:700px; width:800px; height:100px; border:1px }
		.div3{ margin-left:200px; width:400px; height:100px; border:1px}
	</style> 
	<script type="text/javascript">
	$(function() {
		 $("#addAddress").click(function(){
			   var that = this; 
			      
			      layer.open({
			        type: 2 
			        ,title: '添加地址'
			        ,area: ['400px', '400px']
			        ,shade: 0
			        ,maxmin: true
			        ,content: '/agile/foreground/address.jsp'
			        ,yes: function(){
			          $(that).click(); 
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex 
			        ,success: function(layero){
			          layer.setTop(layero); 
			        }
			      });
		 });
		 $("#modifyPassword").click(function(){
				
				   var that = this; 
				      
				      layer.open({
				        type: 2 
				        ,title: '修改密码'
				        ,area: ['340px', '260px']
				        ,shade: 0
				        ,maxmin: true
				        ,content: '/agile/foreground/password.jsp'
				        ,yes: function(){
				          $(that).click(); 
				        }
				        ,btn2: function(){
				          layer.closeAll();
				        }
				        
				        ,zIndex: layer.zIndex 
				        ,success: function(layero){
				          layer.setTop(layero); 
				        }
				      });
			 });
		 $("#edit").click(function(){
			 $("#phone").attr("readonly",false);
			 $("#status").attr("readonly",false);
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
						<label style="margin-right: 10px"><a href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></label>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/customer/logout.action">退出登录</a></label>
						<button class="layui-btn" type="button" name="modifyPassword" id="modifyPassword"
		                        style="font-size:15px;background-color:black;color: #35BB34;outline: none">修改密码</button> 		
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="layui-col-xs12" style=" text-align: center">
			<ul class="layui-nav nav">
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/home.jsp">网站首页</a></li>
				<li class="layui-nav-item"><a
					href="<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0">特色美食</a></li>
				<c:if test="${customer != null }">
					<li class="layui-nav-item layui-this"><a href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></li>
				</c:if>
				<li class="layui-nav-item "><a
					href="<%=request.getContextPath()%>/foreground/about.jsp">关于我们</a></li>
			</ul>
			<br><br>
		</div>
	</div>
	 
    <form class="layui-form" method="post" action="<%=request.getContextPath() %>/foreground/customer/updateCustomer.action">
	<div class="div3" id="o-box-down"  style="table-layout:fixed;">
	    <div class="layui-form-item layui-form-text"><label><font color="#ffA500" size="5" >个人信息</font></label></div>
		<div class="layui-form-item layui-form-text">
	        <label for="customerId" class="form-label"><font color="#ffA500" size="5" >客户编号：</font></label>
	        <input type="text" name="customerId" maxlength="100" id="customerId" class="i-text" readonly="true" style="height:25px;font-size:20px"
	              value="<%=((Customer)(request.getSession().getAttribute("customer"))).getCustomerId()%>">
	        
	    </div>
	    <div class="layui-form-item layui-form-text">
	        <label for="phone" class="form-label"><font color="#ffA500" size="5" >电话号码：</font></label>
	        <input type="text" name="phone" maxlength="100" id="phone" class="i-text" readonly="true" style="height:25px;font-size:20px"
	              value="<%=((Customer)(request.getSession().getAttribute("customer"))).getPhone()%>">
	     
	    </div>

<!-- 	    <div class="layui-form-item layui-form-text"> -->
<!-- 	        <label for="status" class="form-label"><font color="#ffA500" size="5" >订单状态：</font></label> -->
<!-- 	        <input type="text" name="status" maxlength="100" id="status" class="i-text" readonly="true" style="height:25px;font-size:20px" -->
<%-- 	            value="<%=((Customer)(request.getSession().getAttribute("customer"))).getStatus()%>"> --%>
	        
<!-- 	    </div> -->
<!-- 	    <div> -->
<!-- 	        <button type="button" id="edit" class="layui-btn" style="background-color:black"><font color="#ffA500" size="4" >编辑</font></button> -->
<!-- 	        <button type="submit" id="modify" class="layui-btn" style="background-color:black"><font color="#ffA500" size="4" >修改</font></button> -->
<!-- 	    </div> -->
    </div>
    </form>
    
    <div class="div2">
		<input class="layui-btn" type="submit" name="showAddress" id="showAddress" 
		style="font-size:20px;background-color:black;color:#ffA500;outline: none" value="收货地址">	
		<div style=" text-align: center">
		    <table class="layui-table" style=" text-align: center">
		    <tr>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >地址编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >客户编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >地址</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >电话号码</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >收件人姓名</font></th>
		        <th style=" text-align: center"></th>
		    </tr>
			<c:forEach items="${addressList}" var="address">
					    <tr>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getAddressId()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getCustomerId()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getAddress()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getPhone()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getReceiverName()}</font></td>
					        <td style=" text-align: center"><a href="#" onclick="window.confirm('是否删除？')?this.href=
					               '<%=request.getContextPath()%>/foreground/customer/delAddressByaddressId.action?addressId=${address.getAddressId()}'
					               :this.href='javascript:void()';"><i class="layui-icon layui-icon-delete"></i></a></td>  
					    </tr>
		     </c:forEach>
		     </table>
	     </div>
	     <div class="layui-form-item layui-form-text" style="margon-left:350px">
	        <button class="layui-btn" type="button" name="addAddress" id="addAddress" style="
	        font-size:20px;background-color:black;color:#ffA500;outline: none">添加收货地址</button> 
	    </div>
	</div>
    
	    
<!-- 	    <div class="layui-input-inline uploadHeadImage"> -->
<!-- 	        <label id="headImg" ><font color="#ffA500" size="5" >个人头像</font></label> -->
<!-- 	        <div class="layui-upload-drag" style="margin-top:20px" id="headImg"> -->
<!-- 	            <i class="layui-icon"></i> -->
<!-- 	            <p>点击上传图片，或将图片拖拽到此处</p> -->
<!-- 	        </div> -->
<!-- 	    </div> -->
<!-- 		<div class="layui-input-inline"> -->
<!-- 		    <div class="layui-upload-list"> -->
<!-- 		         <img class="layui-upload-img headImage" src="" id="headImg1"> -->
<!-- 		         <p id="demoText"></p> -->
<!-- 		    </div> -->
<!-- 		</div> -->
<!--     </div> -->
            
<%-- 		<%}else if(((Customer)(session.getAttribute("customer"))).getHeadImg()!=null){%> --%>
<!-- 		    <div class="layui-upload"> -->
<!-- 			   <label class="layui-btn" id="headImg" style="background-color:black"><font color="#ffA500" size="5" >个人头像</font></label> -->
<!-- 	        </div>    -->
<!-- 			<div> -->
<!-- 				<img alt="" src="" id="headImg" width="180px" height="200px" style="margin-top:20px"> -->
<!-- 			</div> -->
<%-- 		<%} %> --%>
</body>
</html>

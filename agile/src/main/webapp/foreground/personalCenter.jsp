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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/bootstrap.css">
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="application/javascript"
	src="<%=request.getContextPath()%>/layui/layui.all.js"></script>
<script type="text/javascript" 
    src="<%=request.getContextPath()%>/layui/jquery-3.4.1.js"></script>
<script type="text/javascript" 
    src="<%=request.getContextPath()%>/foreground/js/bootstrap-table.js"></script>
	<style> 
		body{ text-align:center} 
		.div1{ margin-left:600px; width:400px; height:100px; border:1px } 
		.div2{ margin-left:500px; width:800px; height:100px; border:1px }
		.div3{ margin-left:150px; width:200px; height:100px; border:1px}
	</style> 
	<script type="text/javascript">
	$(function() {
		 $("#addAddress").click(function(){
			   var that = this; 
			      
			      layer.open({
			        type: 2 
			        ,title: '添加地址'
			        ,area: ['400px', '350px']
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
				        ,area: ['340px', '300px']
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
		 $("#modify").click(function(){
			 $.ajax({
		  		  url:"/agile/foreground/customer/updatePhone/"+$("#customerId").val()+"/"+$("#phone").val(),
		  		  success:function(data){	
		  			var obj = JSON.parse(data);
		  			if(obj.result == 1){
		  				$("#phone").attr("value",$("#phone").val());
		  				layer.msg('修改成功',{time:1000});
		  			}
		  		  },
		  		  error:function(data){
		  			 layer.msg('修改失败',{time:1000});
		  		  }
		     });
		 });
	});
	function Turn(orderId){
		 var that = this; 
	      
	      layer.open({
	        type: 2 
	        ,title: '订单详情'
	        ,area: ['600px', '600px']
	        ,shade: 0
	        ,maxmin: true
	        ,content: '/agile/foreground/orderList.jsp?orderId='+orderId
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
	}
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
<!-- 						<label style="margin-right: 10px"><a -->
<%-- 						    href="<%=request.getContextPath()%>/foreground/customer/getAddressByCustomerId.action">个人中心</a></label> --%>
						<label style="margin-right: 10px"><a
							href="<%=request.getContextPath()%>/foreground/customer/logout.action">退出登录</a></label>
						<Label name="modifyPassword" id="modifyPassword"
		                        style="font-size:15px;background-color:black;color: #35BB34;outline: none">修改密码</Label> 		
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
	
	<div class="div3" id="o-box-down"  style="table-layout:fixed;">
	    <form class="layui-form" method="post" action="<%=request.getContextPath() %>/foreground/customer/updatePhone.action" style="text-align: left">
		<div>
		    <div class="layui-form-item layui-form-text" style="text-align:center"><label ><font color="#ffA500" size="5" >个人信息</font></label></div>
			<div class="layui-form-item layui-form-text">
		        <label for="customerId" class="form-label" ><font color="#ffA500" size="4" >客户编号</font></label>
		        <input class="layui-input" type="text" name="customerId" maxlength="100" id="customerId" class="i-text" readonly="true" style="height:25px;font-size:20px;width:230px;height:35px"
		              value="${customer.getCustomerId()}">
		    </div>
		    
		    <div class="layui-form-item layui-form-text">
		        <label for="phone" class="form-label"><font color="#ffA500" size="4" >电话号码</font></label>
		        <input class="layui-input" type="text" name="phone" maxlength="100" id="phone" class="i-text" readonly="true" style="height:25px;font-size:20px;width:230px;height:35px"
		              value="${customer.getPhone()}">
		    </div>
		    
		    <div>
		        <button type="button" id="edit" class="layui-btn" style="background-color:black"><font color="#ffA500" size="4" >编辑</font></button>
		        <button type="button" id="modify" class="layui-btn" style="background-color:black"><font color="#ffA500" size="4" >修改</font></button>
		    </div>
	    </div>
	    </form>
    </div>
    
    
    <div class="div2">
		<input class="layui-btn" type="submit" name="showAddress" id="showAddress" 
		style="font-size:20px;background-color:black;color:#ffA500;outline: none" value="收货地址">	
		<div style=" text-align: center">
		    <table class="layui-table" data-pagination="true" data-side-pagination="client" data-page-size="4" style=" text-align: center" id="table-address" >
		    <tr>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >地址编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >客户编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >地址</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >电话号码</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >收件人姓名</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >删除</font></th>
		    </tr>
			<c:forEach items="${addressList}" var="address">
					    <tr>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getAddressId()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getCustomerId()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getAddress()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getPhone()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${address.getRecevierName()}</font></td>
					        <td style=" text-align: center">
					           <a href="#" onclick="window.confirm('是否删除？')?
					                this.href='<%=request.getContextPath()%>/foreground/customer/delAddressByaddressId.action?addressId=${address.getAddressId()}'
					               :this.href='javascript:void()';">
					               <i class="layui-icon layui-icon-delete"></i>
					           </a>
					        </td>  
					    </tr>
		     </c:forEach>
		     </table>
		     <input class="layui-btn" type="button" name="addAddress" id="addAddress" 
		       style="font-size:20px;background-color:black;color:#ffA500;outline: none" value="添加收货地址">	
	     </div>
         <!-- 	    历史订单 -->
	    <input class="layui-btn" type="submit" name="showAddress" id="showAddress" 
		style="font-size:20px;background-color:black;color:#ffA500;outline: none" value="历史订单">	
		 <div class="layui-form-item layui-form-text" style="margon-left:350px">
	        <div style=" text-align: center">
		    <table class="layui-table" data-pagination="true" data-side-pagination="client" data-page-size="4" style=" text-align: center" id="table-order">
		    <tr>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >订单编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >总价格</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >状态</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >创建时间</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >地址编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >客户编号</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >详情</font></th>
		        <th style=" text-align: center"><font color="#ffA500" size="3" >删除</font></th>
		    </tr>
			<c:forEach items="${orderList}" var="order">
					    <tr>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${order.getOrderId()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${order.getAmountOfMoney()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${order.getStatus()}</font></td>
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${order.getCreateTime()}</font></td>
					        
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${order.getCustomerAddress().getAddressId()}</font></td> 
					        <td style=" text-align: center"><font color="#ffA500" size="3" >${order.getCustomerId()}</font></td> 
					        <td style=" text-align: center">
					           <a href="#" onclick="Turn(${order.getOrderId()})">
					               <i class="layui-icon layui-icon-menu-fill"></i>
					           </a>
					        </td>  
					        <td style=" text-align: center">
					           <a href="#" onclick="window.confirm('是否删除？')?
					                this.href='<%=request.getContextPath()%>/foreground/customer/delOrderByorderId.action?orderId=${order.getOrderId()}'
					               :this.href='javascript:void()';">
					               <i class="layui-icon layui-icon-delete"></i>
					           </a>
					        </td>  
					   </tr>
		     </c:forEach>
		     </table>
	     </div>
		
	    </div>
	</div>
</body>
</html>

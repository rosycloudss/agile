<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>选择地址</title>
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
		
</head>
<body>
<div style=" text-align: center" width:400px;">

<table class="layui-table"  >
	<tr>
		<td>选择地址</td>
	</tr>
	<br>
    <tr>
    	<td>
        <select id="address" class="layui-select" style="text-align: center;">
			<c:if test="${addressList != null }">
   				<c:forEach items="${addressList }" var="address">
		   			<option value ="${address.getAddressId()}">
		   				${address.getAddress()}
		       			${address.getPhone()}
		       			${address.getRecevierName() }
		        	</option>	 
   				</c:forEach>
   			</c:if>
		</select>
		<a href="#" id="addAddress" >
			<i class="layui-icon layui-icon-add-1" title="添加地址"></i>
		</a>
		</td> 				        			        
    </tr>
    <br>
    <tr>
        <td colspan="8" style="text-align: center;"><button class="layui-btn layui-btn-normal" onclick="pay()">支付</button></td>
    </tr>
</table>
</div>

<script type="text/javascript">

function pay() {
	
	var addressId = document.getElementById("address").options[document.getElementById("address").selectedIndex].value;
	$.ajax({
		  url:"/agile/foreground/car/pay/${customer.getCustomerId()}/"+ addressId,
		  success:function(data){	
			alert("支付成功");
			window.open("<%=request.getContextPath()%>/foreground/dish/dishDisplay.action?categoryId=0", "_self");
		  },
		  error:function(data){
			  alert("支付失败！");
		  }
	  });
}

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
});


</script>
</body>
</html>
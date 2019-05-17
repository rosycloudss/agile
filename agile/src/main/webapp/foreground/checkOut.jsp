<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>选择地址</title>
    <link rel="stylesheet"
		href="<%=request.getContextPath()%>/layui/css/layui.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/foreground/css/style.css" />
	<script type="application/javascript"
		src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/foreground/js/jquery-3.4.1.js"></script>	
		
</head>
<body>
<table class="layui-table">
	<tr><td>选择地址</td></tr>
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
		</td>  
    </tr>
    <br>
    <tr>
        <td colspan="8" style="text-align: center;"><button class="layui-btn layui-btn-normal" onclick="pay()">支付</button></td>
    </tr>
</table>
<script type="text/javascript">

function pay() {
	
	var addressId = document.getElementById("address").options[document.getElementById("address").selectedIndex].value;
	$.ajax({
		  url:"/agile/foreground/car/pay/${customer.getCustomerId()}/"+ addressId,
		  success:function(data){	
			alert("支付成功");
			var index = parent.parent.layer.getFrameIndex(parent.window.name);
			parent.parent.layer.close(index);
		  },
		  error:function(data){
			  alert("支付404");
		  }
	  });
}

</script>
</body>
</html>
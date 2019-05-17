<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
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
    <colgroup>
        <col width="150">
        <col width="200">
        <col width="150">
        <col width="100">
        <col width="100">
    </colgroup>
    <thead>
        <tr>
            <th>菜品编号</th>
            <th>菜品名称</th>
            <th>单价（元）</th>
            <th>数量</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
   	<c:if test="${carList != null }">
   		<c:forEach items="${carList }" var="car">
		   	<tr>
		        <td>${car.getDish().getDishId() }</td>
		        <td>${car.getDish().getName() }</td>
		        <td name="price">${car.getDish().getPrice() }</td>
		        <td id="" class="dishNum">
		            <button id="add" onclick="sub(${car.getCustomerId() },${car.getDish().getDishId() },${car.getDish().getPrice()})">
		                <img src="<%=request.getContextPath()%>/foreground/images/sub.png">
		            </button>
		            <span id="${car.getDish().getDishId() }">${car.getDishNum() }</span>
		            <button id="sub" onclick="add(${car.getCustomerId() },${car.getDish().getDishId() },${car.getDish().getPrice()})">
		                <img src="<%=request.getContextPath()%>/foreground/images/add.png">
		            </button>
       		 	</td>
       		 	 <td>
		            <a class="layui-btn layui-btn-danger" href="<%=request.getContextPath()%>/foreground/car/delete/${car.getCustomerId() }/${car.getDish().getDishId() }">删除</a>
		        </td>
		    </tr>
   		</c:forEach>
   	</c:if>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="2" style="text-align: center">总价：</td>
        <td id="totalPrice">${totalPrice }</td> 
        <td colspan="2" style="text-align: center;"><button class="layui-btn layui-btn-normal" onclick="checkOut()">结算</button></td>
    </tr>
    </tfoot>
</table>
<script type="text/javascript">
function sub(customerId,dishId,price){
    var dishNum = new Number($("#"+ dishId).html());
    var totalPrice = new Number($("#totalPrice").html());
    if(dishNum > 0){
    	$.ajax({
  		  url:"/agile/foreground/car/updateDishNum/"+customerId+"/"+dishId + "/" + (dishNum - 1),
  		  success:function(data){	
  			var obj = JSON.parse(data)
  			if(obj.result < 1){
  				alert("修改失败")
  			}else{
  				$("#" + dishId).html(dishNum - 1);
  		        $("#totalPrice").html(totalPrice - new Number(price));
  			}
  		  },
  		  error:function(data){
  			  alert("修改失败");
  		  }
  	  });
    	
    }
}

function add(customerId,dishId,price){
    var dishNum = new Number($("#"+ dishId).html());
    var totalPrice = new Number($("#totalPrice").html());
    $.ajax({
		  url:"/agile/foreground/car/updateDishNum/"+customerId+"/"+dishId + "/" + (dishNum + 1),
		  success:function(data){	
			var obj = JSON.parse(data)
			if(obj.result < 1){
				alert("修改失败")
			}else{
				$("#" + dishId).html(dishNum + 1);
			    $("#totalPrice").html(totalPrice + new Number(price));
			}
		  },
		  error:function(data){
			  alert("修改失败");
		  }
	  });
    
}

function updateCar(customerId,dishId,dishNum){
	
}

function checkOut(){
	 layui.use('layer', function(){
         var layer = layui.layer;
        
         layer.open({
             type: 2,
             title: '结算',
             content: ["<%=request.getContextPath()%>/foreground/car/getCheckOut/${customer.getCustomerId() }"],
             area: ['420px', '280px']
         });

     });
}


</script>
</body>
</html>
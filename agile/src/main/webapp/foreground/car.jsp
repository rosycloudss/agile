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
	<script type="application/javascript"
		src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="200">
        <col width="150">
        <col width="100">
    </colgroup>
    <thead>
        <tr>
            <th>菜品编号</th>
            <th>菜品名称</th>
            <th>单价（元）</th>
            <th>数量</th>
        </tr>
    </thead>
    <tbody>
   	<c:if test="${carList != null }">
   		<c:forEach items="${carList }" var="car">
		   	<tr>
		        <td>${car.getDish().getDishId() }</td>
		        <td>${car.getDish().getName() }</td>
		        <td>${car.getDish().getPrice() }</td>
		        <td><input class="layui-input" type="number" value="${car.getDishNum() }"></td>
		    </tr>
   		</c:forEach>
   	</c:if>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="2" style="text-align: center">总价：</td>
        <td>100</td>
        <td><button class="layui-btn layui-btn-normal">结算</button></td>
    </tr>
    </tfoot>
</table>
</body>
</html>
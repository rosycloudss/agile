<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品类别</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="tools">   
</div>
<form action="<%=request.getContextPath() %>/background/feng/dishcategory_search.action" method="post">
<div align="center">
   <label>类别编号</label><input name="categoryId" type="text"  />
   <label>类别名称</label><input name="name" type="text"  />         
       <input type="submit" class="loginbtn" value="查询" />
</div>
</form>
<div class="tools">   
</div>
<table class="tablelist">
    	<thead>
    	<tr>
        <th>类别编号</th>
        <th>类别名称</th>
        <th>类别描述</th>
        <th>管理操作</th>
        </tr>
        </thead>   
        
        <c:forEach items="${dishCategoryList}" var="dishCategoryList">        
        <tbody>
        <tr>
        <td>${dishCategoryList.categoryId}</td>         
        <td>${dishCategoryList.name}</td>
        <td>${dishCategoryList.description}</td>
        <td><a href="<%=request.getContextPath() %>/background/feng/dishcategory_delete.action?categoryId=${dishCategoryList.categoryId}">删除</a></td>
        </tr> 
        </tbody>
        </c:forEach>
        <li><label>&nbsp;</label><cite><font color="red">${msg != null ? msg : "" }</font></cite></li>
    </table>       
</body>
</html>
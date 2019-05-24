<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath() %>/background/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/background/js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".detail").click(function(){
	  $.ajax({url:"/agile/background/manage/orderdetail.action?id="+$(this).attr("id"),async:true,success:function(result){
		  var obj = JSON.parse(result);
		  var s='<tbody align="center">';
		  for(i=0;i<obj.length;i++){
			  s+='<tr style="padding:15px"><td>'+obj[i].name+"</td><td>"+obj[i].number+"</td><td>"+obj[i].singlePrice+"</td><td>"+obj[i].singlePrice*obj[i].number+"</td></tr>";
		  }
		  s+="</tbody>"
		  $("#detailtable tbody").remove();
		  $("#detailtable").append(s);
	    }});
	  $("#detailform").fadeIn(200);
  });
  
  $(".detailinfo").click(function(){
	  $.ajax({url:"/agile/background/manage/orderdetail.action?id="+$(this).attr("id"),async:true,success:function(result){
		  var obj = JSON.parse(result);
		  var s='<tbody align="center">';
		  for(i=0;i<obj.length;i++){
			  s+='<tr><td>'+obj[i].name+"</td><td>"+obj[i].number+"</td><td>"+obj[i].singlePrice+"元</td><td>"+obj[i].singlePrice*obj[i].number+"元</td></tr>";
		  }
		  s+="</tbody>"
		  $("#detailtable tbody").remove();
		  $("#detailtable").append(s);
	    }});
	  $("#detailform").fadeIn(200);
  });

  $(".editformtop a").click(function(){
	  $("#detailform").fadeOut(200);
  });
  
  $("#submit").click(function(){
	  $("#detailform").fadeOut(100);
  });
  
  var orderid;
  
  $(".updateorder").click(function(){
		 orderid=$(this).attr("id")
		  $("#updatetip").fadeIn(200);
	  });
  
  $("#updatetop a").click(function(){
	  $("#deletetip").fadeOut(200);
  });
  
  $("#sure").click(function(){
	  $.ajax({url:"/agile/background/manage/updateorder.action?id="+orderid,async:true,success:function(result){
	    	var obj = JSON.parse(result);
	    	if(obj.status=="true") 	alert("接单成功！");
	    	else   alert("接单失败！");
	  	  	$("#editform").fadeOut(200);
	  	  	window.location.reload();  /* 刷新当前页面 */
	    }});
	  $("#updatetip").fadeOut(100);
  });

  $(".cancel").click(function(){
	  $("#tip").fadeOut(100);
  });

});
</script>
</head>

<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">销售订单列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">    
    
     <div class="tools">  
	 <form action="<%=request.getContextPath() %>/background/manage/ordersearch.action" method="post">
		<div align="right">
		   <label>订单编号：</label><input name="orderId" type="text"  class="dfinput2" />       
		   <input type="submit" class="loginbtn" value="查询" />
		</div>
	 </form> 
	 </div>
	 </div>
    
    <table class="imgtable">
    
    <thead>
    <tr>
    <th width="100px;">订单编号</th>
    <th>总价</th>
    <th>状态</th>
    <th>创建时间</th>
    <th>地址</th>
    <th>付款人</th>
    <th>管理操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${list}" var="order">
    	<tr>
	    <td style="padding:15px"><a href="javaScript:" class="detail" id="${order.orderId }">${order.orderId }</a></td>
	    <td>${order.amountOfMoney}元</td>
	    
	    <c:if test="${order.status == 0}">		        
	    	<td><a href="javaScript:" class="updateorder" id="${order.orderId }">未接单</a></td>	
		</c:if>
		
		<c:if test="${order.status == 1}">		        
	    	<td>已接单</td>	
		</c:if>
		
	    <td><fmt:formatDate value="${order.createTime}" timeZone="GMT+8" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    <td>${order.customerAddress.address}</td>
	    <td>${order.customerAddress.recevierName}</td>
	    <td><a href="javaScript:" class="detailinfo" id="${order.orderId }">查看详细信息</a></td>
	    </tr>
    </c:forEach>
    </tbody>
    
    </table>
    
    <div class="xline"></div>
    
   	<div class="pagin">
    	<div class="message">共<i class="blue">${pageItem.totalRecord}</i>条记录，当前显示第&nbsp;<i class="blue">${pageItem.pageCurrent }&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <c:forEach var="i" begin="1" end="${pageItem.totalPage}" step="1">
        <li class="paginItem"><a href="javaScript:">${i}</a></li>
        </c:forEach>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>   
    
    <div class="editform" id="detailform">
		<div class="editformtop"><span>订单详细信息</span><a></a></div>
		<div class="editforminfo">
			<div class="editformright">
			<div class="formtitle"><span>订购菜品信息</span></div>
			<table align="center" class="imgtable" id="detailtable">
		    <thead>
		    <tr>
		    <th width="200px;">菜品名称</th>
		    <th width="200px;">订购数量</th>
		    <th width="200px;">菜品单价</th>
		    <th width="200px;">总计</th>
		    </tr>
		    </thead>		    
		    </table>
			</div>
		 </div>
    </div> 
    <div class="tip" id="updatetip">
	    <div class="tiptop" id="updatetop"><span>提示信息</span><a></a></div>
	      <div class="tipinfo">
	        <span><img src="<%=request.getContextPath() %>/background/images/ticon.png" /></span>
	        <div class="tipright">
	        <p>是否接单 ？</p>
	        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
	        </div>
	       </div>
	       <div class="tipbtn">
	        <input name="" type="button"  class="sure" id="sure" value="确定" />&nbsp;
	        <input name="" type="button"  class="cancel" value="取消" />
	       </div>
	 </div>


    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
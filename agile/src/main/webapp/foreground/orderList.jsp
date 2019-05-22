<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.order.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>订单详情</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/font.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/xadmin.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/foreground/css/style.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/layui/layui.all.js"></script>
<script type="text/javascript" 
    src="<%=request.getContextPath()%>/layui/jquery-3.4.1.js"></script>
<script type="text/javascript" 
    src="<%=request.getContextPath()%>/layui/js/xadmin.js"></script>
<script type="text/javascript" 
    src="<%=request.getContextPath()%>/layui/js/cookie.js"></script>
</head>
<body>
<script>

</script>
        <div class="x-body">
             <form class="layui-form">    
                 <div style="margin-left:280px"><p><font color="#ffA500" size="4" >地址信息</font></p></div>      
                 <div style=" text-align: center">
				    <table class="layui-table" style=" text-align: center" id="table">
				    <tr>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >客户编号</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >地址</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >电话号码</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >收件人姓名</font></th>
				    </tr>
				    <tbody id="tbody1">
				    
				    </tbody>
				    </table>
			     </div>
                 <div style="margin-left:280px"><p><font color="#ffA500" size="4" >订单信息</font></p></div>
                 <div style=" text-align: center">
				    <table class="layui-table" style=" text-align: center" id="table">
				    <tr>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >名称</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >单价</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >数量</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >总价</font></th>
				    </tr>
				    <tbody id="tbody2">
				    
				    </tbody>
				    </table>
			    </div>
          </form>
        </div>
        <script>
       
        $(function(){
        	 var str = document.URL;
             var num = str.indexOf("=");
             var orderId = str.substr(num+1);
        		 $.ajax({
        	  		  url:"/agile/foreground/customer/getOrderAndAddress/" + orderId,
        	  		  success:function(data){	
        	  			var obj = JSON.parse(data);
        	  			var totalPrice = obj.totalPrice;
        	  			var address = obj.address;
        	  			var orderDetailList = obj.orderDetailList;
        	  			
        	  			
        	  			var addressData;
        	  			addressData+="<tr>"+
    	  				'<td style=" text-align: center"><font color="#ffA500" size="3" >'+address.customerId+'</font></td>'+
	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+address.address+'</font></td>'+
	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+address.phone+'</font></td>'+
	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+address.recevierName+'</font></td>'+
	  					"</tr>";
	  					$("#tbody1").html(addressData);
	  					
        	  			var tableData;
        	  			for(var i=0;i<orderDetailList.length;i++){
        	  				if(i < orderDetailList.length-1)
	        	  				tableData+="<tr>"+
	        	  				'<td style=" text-align: center"><font color="#ffA500" size="3" >'+orderDetailList[i].name+'</font></td>'+
	    	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+orderDetailList[i].singlePrice+'</font></td>'+
	    	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+orderDetailList[i].number+'</font></td>'+
	    	  					"</tr>";
	    	  				else if(i == orderDetailList.length-1){
	    	  					tableData+="<tr>"+
	        	  				'<td style=" text-align: center"><font color="#ffA500" size="3" >'+orderDetailList[i].name+'</font></td>'+
	    	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+orderDetailList[i].singlePrice+'</font></td>'+
	    	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+orderDetailList[i].number+'</font></td>'+
	    	  					'<td style=" text-align: center"><font color="#ffA500" size="3" >'+totalPrice+'</font></td>'+
	    	  					"</tr>";
	    	  				}	
        	  				$("#tbody2").html(tableData);
        	  			}
        	  		  },
        	  		  error:function(){
        	  			alert("error");
        	  		  }
        	     });
        });
            
    </script>
</body>
</html>
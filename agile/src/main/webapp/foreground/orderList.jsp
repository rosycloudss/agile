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
                  <div style="margin-left:150px"><p><font color="#ffA500" size="4" >地址信息</font></p></div>      
                  <div class="layui-form-item">
                      <label for="customerId" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >客户编号</font>
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="customerId" name="customerId" 
                          autocomplete="off" class="layui-input" readonly="true" >
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="address" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >地址</font>
                      </label>
                      <div class="layui-input-inline">
                          <textarea rows="3" cols="20" id="address" name="address" 
                          autocomplete="off" class="layui-input" readonly="true"></textarea>
                      </div>
                  </div>
                 <div class="layui-form-item">
                     <label for="phone" class="layui-form-label">
                         <span class="x-red">*</span><font color="#ffA500" size="4" >电话号码</font>
                     </label>
                     <div class="layui-input-inline">
                         <input type="text" id="phone" name="phone" 
                                autocomplete="off" class="layui-input" readonly="true">
                     </div>
                 </div>
                 <div class="layui-form-item">
                     <label for="recevierName" class="layui-form-label">
                         <span class="x-red">*</span><font color="#ffA500" size="4" >收货人姓名</font>
                     </label>
                     <div class="layui-input-inline">
                         <input type="text" id="recevierName" name="recevierName" 
                                autocomplete="off" class="layui-input" readonly="true">
                     </div>
                 </div>
                 <div style="margin-left:150px"><p><font color="#ffA500" size="4" >订单信息</font></p></div>
                 <div style=" text-align: center">
				    <table class="layui-table" style=" text-align: center" id="table">
				    <tr>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >名称</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >单价</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >数量</font></th>
				        <th style=" text-align: center"><font color="#ffA500" size="3" >总价</font></th>
				    </tr>
				    <tbody id="tbody">
				    
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
        	  			
        	  			
        	  			document.getElementById("customerId").value = address.customerId;
        	  			document.getElementById("address").value = address.address;
        	  			document.getElementById("phone").value = address.phone;
        	  			document.getElementById("recevierName").value = address.recevierName;
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
        	  				$("#tbody").html(tableData);
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
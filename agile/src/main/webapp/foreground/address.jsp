<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.order.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加地址</title>
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
                  <div class="layui-form-item">
                      <label for="customerId" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >客户编号</font>
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="customerId" name="customerId" required="" lay-verify="customerId"
                          autocomplete="off" class="layui-input" readonly="true" value="<%=((Customer)(request.getSession().getAttribute("customer"))).getCustomerId()%>">
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="address" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >地址</font>
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="address" name="address" required="" lay-verify="address"
                          autocomplete="off" class="layui-input">
                      </div>
                  </div>
                 <div class="layui-form-item">
                     <label for="phone" class="layui-form-label">
                         <span class="x-red">*</span><font color="#ffA500" size="4" >电话号码</font>
                     </label>
                     <div class="layui-input-inline">
                         <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                                autocomplete="off" class="layui-input">
                     </div>
                 </div>
                 <div class="layui-form-item">
                     <label for="recevierName" class="layui-form-label">
                         <span class="x-red">*</span><font color="#ffA500" size="4" >收货人姓名</font>
                     </label>
                     <div class="layui-input-inline">
                         <input type="text" id="recevierName" name="recevierName" required="" lay-verify="recevierName"
                                autocomplete="off" class="layui-input">
                     </div>
                 </div>
                 <div class="layui-form-item">
                     <label class="layui-form-label"></label>
                     <button id="add" type="button" class="layui-btn" lay-filter="add" lay-submit="">增加</button>
                 </div>
          </form>
        </div>
        <script>
        $(function(){
        	$("#add").click(function(){
        		var customerId=$("#customerId").val();
        		var address=$("#address").val();
        		var phone=$("#phone").val();
        		var receiverName=$("#recevierName").val();
        		 $.ajax({
        	  		  url:"/agile/foreground/customer/insertAddress/"+customerId+"/"+address+"/"+phone+"/"+receiverName,  
        	  		  success:function(data){	
        	  			var obj = JSON.parse(data);
        	  			if(obj.result==1){
        	  				layer.msg('添加成功',{time:1000});
        	  				window.parent.location.reload();
        	  				window.parent.layer.closeAll();
        	  			}
        	  		  },
        	  		  error:function(data){
        	  			layer.msg('添加失败',{time:1000});
        	  		  }
        	     });
        	 });
        });
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
                var form = layui.form,layer = layui.layer;

                //自定义验证规则
                form.verify({
                	customerId: function(value){
                        if(value === '' || value === null){
                            return '客户编号不能为空';
                        }
                    }
                    ,address: function(value){
                        if(value === '' || value === null){
                            return '地址不能为空';
                        }
                    }
                    ,phone: function(value){
                        if(value === '' || value === null){
                            return '电话号码不能为空';
                        }
                    }
                    ,recevierName: function(value){
                        if(value === '' || value === null){
                            return '收件人姓名不能为空';
                        }
                    }
                });
            });
    </script>
</body>
</html>
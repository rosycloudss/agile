<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.order.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
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
        <div class="x-body">
             <br>
             <form class="layui-form">
                  <div class="layui-form-item">
                      <label for="oldPassword" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >旧密码</font>
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="oldPassword" name="oldPassword" required="" lay-verify="oldPassword"
                          autocomplete="off" class="layui-input">
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="newPassword" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >新密码</font>
                      </label>
                      <div class="layui-input-inline">
                          <input type="password" id="newPassword" name="newPassword" required="" lay-verify="newPassword"
                          autocomplete="off" class="layui-input"  >
                      </div>
                  </div>
                  <div class="layui-form-item">
                      <label for="repeatPassword" class="layui-form-label">
                          <span class="x-red">*</span><font color="#ffA500" size="4" >确认密码</font>
                      </label>
                      <div class="layui-input-inline">
                          <input type="password" id="repeatPassword" name="repeatPassword" required="" lay-verify="repeatPassword"
                          autocomplete="off" class="layui-input">
                      </div>
                  </div>
                 
                 <div class="layui-form-item">
                     <label class="layui-form-label"></label>
                     <button id="modify" type="button" class="layui-btn" lay-filter="modify" lay-submit="">确认修改</button>
                 </div>
          </form>
        </div>
        <script>
        $(function(){
        	$("#modify").click(function(){
        		var oldPassword=$("#oldPassword").val();
        		var newPassword=$("#newPassword").val();
        		var repeatPassword=$("#repeatPassword").val();
        		 $.ajax({
        	  		  url:"/agile/foreground/customer/updatePassword/"+oldPassword+"/"+newPassword+"/"+repeatPassword,  
        	  		  success:function(data){	
        	  			var obj = JSON.parse(data);
        	  			if(obj.result==1){
        	  				alert("修改成功");
        	  				window.parent.layer.closeAll();
        	  			}else if(obj.msg1 != null){
        	  				layer.msg(obj.msg1,{time:1000});
        	  				return false;
        	  			}else if(obj.msg2 != null){
        	  				layer.msg(obj.msg2,{time:1000});
        	  				return false;
        	  			}
        	  		  },
        	  		  error:function(data){
        	  			  alert("修改失败");
        	  		  }
        	     });
        	 });
        });
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form,layer = layui.layer;

            //自定义验证规则
            form.verify({
            	oldPassword: function(value){
                    if(value === '' || value === null){
                        return '旧密码不能为空';
                    }
                }
                ,newPassword: function(value){
                    if(value === '' || value === null){
                        return '新密码不能为空';
                    }
                }
                ,repeatPassword: function(value){
                    if(value === '' || value === null){
                        return '确认密码不能为空';
                    }
                    if(value != $("#repeatPassword").val()){
                        return '两次密码输入不一致';
                    }
                }
            });		
        });
    </script>
</body>
</html>
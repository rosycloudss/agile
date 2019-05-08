<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">图片列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=request.getContextPath() %>/background/images/t01.png" /></span>添加</li>
        <li class="click"><span><img src="<%=request.getContextPath() %>/background/images/t02.png" /></span>修改</li>
        <li><span><img src="<%=request.getContextPath() %>/background/images/t03.png" /></span>删除</li>
        <li><span><img src="<%=request.getContextPath() %>/background/images/t04.png" /></span>统计</li>
        </ul>
        
        <ul class="toolbar1">
        <li><span><img src="<%=request.getContextPath() %>/background/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    <table class="imgtable">
    
    <thead>
    <tr>
    <th width="100px;">缩略图</th>
    <th>编号</th>
    <th>类别</th>
    <th>名称</th>
    <th>描述</th>
    <th>剩余份数</th>
    <th>价格</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${dishList}" var="dish">
    	<tr>
	    <td class="imgtd"><img width="90" src="<%=request.getContextPath() %>/background/images/2.jpg" /></td>
	    <td><a href="#">${dish.dishId}</a></td>
	    <td>${dish.categoryId }</td>
	    <td>${dish.name}</td>
	    <td>${dish.description}</td>
	    <td>${dish.leftNum}</td>
	    <td>${dish.price}</td>
	    </tr>
    </c:forEach>
    </tbody>
    
    </table>
    
    <div class="pagin">
    	<div class="message">共<i class="blue">${requestScope.dishList.size()}</i>条记录，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem current"><a href="javascript:;">1</a></li>
        <li class="paginItem"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    </div>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
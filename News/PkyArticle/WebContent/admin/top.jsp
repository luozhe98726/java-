<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.net.InetAddress"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script>
function startTime(){
	var today=new Date();
	var y=today.getYear();
	var M=today.getMonth()+1;
	var d=today.getDate();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();// 在小于10的数字前加一个‘0’
	
	m=checkTime(m);
	s=checkTime(s);
	
	document.getElementById('txt').innerHTML=(1900+y)+"年"+M+"月"+d+"日"+"  "+ h+":"+m+":"+s;
	t=setTimeout(function(){startTime()},500);
}
function checkTime(i){
	if (i<10){
		i="0" + i;
	}
	return i;
}
</script> 
		<style type="text/css">
		
			img{
				margin-top:5px;
				width:50px; height:50px; border-radius:50%;
			}
			#sp{
				font-size:15px;
				margin-left:10px;
			}
		</style>
</head>
<body  onload="startTime()">
	<%
	InetAddress address = InetAddress.getLocalHost();  
	String ip=address .getHostAddress().toString();  
	pageContext.setAttribute("ip",ip);
	%>
	
<div class="nav-top">
	<span><a><img alt=""  src="../images/tou.jpg"></a></span>
	<span id="sp">您好：${a_username}</span>
	<span>新闻后台管理系统</span>
    <div class="nav-topright" >
      <span><a href="../index.jsp" target="_top" style="color:white">首页</a></span>
        <span><a href="${pageContext.request.contextPath}/AdminServlet?method=logOut" target="_top" style="color:white">注销</a></span>
    
   		 <span>当前时间：</span>
    	<span id="txt"></span>
    	<span>登陆IP：${ip}</span>
    	
        
      
    </div>
</div>
		
</body>
</html>
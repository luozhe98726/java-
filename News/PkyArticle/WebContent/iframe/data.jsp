<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>个人资料</title>

<link rel="stylesheet" type="text/css" href="statics/css/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			form{
				margin-top:50px;
			}
		</style>
</head>
<body>
		<form id="fem" action="${pageContext.request.contextPath}/user?method=selUserbyId" method="post" >
								
		</form>
		
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-striped table-condensed table-hover">
				
				<tbody>
						
				<tr>
					<th>用户名：</th>
					<td>邮箱：</td>
					<td>真实姓名：</td>
					<td>年龄:</td>
					<td>性别：</td>
					<td>注册日期：</td>
					<td>密保问题：</td>

				</tr>
				<tr>
					<td>${user.u_username }</td>
					<td>${user.u_email }</td>
					<td>${user.u_realName }</td>
					<td>${user.u_age }</td>
					<td>${user.u_sex }</td>
					<td>${user.u_reDate }</td>
					<td>${user.u_problem }</td>
				
				
				</tr>

				
				</tbody>
			</table>
		</div>
	</div>
</div>
		
		
		
		
<!-- 		<div class="text-center"> -->
<%-- 			<div>用户名：${user.u_username }</div> --%>
<%-- 			<div>邮箱：${user.u_email }</div> --%>
<%-- 			<div>真实姓名：${user.u_realName }</div> --%>
<%-- 			<div>年龄:${user.u_age }</div> --%>
<%-- 			<div>性别：${user.u_sex }</div> --%>
<%-- 			<div>注册日期：${user.u_reDate }</div> --%>
<%-- 			<div>密保问题：${user.u_problem }</div> --%>
<%-- <%-- 			<div>注册日期：${user.u_answer }</div> --%> 
<!-- 		</div> -->
	<script type="text/javascript"> 
	  	 	$(document).ready(function(){		  	
	  			$("#fem").submit();  
   			});		 
	  	</script>
</body>
</html>
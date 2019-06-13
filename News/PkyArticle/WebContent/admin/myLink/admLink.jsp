<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理友情链接</title>
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
   		 <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
   		 <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
		<form id="fem" action="${pageContext.request.contextPath}/LinkServlet?method=selLink" method="post">
		
		</form>
		
				<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
					<th>ID</th>
					<th>名称</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
						<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.l_id}</td>
					<td>${list.l_name}</td>
					<td>${list.l_address}</td>
					<td>
						<a href="${pageContext.request.contextPath}/LinkServlet?method=deLink&&l_id=${list.l_id}">删除</a>
						<a href="${pageContext.request.contextPath}/LinkServlet?method=&&l_id=${list.l_id}">显示</a>
						<a href="${pageContext.request.contextPath}/LinkServlet?method=selLinkById&&l_id=${list.l_id}">修改</a>
					</td>
					
				</tr>
				</c:forEach>

				
				</tbody>
			</table>
		</div>
	</div>
</div>
		
		
		<script type="text/javascript"> 
	  	 	$(document).ready(function(){		  	
	  			$("#fem").submit();  
   	});		  	 	
	</script>
</body>
</html>
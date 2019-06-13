<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>新闻栏目管理</title>	  
 	  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
    	body > table{
			margin:0 auto;
			
		}
		body > table tr th{
			color:red;
			padding-left:50px;
			padding-right:50px;
			
		}
		body > table tr td{
			text-align: center;
		}
		a{
			
			margin-left:10px;
		}
    </style>
</head>
<body>
		
		<form id="fem" action="${pageContext.request.contextPath}/NewsServlet?method=selcfNews" method="post">
<!-- 			<button>提交</button> -->
		</form>	
		
				<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>栏目名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.f_id }</td>
							<td>${list.f_name }</td>
							<td><a href="${pageContext.request.contextPath}/NewsServlet?method=declnews&&f_id=${list.f_id }" >删除</a> </td>
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
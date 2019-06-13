<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>新闻稿件管理</title>	  
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
		
		<form id="fem" action="${pageContext.request.contextPath}/UploadServlet?method=selAllFile" method="post">
<!-- 			<button>提交</button> -->
		</form>	
		
				<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>投稿人</th>
						<th>稿件名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.pf_id }</td>
							<td>${list.u_username }</td>
							<td>${list.pf_name }</td>
							<td><a href="${pageContext.request.contextPath}/DownServlet?method=selFile&&pf_id=${list.pf_id }" >下载</a> </td>
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
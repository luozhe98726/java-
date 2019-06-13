<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户收藏的新闻</title>
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
<form id="fem" action="${pageContext.request.contextPath}/NewsServlet?method=selColl&pp=1" method="post" >
								
</form>
	<div class="main w1200">
		<div class="right">
				<div class="tap">
					
				</div>
				<div class="container">
					<div class="no-doc text-center" >
					<c:forEach items="${list }" var="li"> 
						<h4><a href="${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId=${li.p_newsId}" target="_top">${li.p_newsTitle }</a></h4>
						</c:forEach>
					</div>
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
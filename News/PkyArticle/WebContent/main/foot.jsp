<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
		
		<form id="fem" action="${pageContext.request.contextPath}/LinkServlet?method=selLink2" method="post">
		
		</form>
		<div class="row clearfix">
						<div class="col-md-12 column">
							<ul class="list-unstyled list-inline">
								<c:forEach items="${list }" var="list"> 
								<li>
									${list.l_name}
								</li>
								</c:forEach>
							</ul>
						</div>
		</div>
					
			<script type="text/javascript"> 
	  	 	$(document).ready(function(){		  	
	  			$("#fem").submit();  
   			});		  	 	
			</script>
</body>
</html>
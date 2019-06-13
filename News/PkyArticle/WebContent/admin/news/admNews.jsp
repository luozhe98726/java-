<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style type="text/css">
    	
		#a1{
		margin-left:350px;
		
		}
		#for{
			margin-top:10px;
			margin-left:420px;
		}
	
    </style>
</head>
<body>
		<form id="fem" action="${pageContext.request.contextPath}/PageServlet?method=selNewsPa" method="post">
			
		</form>
		
			<div class="container">
	<div class="row clearfix">
		<div class="col-lg-12 column">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>标题</th>
						<th>新闻栏目</th>
						<th>作者</th>
						<th>关键字</th>
						<th>编稿时间</th>
						<th>点击率</th>
						<th>修改</th>
						<th>删除</th>
						<th>发布</th>
						<th>下架</th>
						<th>选择</th>
					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pi.pageList}" var="pi">
					<tr>
						<td>${pi.p_newsId}</td>
						<td>${pi.p_newsTitle}</td>
						<td>${pi.f_name}</td>
						<td>${pi.p_newsAu}</td>
						<td>${pi.p_newsK}</td>
						<td >${pi.p_addTime}</td>
						<td>${pi.p_click}</td>
						<td><a href="${pageContext.request.contextPath}/NewsServlet?method=selNewsById&&p_newsId=${pi.p_newsId}">修改</a></td>
						<td><a href="${pageContext.request.contextPath}/NewsServlet?method=deNewsById&&p_newsId=${pi.p_newsId}">删除</a></td>
						<td><a href="${pageContext.request.contextPath}/NewsServlet?method=upNewsPo&&p_newsId=${pi.p_newsId}">发布</a></td>
						<td><a href="${pageContext.request.contextPath}/NewsServlet?method=upNewsPo2&&p_newsId=${pi.p_newsId}">下架</a></td>
						<td><input type="checkbox"></td>
					
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</div>
		
		
			<br>
<!-- 				返回第一页 -->	
				<a id="a1" href="${pageContext.request.contextPath}/PageServlet?method=selNewsPa&pageNum=${1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum<=1 }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/first.gif">
				</a>
				<a href="${pageContext.request.contextPath}/PageServlet?method=selNewsPa&pageNum=${pi.pageNum-1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum<=1 }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/pre.gif">
				</a>
				
				共计${pi.pageLine } 条记录，当前是第${pi.pageNum} 页
				
				<a href="${pageContext.request.contextPath}/PageServlet?method=selNewsPa&pageNum=${pi.pageNum+1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum>=pi.pageToel }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/next.gif">
				</a>
				
<!-- 				表示最后一页 -->
				<a href="${pageContext.request.contextPath}/PageServlet?method=selNewsPa&pageNum=${pi.pageToel }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum>=pi.pageToel }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/last.gif">
				</a>
				
<!-- 				选择当前的页数 -->
				<form id="for" action="${pageContext.request.contextPath}/PageServlet?method=selNewsPa&pageSize=${pi.pageSize}" method="post">
				
					<div class="row clearfix">
						<div class="col-md-12 column">
							第<input id="in" name="pageNum" type="number" size="2" step="1" max="${pi.pageToel }" min="1" />页
							 <button type="button" class="btn btn-sm">按钮</button>
						</div>
	</div>
				</form>
				
		<script type="text/javascript"> 
	  	 	$(document).ready(function(){		  	
	  			$("#fem").submit();  
   		});		 	  	 	
	</script>
</body>
</html>
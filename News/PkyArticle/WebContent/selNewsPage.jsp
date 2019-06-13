<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>分页显示用户搜索的新闻</title>
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
		<form id="fem" action="${pageContext.request.contextPath}/PageServlet?method=selNewsByName" method="post">
			
		</form>
		
		
		
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-inverse" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.jsp">首页</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="login.jsp">登录</a>
						</li>
						<li>
							 <a href="register.jsp">注册</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">One more separated link</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/PageServlet?method=selNewsByName" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="p_newsTitle" />
						</div> <button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="admin/adminLogin.jsp" target="_blank">管理员登录</a>
						</li>
						<li>
							 <a href="${pageContext.request.contextPath}/user?method=exit" >退出登录</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">Another action</a>
								</li>
								<li>
									 <a href="#">Something else here</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">Separated link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
	
			</nav>

			
			
			
			
			<div class="container">
	<div class="row clearfix">
		<div class="col-lg-12 column">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
						
						<th>标题</th>
						<th>作者</th>
						<th>关键字</th>
						<th>编稿时间</th>
						<th>点击率</th>
						
					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pi.pageList}" var="pi">
					<tr>
						<td><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId=${pi.p_newsId}>${pi.p_newsTitle}</a></td>
						<td>${pi.p_newsAu}</td>
						<td>${pi.p_newsK}</td>
						<td>${pi.p_addTime}</td>
						<td>${pi.p_click}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</div>
		
		
			<br>
			<div class="text-center">
<!-- 				返回第一页 -->	
				<a id="a1" href="${pageContext.request.contextPath}/PageServlet?method=selNewsByName&pageNum=${1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum<=1 }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/first.gif">
				</a>
				<a href="${pageContext.request.contextPath}/PageServlet?method=selNewsByName&pageNum=${pi.pageNum-1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum<=1 }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/pre.gif">
				</a>
				
				共计${pi.pageLine } 条记录，当前是第${pi.pageNum} 页
				
				<a href="${pageContext.request.contextPath}/PageServlet?method=selNewsByName&pageNum=${pi.pageNum+1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum>=pi.pageToel }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/next.gif">
				</a>
				
<!-- 				表示最后一页 -->
				<a href="${pageContext.request.contextPath}/PageServlet?method=selNewsByName&pageNum=${pi.pageToel }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum>=pi.pageToel }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/last.gif">
				</a>
				
<!-- 				选择当前的页数 -->
				<form id="for" action="${pageContext.request.contextPath}/PageServlet?method=selNewsByName&pageSize=${pi.pageSize}" method="post">
				
					<div class="row clearfix">
						<div class="col-md-12 column">
							第<input id="in" name="pageNum" type="number" size="2" step="1" max="${pi.pageToel }" min="1" />页
							 <button type="button" class="btn btn-sm">按钮</button>
						</div>
			</div>
				</form>
			</div>	
		<script type="text/javascript"> 
	  	 	$(document).ready(function(){		  	
	  			$("#fem").submit();  
   		});		 	  	 	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>用户中心</title>
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
 	<form id="fem" action="${pageContext.request.contextPath}/PageServlet?method=selUserPa" method="post">
		
 	</form> 
 	
 				<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr id="tr">
					<th>序号</th>
				
					<th>用户名</th>
					<th>邮箱</th>
					<th>注册时间</th>
					
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${pi.pageList }"  var= "pi">
				<tr>
					<td>${pi.u_id }</td>
					<td>${pi.u_username }</td>
					<td>${pi.u_email }</td>
					<td>${pi.u_reDate }</td>
					
					<td>
						<a id="ah" href="${pageContext.request.contextPath}/user?method=upFre&&u_id=${pi.u_id }" onclick="" >冻结账户</a>
					</td>
					<td><a href="${pageContext.request.contextPath}/user?method=deUserById&&u_id=${pi.u_id }" >删除</a> </td>
				</tr>
				</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</div>
 	
	
			<br><br>
<!-- 				返回第一页 -->	
				<a id="a1" href="${pageContext.request.contextPath}/PageServlet?method=selUserPa&pageNum=${1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum<=1 }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/first.gif">
				</a>
				<a href="${pageContext.request.contextPath}/PageServlet?method=selUserPa&pageNum=${pi.pageNum-1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum<=1 }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/pre.gif">
				</a>
				
				共计${pi.pageLine } 条记录，当前是第${pi.pageNum} 页
				
				<a href="${pageContext.request.contextPath}/PageServlet?method=selUserPa&pageNum=${pi.pageNum+1 }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum>=pi.pageToel }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/next.gif">
				</a>
				
<!-- 				表示最后一页 -->
				<a href="${pageContext.request.contextPath}/PageServlet?method=selUserPa&pageNum=${pi.pageToel }&pageSize=${pi.pageSize}"<c:if test="${pi.pageNum>=pi.pageToel }">onclick="javascript:return false;"</c:if>>
						<img alt="" src="${pageContext.request.contextPath}/images/last.gif">
				</a>
				
<!-- 				选择当前的页数 -->
				<form id="for" action="${pageContext.request.contextPath}/PageServlet?method=selUserPa&pageSize=${pi.pageSize}" method="post">
				第<input id="in" name="pageNum" type="number" size="2" step="1" max="${pi.pageToel }" min="1" />页
					<input type="submit" id="but" value="确认">
				</form>
			
				
<%-- 				第<input id="in" name="busjump" type="text" size="2" />页<a href="${pageContext.request.contextPath}/PageServlet?method=selUserPa&pageNum=${pagep()}&pageSize=${pi.pageSize}" onClick="pagep()"><img src="${pageContext.request.contextPath}/images/jump.gif" border="0" /></a> --%>
 	<script type="text/javascript"> 
	  	 	$(document).ready(function(){		  	
	  			$("#fem").submit();  
   	});	
			
	  	 	
	  	 	  	 	
	</script>
</body>
</html>
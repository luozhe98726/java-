<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>修改用户资料</title>
<link rel="stylesheet" type="text/css" href="statics/css/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
			<form id="fem" action="${pageContext.request.contextPath}/user?method=selUserbyId2" method="post" >
								
			</form>
<%-- 			<form action="${pageContext.request.contextPath}/user?method=upUserbyId" method="post">  --%>
<%--  				用户名：<input type="text" name="u_username" value="${user.u_username }" />  --%>
<%-- 				邮箱：<input type="text" name="u_email" value="${user.u_email }" />  --%>
<%--  				真实姓名：<input type="text" name="u_realName" value="${user.u_realName }"/>  --%>
<%-- 				年龄:<input type="text" name="u_age" value="${user.u_age }"/>  --%>
<%--  				性别:<input type="text" name="u_sex" value="${user.u_sex }"/>  --%>
<!--  				<button id="but">提交</button> --> 
<!--  		</form> --> 
		
			<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user?method=upUserbyId" method="post">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">用户名：</label>
					<div class="col-sm-10">
						<input type="text" name="u_username" class="form-control" id="inputEmail3" value="${user.u_username }" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-10">
						<input type="text" name="u_email"  class="form-control" id="inputPassword3" value="${user.u_email }" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">真实姓名</label>
					<div class="col-sm-10">
						<input type="text" name="u_realName" class="form-control" id="inputPassword3" value="${user.u_realName }" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-10">
						<input type="text" name="u_age" class="form-control" id="inputPassword3" value="${user.u_age }" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<input type="text" name="u_sex" class="form-control" id="inputPassword3" value="${user.u_sex }" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">密保问题</label>
					<div class="col-sm-10">
						<input type="text" name="u_problem" class="form-control" id="inputPassword3" value="${user.u_problem }" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">答案</label>
					<div class="col-sm-10">
						<input type="password" name="u_answer" class="form-control" id="inputPassword3" value="${user.u_answer }" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
		
		
		
<script type="text/javascript"> 
		  	 	$(document).ready(function(){		  	
		  			$("#fem").submit();  
	   			});		 
		  		
		  		$(".but").click(function(){
		  			alert("11");
		  		});
	  		</script>
</body>
</html>
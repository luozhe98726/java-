<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加新闻栏目</title>
<style type="text/css">
		
		form{
			padding-left:300px;
			padding-top:50px;
			width:300px;;
			height:30%;
		}
		input{
			margin-left:100px;
			margin-top:20px;
		}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/NewsServlet?method=inCaNews" method="post">
		新闻栏目：<select name="clNews" style="width: 150px;" >
					<option>体育新闻</option>
					<option>校园趣事</option>
					<option>校园动态</option>
					<option>食物招领</option>
					<option>学院公告</option>
					<option>社会新闻</option>
					<option>财经新闻</option>
					<option>宿舍管理</option>
				</select>
				<br>
				<input type="submit" id="" value="提交">
	</form>
</body>
</html>
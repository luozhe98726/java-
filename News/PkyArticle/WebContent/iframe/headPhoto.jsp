<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>上传头像</title>
<link rel="stylesheet" type="text/css" href="statics/css/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
		<style type="text/css">
			form{
				margin-top:50px;
			}
		</style>
</head>
<body>
	<div class="main w1200">
		<div class="right">
				<div class="tap">
					<span>系统消息</span>
				</div>
				<div class="container">
					<div class="no-doc">
						<form action="${pageContext.request.contextPath}/UploadServlet?method=inPhoto" method="post" enctype="multipart/form-data">
								<input type="file" name="file"  multiple="multiple">
								<button>提交</button>
						</form>
					</div>
				</div>
			</div>
		</div>	
</body>
</html>
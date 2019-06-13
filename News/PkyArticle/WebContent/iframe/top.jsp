<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="statics/css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="statics/css/style.css" />

	<style type="text/css">
		
	
	</style>
</head>
<body>
		<div class="header">
			<div class="bar">
				<div class="w1200">
					<span class="l">新闻发布系统<font>个人中心</font></span>
					<span class="r"><a href="../index.jsp" target="_top"><i class="icon iconfont icon-dianyuan"></i>首页</a></span>
				</div>
			</div>
			
			<div class="user-info">
				<div class="w1200">
					<div class="user-headface">
							<img src="${pageContext.request.contextPath}${photo }"/>
					</div>
					<div class="user-account">
						<p class="tip">下午好，${u_username }</p>
						<p class="account">
							<span>帐户名：${u_username }</span>
							<span>用户：tomandjerry</span>
						</p>
					</div>
					<div class="user-modify">
						<a href="upDate.jsp" target="MainFrame">修改资料></a>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<script>
		$(document).ready(function(){	
			function reurl(){
				url = location.href;
				if( url.indexOf("Fresh=") <1 ){
					if( url.indexOf("?") <1 ){
						url = url+"?Fresh="+(Math.floor(Math.random()*100000000+100000000) ); 
					}else{
						url = url+"&Fresh="+(Math.floor(Math.random()*100000000+100000000) ); 
					}
					self.location.replace(url);
				}
			}
		
			
		});
		
			</script>
</body>
</html>
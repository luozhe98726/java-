<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新闻发布及管理系统</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<style type="text/css">
				#carousel-347033{
					margin-top: -20px;
				}
				#no li{
					margin-top:10px;
					font-size:20px;
					font-weight:bold;
					list-style:none;
					margin-left:-30px;
				}
				#newsZuixin li{
					list-style:none;
					margin-left:-50px;
				}
				#newsZuixin2 li{
					list-style:none;
					margin-left:-50px;
				}
				#newsZuixin3 li{
					list-style:none;
					margin-left:-50px;
				}
					
				#newsAll li{
					list-style:none;
					margin-left:-30px;
				}
				#newsAll2 li{
					list-style:none;
					margin-left:-30px;
				}
				#newsAll3 li{
					list-style:none;
					margin-left:-30px;
				}
				#renmen li{
					list-style:none;
					margin-left:-50px;
				}
				#renmen2 li{
					list-style:none;
					margin-left:-50px;
				}
				#renmen3 li{
					list-style:none;
					margin-left:-50px;
				}
				
				.newsFenlei li{
					list-style:none;
					margin-left:-30px;
				}
				.newsFenlei2 li{
					list-style:none;
					margin-left:-30px;
				}
				.newsFenlei3 li{
					list-style:none;
					margin-left:-30px;
				}
				.thumbnail{
					border-style:none;
				}
				#thumbnail{
					margin-left:-4px;
				}

				#img{
					width:70px; height:70px; border-radius:50%;
				}
				li a{
					color:black;
					text-decoration:none;
				}
				.tab-pane ul{
					display: inline-block;
					margin-right:30px;
				}
				.container{
					
				}
		</style>
</head>
<body>
	<form id="fem" action="${pageContext.request.contextPath}/ShowServlet?method=doShow" method="post">
		
		</form>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-inverse" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">首页</a>
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
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">校训<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">品学兼修</a>
								</li>
								<li>
									 <a href="#">知行统一</a>
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
						
					</ul>
				</div>
	
			</nav>

			<!--引言 
			<blockquote>
				<p>
					
					倘若一个国家是一条航行在大海上的船，新闻记者就是船头的嘹望者。他要在一望无际
					的海面上观察一切，审视海上的不测风云和浅滩暗礁，及时发出警告。
				</p> <small>——<cite>普利策</cite></small>
			</blockquote>
				-->
			<!--轮播 -->
			<div class="carousel slide" id="carousel-347033">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-347033">
					</li>
					<li data-slide-to="1" data-target="#carousel-347033">
					</li>
					<li data-slide-to="2" data-target="#carousel-347033">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="images/banner.jpg" />
<!-- 						<div class="carousel-caption"> -->
<!-- 							<h4> -->
<!-- 								First Thumbnail label -->
<!-- 							</h4> -->
<!-- 							<p> -->
<!-- 								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. -->
<!-- 							</p> -->
<!-- 						</div> -->
					</div>
					<div class="item">
						<img alt="" src="images/nmgc1.jpg" />
<!-- 						<div class="carousel-caption"> -->
<!-- 							<h4> -->
<!-- 								Second Thumbnail label -->
<!-- 							</h4> -->
<!-- 							<p> -->
<!-- 								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. -->
<!-- 							</p> -->
<!-- 						</div> -->
					</div>
					<div class="item">
						<img alt="" src="images/banner3.jpg" />
<!-- 						<div class="carousel-caption"> -->
<!-- 							<h4> -->
<!-- 								Third Thumbnail label -->
<!-- 							</h4> -->
<!-- 							<p> -->
<!-- 								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit. -->
<!-- 							</p> -->
<!-- 						</div> -->
					</div>
				</div> <a class="left carousel-control" href="#carousel-347033" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-347033" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>

			<!--新闻信息 -->
			<div class="row clearfix">
				<div class="col-md-8 column">
					<h3>
						<strong>热点新闻推荐</strong>
					</h3>
					<div class="row">
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200" src="images/jgdsz.jpg" />
								<div class="caption">
<!-- 									<h4> -->
<!-- 										习近平在亚洲文明对话大会开幕式上的主旨演讲(全文) -->
<!-- 									</h4> -->
<!-- 									<p> -->
<!-- 										　当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										 <a class="btn btn-primary" href="#">详细信息</a> -->
<!-- 									</p> -->
											<ul id="renmen">
										
											</ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200" src="images/kxyj.jpg" />
								<div class="caption">
<!-- 									<h4> -->
<!-- 										习近平在亚洲文明对话大会开幕式上的主旨演讲(全文) -->
<!-- 									</h4> -->
<!-- 									<p> -->
<!-- 										当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										 <a class="btn btn-primary" href="#">详细信息</a>  -->
<!-- 									</p> -->
											<ul id="renmen2">
										
											</ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200" src="images/szdws1.jpg" />
								<div class="caption">
<!-- 									<h4> -->
<!-- 										习近平在亚洲文明对话大会开幕式上的主旨演讲(全文) -->
<!-- 									</h4> -->
<!-- 									<p> -->
<!-- 										当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										 <a class="btn btn-primary" href="#">详细信息</a>  -->
<!-- 									</p> -->
											<ul id="renmen3">
										
											</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--用户信息 -->
				<div class="col-md-4 column">
					<h3>
						<strong>用户中心</strong>
					</h3>
							<h4  class="text-center " id="h4"><strong>欢迎使用新闻系统</strong></h4>
<!-- 					<p> -->
<!-- 						当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 					</p> -->
<!-- 					<p> -->
<!-- 						 <a class="btn" href="#">View details »</a> -->
<!-- 					</p> -->

<!-- 						需要判断当前是否有用户的登录 -->
						<%
						session.getAttribute("u_username");
							if(session.getAttribute("u_username") == null){%>
							<p>您好！您还没有登录</p>
						<% }else{%>
								
								<div class="text-center ">
										<a href="#"><img id="img" alt=""  src="${pageContext.request.contextPath}${photo }"></a>
										<p>${u_username}</p>
										<span><a  id="modal-198560" href="#modal-container-198560" role="button" data-toggle="modal">修改密码</a></span> &nbsp;&nbsp;&nbsp;<span><a href="#">完善信息</a></span><br><br>
										<span><a href="userCenter.jsp">个人中心</a></span> &nbsp;&nbsp;&nbsp;<span><a href="#modal-container-1985602" role="button" data-toggle="modal">上传稿件</a></span>
								</div>
						<% }%>
				</div>
			</div>
					
						 
<!-- 			修改密码模态框 -->
			<div class="modal fade" id="modal-container-198560" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								用户修改密码
							</h4>
						</div>
							
						<div class="modal-body">
							请输入原始密码:<input id="pass" type="text" name="password"><br>
							请输入新密码:&nbsp;&nbsp;&nbsp; <input id="pass2" type="text" name="newpassword">
						</div>
						<div class="modal-footer">
							 <button  type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							  <button id="but" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
				<div class="modal fade" id="modal-container-1985602" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								用户上传稿件
							</h4>
						</div>
							<form action="${pageContext.request.contextPath}/UploadServlet?method=inFile" method="post" enctype="multipart/form-data">
								<div class="modal-body">
									<input type="file" id="file1"  name="file1"  multiple="multiple">
								</div>
								<div class="modal-footer">
									 <button  type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
<!-- 									  <button id="but2" type="button" class="btn btn-primary" data-dismiss="modal">保存</button> -->
											<button>提交</button>
								</div>
						</form>
					</div>
					
				</div>
				
			</div>
<!-- 			上传稿件模态框 -->
					
					<script type="text/javascript">
					$("#but").click(function(){
// 						alert($("#pass").val());
						$.post("${pageContext.request.contextPath}/user",{"method":"upPs","password":$("#pass").val(),"newpassword":$("#pass2").val()},enctype="multipart/form-data",function(result){
							alert(result);
						});
		  	 			
		  	 		});
					
					
// 					$("#but2").click(function(){
// // 						alert($("#pass").val());
// 						$.post("${pageContext.request.contextPath}/UploadServlet",{"method":"inFile","file1":$("#file1").val()},function(result){
// 							alert(result);
// 						});
		  	 			
// 		  	 		});
					</script>
					
					
					
					
					
					
					
			<!-- -->
			<div id="box2" class="row clearfix">
				<div class="col-md-8 column">
					<h3 class="text-left">
						<strong>最新新闻推荐</strong>
					</h3>
					<div class="row">
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200" src="images/cygks.jpg" />
								<div class="caption">
<!-- 									<h4> -->
<!-- 										习近平在亚洲文明对话大会开幕式上的主旨演讲(全文) -->
<!-- 									</h4> -->
<!-- 									<p> -->
<!-- 										当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										 <a class="btn btn-primary" href="#">详细信息</a>  -->
<!-- 									</p> -->

											<ul id="newsZuixin">
										
											</ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200" src="images/jyjx.jpg" />
								<div class="caption">
<!-- 									<h4> -->
<!-- 										习近平在亚洲文明对话大会开幕式上的主旨演讲(全文) -->
<!-- 									</h4> -->
<!-- 									<p> -->
<!-- 										当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										 <a class="btn btn-primary" href="#">详细信息</a>  -->
<!-- 									</p> -->
											<ul id="newsZuixin2">
										
											</ul>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200" src="images/cygks.jpg" />
								<div class="caption">
<!-- 									<h4> -->
<!-- 										习近平在亚洲文明对话大会开幕式上的主旨演讲(全文) -->
<!-- 									</h4> -->
<!-- 									<p> -->
<!-- 										当前，世界多极化、经济全球化、文化多样化、社会信息化深入发展...... -->
<!-- 									</p> -->
<!-- 									<p> -->
<!-- 										 <a class="btn btn-primary" href="#">详细信息</a>  -->
<!-- 									</p> -->
											<ul id="newsZuixin3">
										
											</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 最近公告-->
				<div class="col-md-4 column text-center">
					<h3>
						<strong>最近公告</strong>
					</h3>
						<ul id="no">
								
						</ul>
					
				</div>
			</div>
			
			
			
			
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-645927">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel1" data-toggle="tab">全部新闻</a>
					</li>
					<li >
						 <a class="panel"  href="#panel2" data-toggle="tab">体育新闻</a>
					</li>
					<li >
						 <a class="panel"  href="#panel3" data-toggle="tab">校园动态</a>
					</li>
					<li >
						 <a class="panel" href="#panel4" data-toggle="tab">失物招领</a>
					</li>
					<li >
						 <a class="panel" href="#panel5" data-toggle="tab">学院公告</a>
					</li>
					<li >
						 <a class="panel" href="#panel6" data-toggle="tab">社会新闻</a>
					</li>
					<li >
						 <a class="panel" href="#panel7" data-toggle="tab">招聘信息</a>
					</li>
					
					<li >
						 <a class="panel" href="#panel9" data-toggle="tab">宿舍管理</a>
					</li>
					<li >
						 <a class="panel" href="#panel10" data-toggle="tab">校园趣事</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel1">
						
							<ul id="newsAll">
										
							</ul>
							<ul id="newsAll2">
										
							</ul>
							<ul id="newsAll3">
										
							</ul>
						
					</div>
					<div class="tab-pane" id="panel2">
						<p>
							<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
						</p>
					</div>
					<div class="tab-pane " id="panel3">
						
							<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
						
					</div>
					<div class="tab-pane " id="panel4">
						<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
					</div>
					<div class="tab-pane " id="panel5">
						<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
					</div>
					<div class="tab-pane " id="panel6">
						<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
					</div>
					<div class="tab-pane " id="panel7">
						<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
					</div>
					
					<div class="tab-pane " id="panel9">
						<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
					</div>
					<div class="tab-pane " id="panel10">
						<ul class="newsFenlei" >
										
							</ul>
							<ul class="newsFenlei2" >
										
							</ul>
							<ul class="newsFenlei3">
										
							</ul>
					</div>
				</div>
			</div>
		</div>
	</div>



			
			
			<br><br><br>
			
			<!-- 友情链接-->
			<div class="row clearfix">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<ul id="uu" class="list-unstyled list-inline text-center">
								
							</ul>
						</div>
					</div>
				</div>
		
		</div>
		</div>
		</div>
		<script type="text/javascript"> 
			//使用ajax获取后数据
			//友情链接显示
	  	 	$(document).ready(function(){		  	
	  				$.post("${pageContext.request.contextPath}/ShowServlet",{"method":"linkShow"},function(result){
	  					//console.log("11");
	  						//alert(result);
	  						var carNewsList = "";
	  						$.each(JSON.parse(result),function(i,index){
	  							carNewsList += "<li><a href="+"+ index.l_address+" +">"+ index.l_name+"</a></li>";
	  	  						//alert("222");
	  	  						//alert(index.l_address);	
	  	  					});
	  						$("#uu").html(carNewsList);
	  						
	  					
	  				});	
	  				
	  				//公告显示
	  				$.post("${pageContext.request.contextPath}/ShowServlet",{"method":"notShow"},function(result){
	  					//console.log("11");
	  						//alert(result);
	  						var carNewsList = "";
	  						$.each(JSON.parse(result),function(i,index){
	  							carNewsList += "<li>"+ index.n_name+ "----------"+ index.n_content+"</li>";
	  	  						//alert("222");
	  	  						//alert(index.l_address);	
	  	  					});
	  						$("#no").html(carNewsList);
	  				});		
   				  	 
			
			//显示所有的新闻
	  	 	$.post("${pageContext.request.contextPath}/ShowServlet",{"method":"newsShowAll"},function(result){
					//console.log("11");
						//alert("111");
						//alert(result);
						var carNewsList = "";
						var carNewsList2 ="";
						var carNewsList3 ="";
						$.each(JSON.parse(result),function(i,index){
							if(i<=5){
								carNewsList += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+index.p_addTime+"</li>";
							}else if(i<=11 & i >5){
								carNewsList2 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+index.p_addTime+"</li>";
							}else{
								carNewsList3 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+index.p_addTime+"</li>";
							}
							
	  						//alert(index.p_newsTitle);
							
	  					});
						$("#newsAll").html(carNewsList);
						$("#newsAll2").html(carNewsList2);
						$("#newsAll3").html(carNewsList3);
// 						
						
						
	  					
				});		
	  	 	
			//显示最新新闻
	  	 	$.post("${pageContext.request.contextPath}/ShowServlet",{"method":"newsShowzuixin"},function(result){
				//console.log("11");
					//alert("111");
					//alert(result);
					var carNewsList = "";
					var carNewsList2 ="";
					var carNewsList3 ="";
					$.each(JSON.parse(result),function(i,index){
						if(i<=5){
							carNewsList += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;</li>";
						}else if(i<=11 & i >5){
							carNewsList2 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;</li>";
						}else{
							carNewsList3 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;</li>";
						}
						
  						//alert(index.p_newsTitle);
						
  					});
					$("#newsZuixin").html(carNewsList);
					$("#newsZuixin2").html(carNewsList2);
					$("#newsZuixin3").html(carNewsList3);
//									
  					
			});		
  	 			
			
			

			//显示热门新闻
	  	 	$.post("${pageContext.request.contextPath}/ShowServlet",{"method":"renMen"},function(result){
				//console.log("11");
					//alert("111");
					//alert(result);
					var carNewsList = "";
					var carNewsList2 ="";
					var carNewsList3 ="";
					$.each(JSON.parse(result),function(i,index){
						if(i<=5){
							carNewsList += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;</li>";
						}else if(i<=11 & i >5){
							carNewsList2 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;</li>";
						}else{
							carNewsList3 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;</li>";
						}
						
  						//alert(index.p_newsTitle);
						
  					});
					$("#renmen").html(carNewsList);
					$("#renmen2").html(carNewsList2);
					$("#renmen3").html(carNewsList3);
//						
				
			});		
				  	
	  	});	
	  	 		
			
	  		$(".panel").click(function(){//为每一个新闻的栏目做一个点击事件
				//alert($(this).text());
				$(this).text();
	  			$.post("${pageContext.request.contextPath}/ShowServlet",{"method":"selNewsByfn","f_name":$(this).text()},function(result){
	  					//alert();		
	  				var carNewsList = "";
					var carNewsList2 ="";
					var carNewsList3 ="";
					$.each(JSON.parse(result),function(i,index){
						if(i<=5){
							carNewsList += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+index.p_addTime+"</li>";
						}else if(i<=11 & i >5){
							carNewsList2 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+index.p_addTime+"</li>";
						}else{
							carNewsList3 += "<li><a href=${pageContext.request.contextPath}/NewsServlet?method=selNewsById2&&p_newsId="+index.p_newsId+">"+ index.p_newsTitle+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+index.p_addTime+"</li>";
						}
						
  						//alert(index.p_newsTitle);
						
  					});
					$(".newsFenlei").html(carNewsList);
					$(".newsFenlei2").html(carNewsList2);
					$(".newsFenlei3").html(carNewsList3);
//						
	  			});
				
			});
	  	 	
			</script>
</body>
</html>
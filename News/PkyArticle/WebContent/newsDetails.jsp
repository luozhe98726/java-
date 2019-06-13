<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>新闻详情页面</title>
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		
		<style type="text/css">
		
		.container{
		width: 1000px;
	}
	.commentbox{
		width: 900px;
		margin: 20px auto;
	}
	.mytextarea {
	    width: 100%;
	    overflow: auto;
	    word-break: break-all;
	    height: 100px;
	    color: #000;
	    font-size: 1em;
	    resize: none;
	}
	.comment-list{
		width: 900px;
		margin: 20px auto;
		clear: both;
		padding-top: 20px;
	}
	.comment-list .comment-info{
		position: relative;
		margin-bottom: 20px;
		margin-bottom: 20px;
		border-bottom: 1px solid #ccc;
	}
	.comment-list .comment-info header{
		width: 10%;
		position: absolute;
	}
	.comment-list .comment-info header img{
		width: 100%;
		height:100px;
		border-radius: 50%;
		padding: 5px;
	}
	.comment-list .comment-info .comment-right{
		padding:5px 0px 5px 11%; 
	}
	.comment-list .comment-info .comment-right h3{
		margin: 5px 0px;
	}
	.comment-list .comment-info .comment-right .comment-content-header{
		height: 25px;
	}
	.comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span{
		padding-right: 2em;
		color: #aaa;
	}
	.comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span.reply-btn,.send,.reply-list-btn{
		cursor: pointer;
	}
	.comment-list .comment-info .comment-right .reply-list {
		border-left: 3px solid #ccc;
		padding-left: 7px;
	}
	.comment-list .comment-info .comment-right .reply-list .reply{
		border-bottom: 1px dashed #ccc;
	}
	.comment-list .comment-info .comment-right .reply-list .reply div span{
		padding-left: 10px;
	}
	.comment-list .comment-info .comment-right .reply-list .reply p span{
		padding-right: 2em;
		color: #aaa;
	}
		
	#guanggao{
		margin-top:-50px;
	}
	#dd{
		height:52px;
	}
	#guanggao{
		height:130px;
	}
		</style>
</head>
<body>
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

							<div id="guanggao" class="page-header text-center">
									<img alt="" style="width:970px;" src="images/guang.png">
								</div>
					<!--新闻详情 -->
							
						<div class="row clearfix">
							<div class="col-md-12 column">
								
								<div class="jumbotron">
									<h1>
										${news.p_newsTitle }
									</h1>
									<p>
										${news.p_newsContent }
									</p>
									
									<br>
									<h4><strong>关键词：${news.p_newsK }</strong></h4>
									<h4><strong>浏览量：${click }</strong></h4>
									<h4><strong><a href="${pageContext.request.contextPath}/NewsServlet?method=inColl&p_newsId=${news.p_newsId }">收藏</a></strong></h4>
								</div>
									
							</div>
						</div>
					</div>


				
				<div class="container">
	<div class="commentbox">
		<form id="fem" action="${pageContext.request.contextPath}/ComServlet?method=inCom&&p_newsId=${news.p_newsId }" method="post">
				<textarea name="d_content" cols="80" rows="50" placeholder="来说几句吧......" class="mytextarea" id="content"></textarea>
<!-- 				<input type="button" class="btn btn-info pull-right" id="comment" value="评论"> -->
				<button class="btn btn-info pull-right" id="comment">评论</button>
		</form>
	</div>
	<div class="comment-list">
	
		
		
	</div>
</div>


<script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery.comment.js" ></script>

<script type="text/javascript">
		var arr = [
// 				{id:1,img:"images/tou2.jpg",replyName:"程小猪",beReplyName:"匿名",content:"同学聚会，看到当年追我的屌丝开着宝马车带着他老婆来了，他老婆是我隔壁宿舍的同班同学，心里后悔极了。",time:"2017-10-17 11:42:53",address:"深圳",osname:"",browse:"谷歌",replyBody:[]},
				
			];
	
		$(document).ready(function(){		
			$.post("${pageContext.request.contextPath}/ComServlet",{"method":"selCom","p_newsId": ${news.p_newsId } },function(result){
				
				//alert(result);
				$.each(JSON.parse(result),function(i,index){
					//alert(index.d_addTime);
					$(".comment-list").addCommentList({data:arr,add:""});
					var obj = new Object();
					obj.img="${pageContext.request.contextPath}"+index.up_image;
					obj.replyName=index.u_username;
					obj.content=index.d_content;
					obj.browse="益阳";
					obj.osname="win10";
					obj.replyBody="";
					obj.time=index.d_addTime;
					$(".comment-list").addCommentList({data:[],add:obj});
				});
			});
		});
		
	
		
	//初始化数据
	
// 	$(function(){
// 		$(".comment-list").addCommentList({data:arr,add:""});
// 		$("#comment").click(function(){
// 			var obj = new Object();
// 			obj.img="${pageContext.request.contextPath}${photo }";
// 			obj.replyName="${u_username}";
// 			obj.content=$("#content").val();
// 			obj.browse="益阳";
// 			obj.osname="win10";
// 			obj.replyBody="";
// 			$(".comment-list").addCommentList({data:[],add:obj});
// 		});
// 	})
</script>
</body>
</html>
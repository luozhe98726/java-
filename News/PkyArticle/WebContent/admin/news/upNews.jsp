<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>编辑新闻</title>

<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
   <!--建议手动加在语言，避免在ie下有时因为				加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
 	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>

 	   <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 	
 	<script src="${pageContext.request.contextPath}/ueditor/ueditor.parse.js"></script>
 	<style type="text/css">
 		#frm{
 			
 			margin-left:200px;
 			font-family:"微软雅黑"; 
 		}
 		#btn{
 			margin-left:200px;
 		}
 		tr > td input{
 			margin-left:20px;
 		}
 		tr  th{
 			text-align:center;
 			color:red;
 		}
 		
 		
 	</style>
</head>
<body><div class="col-md-6">
<span>${p_newsContent}</span>
<!-- <p><img src="/PkyArticle/upload/image/20190517/1558070809617011223.jpg" title="1558015773498066140.jpg" alt="bmiddle-25016bc39cf43421649ef4c40b4118443f1e67d6.jpg"/></p> -->
		<form id="frm" name="method" action="${pageContext.request.contextPath}/NewsServlet?method=upNewsById&&p_newsId=${news.p_newsId}" method="post">
			
			
				<div class="input-group">
					<span class="input-group-addon">标题</span>
					<input id="in1"  type="text" class="form-control" name="p_newsTitle"  value="${news.p_newsTitle}">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon">关键词</span>
					<input id="in2" type="text" class="form-control" name="p_newsK"  value="${news.p_newsK}">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon">作者</span>
					<input id="in3" type="text" class="form-control"  name="p_newsAu" value="${news.p_newsAu}">
				</div>
			<br>
			<select name="f_name">
							<option>${news.f_name}</option>
							<option></option>
						</select>
			
			
   				新闻内容：<script id="myeditor"  name="p_newsContent" type="text/plain"  style="width:600px;height:200px;">	
 					${news.p_newsContent} 
			</script>

   		</form>
   		<button id="btn">提交</button>
   		</div>
   		
<!--    		<p><img src="/PkyArticle/upload/image/20190517/1558072835541027356.jpg" title="1558072835541027356.jpg" alt="1.jpg" width="251" height="220" style="width: 251px; height: 220px;"/></p> -->
	<script type="text/javascript">
  	//加载编辑器
  			  	
  	 	  var ue = UE.getEditor('myeditor');
  		
  	 	
// 		var content = "${news.p_newsContent}";
// 		  	    //设置编辑器的内容
// 		  	    ue.addListener("ready",function(){
// 		  	    	ue.setContent(content);
// 		  	    });
		//   	    	  var content = "${news.p_newsContent}"; 
		//   			alert(content);
		// //	    //设置编辑器的内容
		// 	 	   ue.addListener("ready",function(){
		// 	    	ue.setContent(content);
		// 	    });
		document.getElementById("btn").onclick = function() {
			document.getElementById("myeditor").value = ue.getContent();
			frm.submit();
		};
	</script>
</body>
</html>
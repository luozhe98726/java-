<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>编辑新闻</title>
<script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.min.js"> </script>
   <!--建议手动加在语言，避免在ie下有时因为				加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
 	<script type="text/javascript" charset="utf-8" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
 	 <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 	  <link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css">
 	   <link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
		<form id="frm" name="method" action="${pageContext.request.contextPath}/NewsServlet?method=inNews" method="post">
			
			
	
				<div class="input-group">
					<span class="input-group-addon">标题</span>
					<input id="in1"  type="text" class="form-control" name="p_newsTitle" >
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon">关键词</span>
					<input id="in2" type="text" class="form-control" name="p_newsK" >
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon">作者</span>
					<input id="in3" type="text" class="form-control"  name="p_newsAu">
				</div>
			<br>
			
						<select name="f_name">
							<option>体育新闻</option>
							<option>校园趣事</option>
							<option>校园动态</option>
							<option>失物招领</option>
							<option>学院公告</option>
							<option>社会新闻</option>
							<option>招聘信息</option>
							<option>宿舍管理</option>
						</select>
					<br><br>
   				新闻内容：<script id="myeditor"  name="p_newsContent" type="text/plain"  style="width:600px;height:200px;"></script>

   		</form>
   		<button id="btn">提交</button>
   		</div>
	<script>
  	//加载编辑器
    var ue = UE.getEditor('myeditor');
  	var in1 = $("#in1").val();
  	var in2 = $("#in2").val();
  	var in3 = $("#in4").val();
  	
    document.getElementById("btn").onclick = function(){
    	//alert("qq");
//     	if(in1 ==null || in1.replace(/^\s*|\s*$/g,"") == "" || in2 ==null || in2.replace(/^\s*|\s*$/g,"") == "" || in3 ==null || in3.replace(/^\s*|\s*$/g,"") == "" || ue.getContent() ==null || ue.getContent().replace(/^\s*|\s*$/g,"") == ""){
//     		alert("数据不能为空");
//     	}else{
     		 document.getElementById("myeditor").value = ue.getContent();
         	 frm.submit();
//     	}
    	 
    };
 	 </script>
</body>
</html>
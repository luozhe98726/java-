<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>添加网站公告</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<style type="text/css">
		#but{
			margin-left:200px;
		}
		
</style>
</head>
<body>
<%-- 	<form action="${pageContext.request.contextPath}/NoticleServlet?method=inNotic&&n_id=${list.n_id }" method="post"> --%>
<%-- 			公告：<input type="text" name="n_name" value="${list.n_name }"> --%>
<%-- 			公告内容:	<input type="text" name="n_content" value="${list.n_content }"> --%>
<!-- 				<br> -->
<!-- 				<input type="submit" id="" value="提交"> -->
<!-- 	</form> -->
	
	
	
	<br><br><br>
<div class="row clearfix">
		<div class="col-md-8 column">
	<form  class="form-horizontal" role="form" action="${pageContext.request.contextPath}/NoticleServlet?method=inNotic&&n_id=${list.n_id }" method="post">
			<div class="form-group">
					 <label   for="inputPassword3" class="col-sm-2 control-label">公告：</label>
					<div class="col-sm-10">
						<input id="in1" type="text" name="n_name"  class="form-control" id="inputPassword3" value="${list.n_name }" />
					</div>
				</div>
			<div class="form-group">
					 <label   for="inputPassword3" class="col-sm-2 control-label">公告内容:</label>
					<div class="col-sm-10">
						<textarea id="in2"  name="n_content"  class="form-control" id="inputPassword3"  >${list.n_content }</textarea>
					</div>
				</div>
			
<%-- 			链接名字：<input id="in1" type="text" name="l_name" value="${list.l_name }"> --%>
<%-- 			链接地址:	<input id="in2" type="text" name="l_address" value="${list.l_address }"> --%>
				<br>
				<div class="form-group ">
				
					<div class="col-sm-2 ">
						<input id="but" type="button"   class="form-control" id="inputPassword3" value="提交" />
					</div>
				</div>
<!-- 				<input id="but" type="button" id="" value="提交"> -->
	</form>
	</div>
	</div>
	<script type="text/javascript">
		$("#but").click(function(){	
			//alert($("#in1").val());	
			var in1=$("#in1").val();
			var in2=$("#in2").val();
			if(in1 ==null || in1.replace(/^\s*|\s*$/g,"") == "" || in2 ==null || in2.replace(/^\s*|\s*$/g,"") == "" ){
				alert("数据不能为空");
			}else{
				$("form").submit();
			}
				//alert("111");
		});
	
	</script>
	
	
</body>
</html>
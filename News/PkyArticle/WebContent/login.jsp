<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户登录</title>
		
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<link media="all" type="text/css" rel="stylesheet" href="./News_files/social.css">	
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="./News_files/jquery.js.下载"></script>
		<style type="text/css">body{background:#f5f5f5;}</style>
			</head>
	<body data-rsssl="1">	
	<div class="xh-reglogo"><a href="https://news.lingyuankeji.com/"><img style="max-width: 400px;" src="images/logo.png"></a></div>
		
<div class="xh-regbox">
	<div class="xh-title">登录</div>
		
<form class="xh-form" action="user?method=login" name="method" method="post">
	<div id="text"></div>
	<div class="commonlogind14b9172f14824a3dbd0c3ce50df70420 fields-error"></div>
                <div class="xh-form-group">
            <label class="required">用户名</label>
            <input type="text" id="login_name" name="username" value="" placeholder="请输入用户名，邮箱或手机" class="form-control " style="">
                    </div>
              <div class="xh-form-group">
            <label class="required">密码</label>
            <input type="password" id="login_password" name="password" value="" placeholder="" class="form-control " style="" >
                    </div>
             
              <div class="xh-form-group mt10">
             <input type="button" value="登录" name="" id="but" class="xh-btn xh-btn-primary xh-btn-block xh-btn-lg" >
         
        </div>
    	    	    <div class="xh-form-group xh-mT20">
     
    	    </form>
</div>


	  <div class="xh-user-register"><a href="index.jsp">首页</a>|<a href="register.jsp">注册</a>|<a href="
	  #">忘记密码？</a></div>
	  <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/jquery.min.js"></script>
  <!--给button做一个点击事件唉，当点击注册的时候，就对数据的格式进行判断 -->
      <script type="text/javascript">

      		var flag1=false;
      		var flag2=false;

      		//为用户名做判断
      		$("#login_name").blur(function(){
      				var userValue=$("#login_name").val();
      				 var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
             
             
              if (userValue == null || userValue.replace(/^\s*|\s*$/g,"") == "") {//判断用户名是否为空
                     //alert("222");
                  flag1=false;
                  $("#text").html("用户名不能为空");
                  //$("#login_name").attr('placeholder',"用户名不能为空");
                  //$("#register_register_user_login").val("用户名不能为空");
              }else if (uPattern.test(userValue)) { //用户名正则，4到16位（字母，数字，下划线，减号）
                  flag1 = true;
                  $("#text").html("用户名不能为空").hide();
              }else{
                  flag1=false;
                // $("#register_register_user_login").attr('placeholder',"用户名4到16位");
                  //$("#login_name").val("用户名4到16位（字母，数字，下划线，减号）");  
                  $("#text").html("用户名4到16位（字母，数字，下划线，减号）").show();
              }
      		});


      			//密码判断
      			 $("#login_password").blur(function(){
                   var  uPattern= /^[a-zA-Z0-9_-]{4,16}$/; // 输入6-20个字母、数字、下划线
                   var  passValue=$("#login_password").val();
                   $("#text").html("用户名4到16位（字母，数字，下划线，减号）").hide();
                  if(passValue == null || passValue.replace(/^\s*|\s*$/g,"") == ""){//非空判断
                      flag2=false;
                      $("#text").html("密码不能为空").show();
                     // $("#login_password").attr('placeholder',"密码不能为空");
                   }else if (uPattern.test(passValue)) {
                        flag2=true;
                        $("#text").html("密码不能为空").hide();
                   }else{
                        flag2=false;
                        // $("#login_password").val("输入6-20个字母、数字、下划线");
                         $("#text").html("输入6-20个字母、数字、下划线").show();
                      // $("#register_register_password").attr('placeholder',"密码不能为空");
           //  $("#register_register_password").attr('placeholder',"输入6-20个字母、数字、下划线");
                   }

            });
           
      			 	  $("#but").click(function(){
	                    if(flag1 && flag2 ){//如果格式正确就提交数据
	                    	//alert("111");
	                    $(".xh-form").submit();
	                       
	                   }else{//否则提示请输入正确的格式
	                       alert("请输入正确的数据格式");
	                   }
              });


      </script>



</body>
</html>
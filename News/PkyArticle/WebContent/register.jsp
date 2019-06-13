<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
	<head>
	<title>用户注册</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<link media="all" type="text/css" rel="stylesheet" href="News_files/social.css">	
	   <script src="https://news.lingyuankeji.com/wp-includes/js/jquery/jquery.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<style type="text/css">
			body{background:#f5f5f5;}
			.er{
				margin-left:80px;
			
			}
		</style>
			</head>
	<body data-rsssl=1>	
			
      	<div class="xh-reglogo"><img style="max-width: 400px;" src="images/logo.png"></div>
      	<div class="xh-regbox">
      	     <div class="xh-title" id="form-title">用户注册</div>
      	  
      	<form class="xh-form" action="${pageContext.request.contextPath}/user?method=register" method="post" >
      		   <div class="er"></div>
      		<div class="register fields-error"></div>
                     <div class="xh-form-group">
                  <label class="required">用户名</label>
                  <input type="text" id="register_register_user_login" name="username" value="" placeholder="4到16位（字母，数字，下划线，减号）" class="form-control " style=""    />
                          </div>
                  
                    <div class="xh-form-group">
                        <label class="">邮箱</label>
                        <input type="email" id="register_register_user_email" name="email" value="" placeholder="" class="form-control " style=""   />
                    </div>
                  
                    <div class="xh-form-group">
                      <label class="required">密码</label>
                      <input type="password" id="register_register_password" name="password" value="" placeholder="输入6-20个字母、数字、下划线" class="form-control " style=""   />
                    </div>
                   
                    <div class="xh-form-group">
                      <label class="required">确认密码</label>
                      <input type="password" id="register_register_repassword" name="repassword" value="" placeholder="" class="form-control " style=""   />
                    </div>
                    
                   <div class="xh-form-group mt10">
                   <input type="button" name="" id="but" class="xh-btn xh-btn-primary xh-btn-block xh-btn-lg" value="注册"> 
                
             </div>	  
          </form>   
      </div>
      
      	  <div class="xh-user-register"><a href="index.jsp">首页</a>|<a href="login.jsp" id="a">登录</a></div>
	
   <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery.min.js"></script>
  <!--给button做一个点击事件唉，当点击注册的时候，就对数据的格式进行判断 -->
      <script type="text/javascript">
       // $("#but").click(function(){
         //   alert("11");
        //});
        //定义一个变量用来判断最后所有的数据格式是否正确
        var flag1=false;//判断用户名
        var flag2=false;//判断密码
        var flag3=false;//判断邮箱
        var flag4=false;//二次确认密码
      
                    
        //为用户名做一个验证
        $("#register_register_user_login").blur(function(){
            //用户名正则，4到16位（字母，数字，下划线，减号）
              var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
              var userValue= $("#register_register_user_login").val();
             
              if (userValue == null || userValue.replace(/^\s*|\s*$/g,"") == "") {//判断用户名是否为空
                     //alert("222");
                  flag1=false;
                  $(".er").html("用户名不能为空");
                 // $("#register_register_user_login").attr('placeholder',"用户名不能为空");
                  //$("#register_register_user_login").val("用户名不能为空");
              }else if (uPattern.test(userValue)) { //用户名正则，4到16位（字母，数字，下划线，减号）
                  flag1 = true;
                  $(".er").html("").hide();
              }else{
                  flag1=false;
                // $("#register_register_user_login").attr('placeholder',"用户名4到16位");
                 // $("#register_register_user_login").val("用户名4到16位（字母，数字，下划线，减号）"); 
                  
                  $(".er").html("用户名4到16位（字母，数字，下划线，减号）").show();
              }
          //  $("#register_register_user_login").val("请输入正确的格式");
        });

          //邮箱验证
           $("#register_register_user_email").blur(function(){
              var emailValue= $("#register_register_user_email").val();
              var uPattern=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;//邮箱正则
              if(emailValue == null || emailValue.replace(/^\s*|\s*$/g,"") == ""){
                    flag2=false;
                    $(".er").html("邮箱不能为");
                    //$("#register_register_user_email").attr('placeholder',"邮箱不能为空");
              }else if (uPattern.test(emailValue)) {//判断邮箱格式是否正确
                  flag2=true;
                  $(".er").html("邮箱不能为").hide();
              }else{
                  flag2=false;
                  $(".er").html("邮箱格式错误").show();
                 // $("#register_register_user_email").val("邮箱格式错误");
              }

           });


            //密码验证
            $("#register_register_password").blur(function(){
                   var  uPattern= /^[a-zA-Z0-9_-]{4,16}$/; // 输入6-20个字母、数字、下划线
                   var  passValue=$("#register_register_password").val();
                  if(passValue == null || passValue.replace(/^\s*|\s*$/g,"") == ""){//非空判断
                      flag3=false;
                      $(".er").html("密码不能为空").show();
                     // $("#register_register_password").attr('placeholder',"密码不能为空");
                   }else if (uPattern.test(passValue)) {
                        flag3=true;
                        $(".er").html("密码不能为空").hide();
                   }else{
                        flag3=false;
                        $(".er").html("输入6-20个字母、数字、下划线").show();
                         //$("#register_register_password").val("输入6-20个字母、数字、下划线");
                      // $("#register_register_password").attr('placeholder',"密码不能为空");
           //  $("#register_register_password").attr('placeholder',"输入6-20个字母、数字、下划线");
                   }

            });
           
              //密码二次确认
               $("#register_register_repassword").blur(function(){
                  var repassValue=$("#register_register_repassword").val();
                   var  passValue=$("#register_register_password").val();
                  if( repassValue ==passValue){
                        flag4=true;
                  }else{
                    flag4=false;
                    $(".er").html("请输入相同密码").show();
                    // $("#register_register_repassword").val("请输入相同密码");
                  }
               });
             
             
              
              $("#but").click(function(){
                    if(flag1 && flag2 && flag3 && flag4){//如果格式正确就提交数据
                    $(".xh-form").submit();
                    		alert("已提交");	
                   }else{//否则提示请输入正确的格式
                       alert("请输入正确的数据格式");
                   }
              });
              
           
      </script>
      </body>
</html>
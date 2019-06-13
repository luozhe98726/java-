<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.net.InetAddress"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
	<style type="">
	
	</style>
</head>

<body>
<div class="nav-down">
	<div class="leftmenu1">
        <div class="menu-oc"><img src="images/menu-all.png" /></div>
    	<ul>
<!--         	<li> -->
<!--             	<a class="a_list a_list1">系统账号管理</a> -->
<!--                 <div class="menu_list menu_list_first"> -->
<!--                 	<a class="lista_first" href="#">系统账号管理</a> -->
<!--                 </div> -->
<!--             </li> -->
            <li>
            	<a class="a_list a_list2">网站公告管理</a>
                <div class="menu_list">
                	<a href="${pageContext.request.contextPath}/admin/Noticle/admNoticle.jsp"  target="MainFrame">网站公告管理</a>
                    <a href="${pageContext.request.contextPath}/admin/Noticle/notic.jsp"  target="MainFrame">发布系统公告</a>
                   
                </div>
            </li>
            <li>
            	<a class="a_list a_list3">新闻栏目管理</a>
                <div class="menu_list">
                	<a href="${pageContext.request.contextPath}/admin/news/classifyNews.jsp" target="MainFrame">添加新闻栏目</a>
                    <a href="${pageContext.request.contextPath}/admin/news/mafyNews.jsp" target="MainFrame">新闻栏目管理</a>
                    
                </div>
            </li>
            <li>
            	<a class="a_list a_list3">新闻资讯管理</a>
                <div class="menu_list">
                	<a href="${pageContext.request.contextPath}/admin/news/admNews.jsp" target="MainFrame">新闻资讯管理</a>
                    <a href="${pageContext.request.contextPath}/admin/news/addNews.jsp" target="MainFrame">编辑新闻资讯</a>
<!--                     <a href="#">新闻评论管理</a> -->
                     <a href="${pageContext.request.contextPath}/admin/news/newsFile.jsp" target="MainFrame">用户稿件管理</a>
                 
                </div>
            </li>
             <li>
            	<a class="a_list a_list3">注册用户管理</a>
                <div class="menu_list">
                	<a href="${pageContext.request.contextPath}/admin/user/user.jsp"  target="MainFrame" >用户中心</a>
<%--                   onclick="window.location.href='${pageContext.request.contextPath}/user?method=selAll'" --%>
           		</div>
            </li>
             <li>
            	<a class="a_list a_list3">友情链接管理</a>
                <div class="menu_list">
                	<a href="${pageContext.request.contextPath}/admin/myLink/admLink.jsp"  target="MainFrame">友情链接管理</a>
                    <a href="${pageContext.request.contextPath}/admin/myLink/addLink.jsp"  target="MainFrame">添加友情链接</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="leftmenu2">
    	<div class="menu-oc1"><img src="images/menu-all.png" /></div>
        <ul>
        	<li>
            	<a class="j_a_list j_a_list1"></a>
                <div class="j_menu_list j_menu_list_first">
                	<span class="sp1"><i></i>全局设置</span>
                	<a class="j_lista_first" href="#">基本设置</a>
                    <a href="#">其他设置</a>
                    <a href="#">界面风格</a>
                    <a href="#">系统工具</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                	<span class="sp2"><i></i>权限管理</span>
                	<a href="#">基本权限</a>
                    <a href="#">分配权限</a>
                    <a href="#">权限管理</a>
                    <a href="#">成员管理</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list3"></a>
                <div class="j_menu_list">
                	<span class="sp3"><i></i>权限管理</span>
                	<a href="#">基本权限</a>
                    <a href="#">分配权限</a>
                    <a href="#">权限管理</a>
                    <a href="#">成员管理</a>
                </div>
            </li>
        </ul>
        
    </div>
   
</div>

</body>
</html>

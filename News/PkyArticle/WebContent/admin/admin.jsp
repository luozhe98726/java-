<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>新闻后台管理系统</title>
<style type="text/css">


</style>

</head>
<%			
		session.getAttribute("a_username");
		if(session.getAttribute("a_username") == null){
			System.out.println(session.getAttribute("a_username"));
			out.println("<script language='javascript'>");
			out.println("alert('请先登录');");
			out.println("</script>");
			//request.getRequestDispatcher("adminLogin.jsp");
			response.sendRedirect("adminLogin.jsp");
		}
	%>
<frameset name="Frame" frameSpacing=0 frameBorder="no" border=0 rows="10%,90%">
	  <frame marginWidth=0 marginHeight=0 scrolling="no" src="top.jsp">
	  <frameset  cols="16%,84%">
		    <frame marginWidth=0 marginHeight=0  scrolling="no" src="index.jsp">
		    <frame marginWidth=0 marginHeight=0   name="MainFrame" >
	  </frameset>
</frameset>
<script type="text/javascript">

</script>
</html>
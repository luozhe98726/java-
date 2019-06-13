package com.hncu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hncu.service.AdminService;
import com.hncu.service.impl.AdminServiceImpl;
import com.hncu.util.AdminBeans;




@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	
		AdminService adminService = new AdminServiceImpl();
		private static final long serialVersionUID = 1L;
		/**
		 * 后台登录
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			HttpSession session = request.getSession();
			String a_username = request.getParameter("a_username");
			String a_password = request.getParameter("a_password");
			System.out.println(a_username);
			System.out.println(a_password);
			AdminBeans admin = new AdminBeans();
			admin.setA_username(a_username);
			admin.setA_password(a_password);
			
			List<AdminBeans> list = adminService.selAdByup(admin);
			System.out.println(list);
			if(list.size() != 0){
				System.out.println("登录成功");
				response.sendRedirect("admin/admin.jsp");
				session.setAttribute("a_username",a_username);
//				request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
			}else{
				System.out.println("登录失败");
				PrintWriter out =response.getWriter();
				 out.flush();
				    out.println("<script>");
				    out.println("alert('用户名或密码错误！');");
				    out.println("history.back();");
				    out.println("</script>");
			}
			
		}
		
		/**
		 * 后台判断是否已经登录
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			HttpSession session =request.getSession();
			session.removeAttribute("a_username");
			System.out.println(session.getAttribute("a_username"));
			response.sendRedirect("admin/adminLogin.jsp");
		}
}

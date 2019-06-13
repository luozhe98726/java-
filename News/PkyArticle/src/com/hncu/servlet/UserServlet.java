package com.hncu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hncu.service.FileService;
import com.hncu.service.UserService;
import com.hncu.service.impl.FileServiceImpl;
import com.hncu.service.impl.UserServiceImpl;
import com.hncu.util.CollNews;
import com.hncu.util.PhotoBean;
import com.hncu.util.UserBean;

/**
 * @author LuoZhe
 *
 */

@WebServlet("/user")
public class UserServlet extends BaseServlet{
		private static final long serialVersionUID = 1L;
		UserService userService = new UserServiceImpl();
		FileService fileService = new FileServiceImpl();
	
		/**
		 * 用户注册
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
	
			String u_username = request.getParameter("username");;
			String u_password = request.getParameter("password");
			String u_email = request.getParameter("email");
			String method = request.getParameter("method");
			
			
			System.out.println(method);
			UserBean user = new UserBean();
			
			//做一个用户名的重复检测
			Boolean flag = true;
			List<UserBean> list = userService.selUname();
//			System.out.println(list);
			for (UserBean userBean : list) {
				if(u_username.equals(userBean.getU_username())) {
					flag=false;
				}
				
			}
			user.setU_username(u_username);
			user.setU_password(u_password);
			user.setU_email(u_email);
		
			if(flag) {
				if(userService.inUser(user)==1) {
					System.out.println("注册成功");
					response.sendRedirect("login.jsp");//使用重定向到一个新的页面，减少域对象的压力
//					request.getRequestDispatcher("login.jsp").forward(request, response);
				}else {
					System.out.println("注册失败");
				}
			}else {

				//向前端输出一个错误信息
				PrintWriter out =response.getWriter();
				 out.flush();
				    out.println("<script>");
				    out.println("alert('此用户名已存在，请重新输入！');");
				    out.println("history.back();");
				    out.println("</script>");
			}
		}
		
			
			/**
			 * 用户登录
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
		
		protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			HttpSession session = request.getSession();
			String u_username = request.getParameter("username");;
			String u_password = request.getParameter("password");
			//String u_email = request.getParameter("email");
			System.out.println(u_username+ u_password);
		//	System.out.println(u_username);
			UserBean user = new UserBean();
			
			user.setU_username(u_username);
			user.setU_password(u_password);
			//user.setU_email(u_email);
			 List<UserBean> list = userService.selByup(user);
			
			System.out.println(list);
			if(list != null && list.size() >0) {//要判断list的长度是否大于0，否则会先异常 java.lang.IndexOutOfBoundsException:
				 if(list.get(0).getU_freeze() == 0) {//用户已经被冻结
					 PrintWriter out =response.getWriter();
					 out.flush();
					    out.println("<script>");
					    out.println("alert('用户已经被冻结！');");
					    out.println("history.back();");
					    out.println("</script>");
					   
				 }else {
					 int u_id = list.get(0).getU_id();
					 String photo ="";
					System.out.println("登录成功");
					session.setAttribute("u_username", u_username);
					session.setAttribute("u_id", u_id);
					 //根据用户id来查找当前头像
					List<PhotoBean> photo2 = fileService.selPhoto(u_id);
					if(photo2.size() > 0) {
						session.setAttribute("photo", photo2.get(0).getUp_image());
					}else {
						photo="/images/moren2.jpg";
						session.setAttribute("photo", photo);
					}
					request.getRequestDispatcher("index.jsp").forward(request, response);
				 }
				 
				 
				
			}else {
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
		  *查询所有的用户
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			 List<UserBean> list = userService.selAll();
			 List<PhotoBean> list2=null;
			 for (UserBean userBean : list) {
				list2 = fileService.selPhoto(userBean.getU_id());
			}
			
			if(list != null) {
				System.out.println("查询成功");
				request.setAttribute("list", list);
				request.setAttribute("list2", list2);
				request.getRequestDispatcher("admin/user/user.jsp").forward(request, response);
			}else {
				System.out.println("查询失败");
			}
				
				
		}
		
		/**
		  *删除用户
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void deUserById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//				System.out.println("222");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			UserBean user = new UserBean();
			String u= request.getParameter("u_id");
			int u_id = Integer.parseInt(u);
			user.setU_id(u_id);
			int one = userService.deUserById(user);
			if(one == 1) {
				System.out.println("删除成功");
//				request.getRequestDispatcher("admin/user/user.jsp").forward(request, response);
				response.sendRedirect("admin/user/user.jsp");
			}else {
				System.out.println("删除失败");
			}
				
				
		}


		/**
		  *冻结账户，查询账户的状态
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void upFre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//				System.out.println("222");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			UserBean user = new UserBean();
			//根据参数用户id查询用户的状态，
			String  u_id = request.getParameter("u_id");
			System.out.println(u_id);
			int ff = userService.selFre(Integer.parseInt(u_id));
			user.setU_id(Integer.parseInt(u_id));
			if(ff==1) {//表示账户正常使用,该操作需要冻结账户
				user.setU_freeze(0);
				//更新用户状态为0
				int one = userService.upFre(user);
					if(one == 1) {
						System.out.println("账户冻结成功");
					
						 out.flush();
						    out.println("<script>");
						    out.println("alert('账户冻结成功！');");
						    out.println("history.back();");
						    out.println("</script>");
					}else {
						System.out.println("账户冻结失败");
					}
			}else if(ff==0) {//表示账户被冻结，该操作需要解除冻结
				user.setU_freeze(1);
				int one = userService.upFre(user);
				if(one == 1) {
					 out.flush();
					    out.println("<script>");
					    out.println("alert('账户解除成功！');");
					    out.println("history.back();");
					    out.println("</script>");
					System.out.println("账户解除成功");
				}else {
					System.out.println("账户解除失败");
				}
			}
				
		}
		/**
		 *用户退出登录
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();
				session.removeAttribute("u_username");
				session.removeAttribute("u_id");
				session.removeAttribute("photo");
				request.getRequestDispatcher("index.jsp").forward(request, response);
		
		}
			
		
		
		/**
		 *修改用户密码
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void upPs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");	
			//先获取session里面的用户名
				HttpSession session = request.getSession();
				String u_username =(String) session.getAttribute("u_username");
				String u_password = request.getParameter("newpassword");
				System.out.println(u_username);
				//再根据用户名修改密码
				int one = userService.upPs(u_password, u_username);
				if(one == 1) {
					System.out.println("修改成功");
//					PrintWriter out =response.getWriter();
//					 out.flush();
//					    out.println("<script>");
//					    out.println("alert('账户冻结成功！');");
//					    out.println("history.back();");
//					    out.println("</script>");
					response.getWriter().print("修改成功");
				}else {
					System.out.println("修改失败");
				}
			
		}
		
		
		/**
		 *查询当前用户的信息
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selUserbyId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");	
			HttpSession session = request.getSession();
			int u_id = (Integer)session.getAttribute("u_id");
			List<UserBean> list = userService.selUserbyId(u_id);
			
			if(list != null) {
				
				UserBean user = list.get(0);
					if(user.getU_realName() == null || user.getU_realName().equals("")) {
						user.setU_realName("未填写");
					}
					if(user.getU_age() == null || user.getU_age().equals("")) {
						user.setU_age("未填写");
					}
					if(user.getU_sex()== null || user.getU_sex().equals("") ) {
						user.setU_sex("未填写");
					}
				request.setAttribute("user", user);
				request.getRequestDispatcher("iframe/data.jsp").forward(request, response);
				System.out.println("用户信息查询成功");
			}else {
				System.out.println("用户信息查询失败");
				
			}
			
		}
		
		
		/**
		 *显示用户的信息
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selUserbyId2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			HttpSession session = request.getSession();
			int u_id = (Integer)session.getAttribute("u_id");
			List<UserBean> list = userService.selUserbyId(u_id);
			
			if(list != null) {
				
				UserBean user = list.get(0);
					if(user.getU_realName() == null || user.getU_realName().equals("")) {
						user.setU_realName("未填写");
					}
					if(user.getU_age() == null || user.getU_age().equals("")) {
						user.setU_age("未填写");
					}
					if(user.getU_sex()== null || user.getU_sex().equals("") ) {
						user.setU_sex("未填写");
					}
				request.setAttribute("user", user);
				request.getRequestDispatcher("iframe/upDate.jsp").forward(request, response);
				System.out.println("用户信息查询成功");
			}else {
				System.out.println("用户信息查询失败");
				
			}
			
			
			
		}
		
		/**
		 * 修改用户资料
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void upUserbyId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
				String u_username = request.getParameter("u_username");
				String u_email = request.getParameter("u_email");
				String u_realName = request.getParameter("u_realName");
				String u_age = request.getParameter("u_age");
				String u_sex = request.getParameter("u_sex");
				String u_problem= request.getParameter("u_problem");
				String u_answer= request.getParameter("u_answer");
					HttpSession session = request.getSession();
				int u_id = (Integer)session.getAttribute("u_id");
				
				UserBean user = new UserBean();
				user.setU_username(u_username);
				user.setU_email(u_email);
				user.setU_realName(u_realName);
				user.setU_age(u_age);
				user.setU_sex(u_sex);
				user.setU_id(u_id);
				user.setU_problem(u_problem);
				user.setU_answer(u_answer);
				
				int one = userService.upUserbyId(user);
				if(one == 1) {
					System.out.println("修改成功");
					PrintWriter out =response.getWriter();
					 out.flush();
					    out.println("<script>");
					    out.println("alert('修改成功！');");
					    out.println("history.back();");
					    out.println("</script>");
					
				}else {
					System.out.println("修改失败");
				}
				
				
				
		
		}
}

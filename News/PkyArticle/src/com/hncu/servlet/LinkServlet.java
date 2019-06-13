package com.hncu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hncu.service.LinkService;
import com.hncu.service.impl.LinkServiceImpl;
import com.hncu.util.LinkBeans;


@WebServlet("/LinkServlet")
public class LinkServlet extends BaseServlet {
		LinkService linkService = new LinkServiceImpl();
	private static final long serialVersionUID = 1L;
	
			/**
			 * 添加友情链接
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void inLink(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
					
				String l_name=request.getParameter("l_name");
				String l_address=request.getParameter("l_address");
				String l_id=request.getParameter("l_id");
				System.out.println(l_name + l_address);
				System.out.println(l_id);
				LinkBeans link = new LinkBeans();
				link.setL_name(l_name);
				link.setL_address(l_address);
				
				//做一个检测，避免修改的时候出现重复提交链接
				if(l_id==null || l_id.equals("") ) {//添加链接
					
					int one = linkService.inLink(link);
					if(one == 1) {
						System.out.println("插入成功");
						response.sendRedirect("admin/myLink/admLink.jsp");
					}else {
						
						System.out.println("插入失败");
					}
					
				}else {//修改链接
					link.setL_id(Integer.parseInt(l_id));
					int one = linkService.upLink(link);
					if(one ==1 ) {
						System.out.println("链接修改成功");
						response.sendRedirect("admin/myLink/admLink.jsp");
					}else {
						System.out.println("链接修改失败");
					}
				}
				
			
				
				
				
			
			}
			
			
			 /**
			  * 后台显示全部的链接
			  * @param request
			  * @param response
			  * @throws ServletException
			  * @throws IOException
			  */
				protected void selLink(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=utf-8");
					ServletContext context = this.getServletContext();
					System.out.println("2222");
					List<LinkBeans> list = linkService.selLink();
					if( list != null) {
						System.out.println("链接查询成功");
						context.setAttribute("listNo", list);
							request.setAttribute("list", list);
							request.getRequestDispatcher("admin/myLink/admLink.jsp").forward(request, response);
							//request.getRequestDispatcher("main/foot.jsp").forward(request, response);
					}else {
						System.out.println("链接查询失败");
					}
					
					
	}
				
				
				 /**
				  * 前台显示全部的链接
				  * @param request
				  * @param response
				  * @throws ServletException
				  * @throws IOException
				  */
					protected void selLink2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						request.setCharacterEncoding("UTF-8");
						response.setContentType("text/html;charset=utf-8");
						System.out.println("2222");
						List<LinkBeans> list = linkService.selLink();
						if( list != null) {
							System.out.println("链接查询成功");
								request.setAttribute("list", list);
								//request.getRequestDispatcher("admin/myLink/admLink.jsp").forward(request, response);
								request.getRequestDispatcher("index.jsp").forward(request, response);
						}else {
							System.out.println("链接查询失败");
						}
						
						
		}
					

				 /**
				  * 删除链接
				  * @param request
				  * @param response
				  * @throws ServletException
				  * @throws IOException
				  */
					protected void deLink(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						request.setCharacterEncoding("UTF-8");
						response.setContentType("text/html;charset=utf-8");
						String l_id2 = request.getParameter("l_id");
						int l_id = Integer.parseInt(l_id2);
						int one = linkService.deLink(l_id);
						if( one ==1) {
							System.out.println("删除成功");
							response.sendRedirect("admin/myLink/admLink.jsp");
//							request.getRequestDispatcher("admin/myLink/admLink.jsp").forward(request, response);
						}else {
							System.out.println("删除失败");
						}
						
						
						
		}

					
					
					 /**
					  * 根据链接id查询链接
					  * @param request
					  * @param response
					  * @throws ServletException
					  * @throws IOException
					  */
						protected void selLinkById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
							request.setCharacterEncoding("UTF-8");
							response.setContentType("text/html;charset=utf-8");
							String l_id2 = request.getParameter("l_id");
							int l_id = Integer.parseInt(l_id2);
							
							List<LinkBeans> list = linkService.selLinkById(l_id);
							if(list != null) {
									System.out.println("链接查询成功");
									LinkBeans li = list.get(0);
									request.setAttribute("list",li );
									request.getRequestDispatcher("admin/myLink/addLink.jsp").forward(request, response);
								
							}else {
								
							}
							
						}
					
					
}

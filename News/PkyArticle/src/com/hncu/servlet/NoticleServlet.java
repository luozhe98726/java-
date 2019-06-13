package com.hncu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hncu.service.NoticleService;
import com.hncu.service.impl.NoticleServiceImpl;
import com.hncu.util.LinkBeans;
import com.hncu.util.NoticleBeans;


@WebServlet("/NoticleServlet")
public class NoticleServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	NoticleService noticleService = new NoticleServiceImpl();
			
	/**
	 * 添加公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void inNotic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
			
		String n_name=request.getParameter("n_name");
		String n_content=request.getParameter("n_content");
		String n_id=request.getParameter("n_id");
		NoticleBeans noticle = new NoticleBeans();
		noticle.setN_name(n_name);
		noticle.setN_content(n_content);
		System.out.println(n_id);
		//做一个检测，避免修改的时候出现重复提交链接
		if(n_id == null || n_id.equals("")) {//添加链接
			
			int one = noticleService.inNotic(noticle);
			if(one == 1) {
				System.out.println("插入成功");
				response.sendRedirect("admin/Noticle/admNoticle.jsp");
			}else {
				
				System.out.println("插入失败");
			}
			
		}else {//修改链接
			noticle.setN_id(Integer.parseInt(n_id));
			int one = noticleService.upNotic(noticle);
			if(one ==1 ) {
				System.out.println("链接修改成功");
				response.sendRedirect("admin/Noticle/admNoticle.jsp");
			}else {
				System.out.println("链接修改失败");
			}
		}
		
	
		
		
		
	
	}
	
	
			 /**
			  * 后台显示全部的公告
			  * @param request
			  * @param response
			  * @throws ServletException
			  * @throws IOException
			  */
				protected void selNotic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=utf-8");
					
					System.out.println("2222");
					List<NoticleBeans> list = noticleService.selNotic();
					
					if( list != null) {
						System.out.println("公告查询成功");
							
							request.setAttribute("list", list);
							request.getRequestDispatcher("admin/Noticle/admNoticle.jsp").forward(request, response);
					}else {
						System.out.println("公告查询失败");
					}		
				}
		
		
				
		
		 /**
		  * 删除链接
		  * @param request
		  * @param response
		  * @throws ServletException
		  * @throws IOException
		  */
			protected void deNotic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				String n_id2 = request.getParameter("n_id");
				int n_id = Integer.parseInt(n_id2);
				int one = noticleService.deNotic(n_id);
				if( one ==1) {
					System.out.println("删除成功");
					response.sendRedirect("admin/Noticle/admNoticle.jsp");
//					request.getRequestDispatcher("admin/myLink/admLink.jsp").forward(request, response);
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
				protected void selNoticById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=utf-8");
					String n_id2 = request.getParameter("n_id");
					int n_id = Integer.parseInt(n_id2);
				
					List<NoticleBeans> list = noticleService.selNoticById(n_id);
					if(list != null) {
							System.out.println("链接查询成功");
							NoticleBeans li = list.get(0);
							request.setAttribute("list",li );
							request.getRequestDispatcher("admin/Noticle/notic.jsp").forward(request, response);
						
					}else {
						
					}
					
				}
  

}

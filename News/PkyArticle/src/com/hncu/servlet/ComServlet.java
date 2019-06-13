package com.hncu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.hncu.service.ComService;
import com.hncu.service.impl.ComServiceImpl;
import com.hncu.util.ComBean;

@WebServlet("/ComServlet")
public class ComServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       	ComService comService = new ComServiceImpl();
       		
       	/**
       	 * 添加评论信息
       	 * @param request
       	 * @param response
       	 * @throws ServletException
       	 * @throws IOException
       	 */
       	protected void inCom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
					//获取前端的参数
//			private int d_id;
//			private String d_content;
//			private int u_id;
//			private String u_username;
//			private int p_newsId;
			HttpSession session = request.getSession();
			String  u_username =(String) session.getAttribute("u_username");
			if(u_username == null) {
				PrintWriter out =response.getWriter();
				 out.flush();
				    out.println("<script>");
				    out.println("alert('请登录！');");
				    out.println("history.back();");
				    out.println("</script>");
			}else {
				String d_content = request.getParameter("d_content");
				int u_id  = (int)session.getAttribute("u_id");
				
				System.out.println(u_username);
			
					int p_newsId =Integer.parseInt(request.getParameter("p_newsId"));
					String up_image = (String)session.getAttribute("photo");
					System.out.println(d_content + p_newsId);
					System.out.println(u_id + u_username);
					
					ComBean com = new ComBean();
					com.setD_content(d_content);
					com.setU_username(u_username);
					com.setU_id(u_id);
					com.setP_newsId(p_newsId);
					com.setUp_image(up_image);
					
					int one = comService.inCom(com);
					if( one == 1) {
						System.out.println("评论添加成功");
						PrintWriter out =response.getWriter();
						 out.flush();
						    out.println("<script>");
						    out.println("alert('发表成功！');");
						    out.println("history.back();");
						    out.println("</script>");
					}else {
						System.out.println("评论添加失败");
					}
				
			}
			
		
			
			
       	}
       		/**
       		 * 显示新闻对应的评论信息
       		 * @param request
       		 * @param response
       		 * @throws ServletException
       		 * @throws IOException
       		 */
     	protected void 	selCom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
				//参数新闻的id
				int p_newsId = Integer.parseInt(request.getParameter("p_newsId"));
				List<ComBean> list = comService.selCom(p_newsId);
				if(list.size() != 0) {
					JSONArray arr = new JSONArray(list);
					response.getWriter().print(arr);
					System.out.println("评论信息查询成功");
				}else {
					System.out.println("评论信息查询失败");
				}
				
			
     	}
}

package com.hncu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hncu.service.PageService;
import com.hncu.service.impl.PageServiceImpl;
import com.hncu.util.PageInfo;


@WebServlet("/PageServlet")
public class PageServlet extends BaseServlet {
		private static final long serialVersionUID = 1L;
		PageService pageService = new PageServiceImpl();
		
		/**
		 * 分页查询用户的信息
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selUserPa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//			request.setCharacterEncoding("text/html;charset=utf-8");
//			response.setContentType("utf-8");
//			获取参数pageNum;当前页数
			System.out.println(111);
			String pageNumStr = request.getParameter("pageNum");
			System.out.println(pageNumStr);
			int pageNum = 1;//表示是第一页
			//参数是否为空
			if(pageNumStr !=null && !pageNumStr.equals("") ) {
//				将参数转化为int类型，并且赋值给pageNum
				pageNum = Integer.parseInt(pageNumStr);
			}
			
			String pageSizeStr = request.getParameter("pageSize");
			System.out.println(111+pageSizeStr);
			int pageSize = 7;//一页显示七行数据
			if(pageSizeStr !=null && !pageSizeStr.equals("")) {
//				将参数转化为int类型，并且赋值给pageNum
				pageSize = Integer.parseInt(pageSizeStr);	
			}
			
		
			PageInfo pi = pageService.selUserPa(pageNum,pageSize);
			request.setAttribute("pi", pi);
//			将信息转发到前端界面
			request.getRequestDispatcher("admin/user/user.jsp").forward(request, response);
			
		}
		
		
		
		/**
		 * 分页查询新闻的信息
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selNewsPa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//			request.setCharacterEncoding("text/html;charset=utf-8");
//			response.setContentType("utf-8");
//			获取参数pageNum;当前页数
			System.out.println(111);
			String pageNumStr = request.getParameter("pageNum");
			System.out.println(pageNumStr);
			int pageNum = 1;//表示是第一页
			//参数是否为空
			if(pageNumStr !=null && !pageNumStr.equals("") ) {
//				将参数转化为int类型，并且赋值给pageNum
				pageNum = Integer.parseInt(pageNumStr);
			}
			
			String pageSizeStr = request.getParameter("pageSize");
			System.out.println(111+pageSizeStr);
			int pageSize = 7;//一页显示七行数据
			if(pageSizeStr !=null && !pageSizeStr.equals("")) {
//				将参数转化为int类型，并且赋值给pageNum
				pageSize = Integer.parseInt(pageSizeStr);	
			}
			
			
			PageInfo pi = pageService.selNewsPa(pageNum, pageSize);
			request.setAttribute("pi", pi);
//			将信息转发到前端界面
			request.getRequestDispatcher("admin/news/admNews.jsp").forward(request, response);
			
		}
		
		
		/**
		 * 分页显示用户搜索的新闻信息
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selNewsByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			//先获取前台输入的搜索词汇
			HttpSession session = request.getSession();
			String p_newsTitle2 ="";
			String p_newsTitle3= request.getParameter("p_newsTitle");
			
			if(p_newsTitle3 != null ) {//如果上传的参数不为空
				p_newsTitle2=p_newsTitle3;
				session.setAttribute("p_newsTitle3", p_newsTitle3);
				System.out.println(p_newsTitle2);
			}else {
				p_newsTitle2 = (String)session.getAttribute("p_newsTitle3");
				System.out.println(p_newsTitle2);
			}	
			
			String pageNumStr = request.getParameter("pageNum");
			//给字符串拼接上%号
			String p_newsTitle = "%"+p_newsTitle2+"%";
			
			System.out.println(pageNumStr);
			int pageNum = 1;//表示是第一页
			//参数是否为空
			if(pageNumStr !=null && !pageNumStr.equals("") ) {
//				将参数转化为int类型，并且赋值给pageNum
				pageNum = Integer.parseInt(pageNumStr);
			}
			
			String pageSizeStr = request.getParameter("pageSize");
			System.out.println(111+pageSizeStr);
			int pageSize = 3;//一页显示七行数据
			if(pageSizeStr !=null && !pageSizeStr.equals("")) {
//				将参数转化为int类型，并且赋值给pageNum
				pageSize = Integer.parseInt(pageSizeStr);	
			}
			
			PageInfo pi = pageService.selNewsByName(pageNum, pageSize, p_newsTitle);
			request.setAttribute("pi", pi);
			System.out.println(pi);
			
			System.out.println("新闻搜索分页查询成功");
			request.getRequestDispatcher("selNewsPage.jsp").forward(request, response);
		}
}

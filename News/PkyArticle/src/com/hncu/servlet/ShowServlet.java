package com.hncu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.hncu.service.LinkService;
import com.hncu.service.NewsService;
import com.hncu.service.NoticleService;
import com.hncu.service.impl.LinkServiceImpl;
import com.hncu.service.impl.NewsServiceImpl;
import com.hncu.service.impl.NoticleServiceImpl;
import com.hncu.util.LinkBeans;
import com.hncu.util.NewsBean;
import com.hncu.util.NoticleBeans;


/**
 * 前台首页需要显示的所有的信息
 * @author LuoZhe
 *
 */
@WebServlet("/ShowServlet")
public class ShowServlet extends BaseServlet {
			NoticleService noticleService =new NoticleServiceImpl();
			LinkService linkService = new LinkServiceImpl();
			NewsService newsService = new NewsServiceImpl();
			NewsService newService = new NewsServiceImpl();
			private static final long serialVersionUID = 1L;
			
			/**
			 * 前台显示友情链接
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void linkShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
					//新闻信息
				
					//用户信息
				
					//公告信息
				
					//友情链接信息
				List<LinkBeans> listLink = linkService.selLink();	
				
					System.out.println("查询成功");
					System.out.println(listLink);
					JSONArray arr = new JSONArray(listLink);
					
					//request.setAttribute("listLink", listLink);
					
					System.out.println(arr);
					
					
					response.getWriter().print(arr);
					//response.getWriter().print(ary);
		//		
			}
			
				/**
				 * 前台显示公告
				 * @param request
				 * @param response
				 * @throws ServletException
				 * @throws IOException
				 */
			protected void notShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
				List<NoticleBeans> listNot = noticleService.selNotic();
				JSONArray arr = new JSONArray(listNot);
				response.getWriter().print(arr);
				
			}
				/**
				 * 前台显示全部的新闻标题
				 * @param request
				 * @param response  select * from p_news order by p_newsId desc;
				 * @throws ServletException
				 * @throws IOException
				 */
			protected void newsShowAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				List<NewsBean> listNews = newsService.selNews();
				for(int i=0;i<listNews.size();i++) {
					String s= listNews.get(i).getP_addTime().substring(0, 10);
					listNews.get(i).setP_addTime(s);
//					if(listNews.get(i).getP_newsPo() == 1) {//当值为1的时候表示新闻还没有被发布
//						listNews.remove(i);//没有被发布的时候，移除这条新闻
//					}
					
				}
		//		System.out.println(listNews.get(0).getP_addTime().length());
		//		String s =listNews.get(0).getP_addTime().substring(0, 10);
		//		
		//		System.out.println(s);
				//前台显示已经发布的新闻
//				System.out.println(listNews);
				
				JSONArray arr = new JSONArray(listNews);
				response.getWriter().print(arr);
				
			}
			
					/**
					 * 前台显示最新的新闻标题
					 * @param request
					 * @param response  select * from p_news order by p_newsId desc;
					 * @throws ServletException
					 * @throws IOException
					 */
				protected void newsShowzuixin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					request.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=utf-8");
					List<NewsBean> listNews = newsService.selNewsZuixin();
					for(int i=0;i<listNews.size();i++) {
						String s= listNews.get(i).getP_addTime().substring(0, 10);
						listNews.get(i).setP_addTime(s);
						
					}
				//	System.out.println(listNews.get(0).getP_addTime().length());
				//	String s =listNews.get(0).getP_addTime().substring(0, 10);
				//	
				//	System.out.println(s);
					JSONArray arr = new JSONArray(listNews);
					response.getWriter().print(arr);
					
				}
				
				/**
				 * 前台显示热门的新闻标题
				 * @param request
				 * @param response  select * from p_news order by p_newsId desc;
				 * @throws ServletException
				 * @throws IOException
				 */
			protected void renMen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				List<NewsBean> list = newService.selNewsByCl();
				JSONArray arr = new JSONArray(list);
				response.getWriter().print(arr);
				
			}
		   
			
			/**
			 * 根据新闻的栏目名称来显示新闻信息
			 * @param request
			 * @param response  select * from p_news order by p_newsId desc;
			 * @throws ServletException
			 * @throws IOException
			 */
		protected void selNewsByfn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			
			//先获取参数栏目名称
			String  f_name = request.getParameter("f_name");
			System.out.println(f_name);
			List<NewsBean> listNews = newService.selNewsByfn(f_name);
			if(listNews != null) {
				System.out.println(listNews);
				for(int i=0;i<listNews.size();i++) {
					String s= listNews.get(i).getP_addTime().substring(0, 10);
					listNews.get(i).setP_addTime(s);
					
				}
				JSONArray arr = new JSONArray(listNews);
				response.getWriter().print(arr);
			}else {
				System.out.println("新闻信息查询失败");
			}
			
			
		}
			
			
}

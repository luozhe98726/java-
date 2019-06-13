package com.hncu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hncu.service.NewsService;
import com.hncu.service.impl.NewsServiceImpl;
import com.hncu.util.ClassifyNews;
import com.hncu.util.CollNews;
import com.hncu.util.NewsBean;



@WebServlet("/NewsServlet")
public class NewsServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
			NewsService newService = new NewsServiceImpl();
			/**
			 * 插入新闻分类信息
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void inCaNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
		
				String f_name = request.getParameter("clNews");;
				String method = request.getParameter("method");
	
				System.out.println(f_name);
				System.out.println(method);
				Boolean flag=true;
				
				ClassifyNews cNews = new ClassifyNews();
				cNews.setF_name(f_name);
	//			int one = newService.inCaNews(cNews);
				//对插入的栏目进行一个检测，避免重复添加
				List<ClassifyNews> list = newService.selcfNews();
				for (ClassifyNews classifyNews : list) {
					if(f_name.equals(classifyNews.getF_name())) {//如果数据库已经存在该新闻栏目，就报警告
						//向前端输出一个错误信息
						PrintWriter out =response.getWriter();
						 out.flush();
						    out.println("<script>");
						    out.println("alert('此栏目已存在，请重新输入！');");
						    out.println("history.back();");
						    out.println("</script>");
						    flag=false;
					}
							
					}
					if(flag) {
						System.out.println("qqq");
							if(newService.inCaNews(cNews)==1) {//插入成功
								System.out.println("新闻栏目插入成功");
								response.sendRedirect("admin/news/mafyNews.jsp");
							}else {
								System.out.println("插入失败");
							}
						
					}
				}
				
			
			
			
			/**
			 * 查询新闻分类信息，可以用来做新闻分类的重复检测
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void selcfNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
	//	
				 List<ClassifyNews> list = newService.selcfNews();
					if(list!=null) {
						request.setAttribute("list", list);
						System.out.println("新闻栏目查询成功");
						request.getRequestDispatcher("admin/news/mafyNews.jsp").forward(request, response);
					}else {
						System.out.println("新闻栏目查询成功失败");
					}
	
			}
			
			/**
			 * 根据id来删除新闻栏目
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void declnews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				String f_id2=request.getParameter("f_id");
				int f_id = Integer.parseInt(f_id2);
				 int one = newService.declnews(f_id);
					if(one==1) {
						System.out.println("新闻栏目删除成功");
						response.sendRedirect("admin/news/mafyNews.jsp");
	//					request.getRequestDispatcher("admin/news/mafyNews.jsp").forward(request, response);
						}else {
							 System.out.println("新闻栏目删除成功失败");
					}
					
				
			}
			
		
			
			/**
			 * 添加新闻信息
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void inNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				//获取新闻信息
				String p_newsAu = request.getParameter("p_newsAu");
				String p_newsTitle = request.getParameter("p_newsTitle");
				String p_newsContent = request.getParameter("p_newsContent");
				String p_newsK = request.getParameter("p_newsK");
				String f_name = request.getParameter("f_name");
				
				//讲数据放入到对象中
			
				NewsBean news = new NewsBean();
				news.setP_newsAu(p_newsAu);
				news.setP_newsTitle(p_newsTitle);
				news.setP_newsContent(p_newsContent);
				news.setP_newsK(p_newsK);
				news.setF_name(f_name);
				
				int f_id = newService.selClId(f_name);
				System.out.println(f_id);
				news.setF_id(f_id);
				
				int one = newService.inNews(news);
				if(one==1) {
					response.sendRedirect("admin/news/admNews.jsp");
	//				request.getRequestDispatcher("admin/news/admNews.jsp").forward(request, response);
					System.out.println("新闻信息添加成功");
				}else {
					System.out.println("新闻信息添加失败");
				}
				
			}
			
			
			/**
			 * 查询新闻信息
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void selNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
				List<NewsBean> list = newService.selNews();
				if(list != null) {
					System.out.println("新闻信息查询成功");
					System.out.println(list);
					request.setAttribute("list", list);
					request.getRequestDispatcher("admin/news/admNews.jsp").forward(request, response);
	//				response.sendRedirect("admin/news/admNews.jsp");
				}else {
					System.out.println("新闻信息查询失败");
				}
				
			}
			
			/**
			 * 根据新闻的id来删除新闻
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void deNewsById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
				String p_newsId2=request.getParameter("p_newsId");
				System.out.println(p_newsId2);
				int p_newsId = Integer.parseInt(p_newsId2);
				 int one = newService.deNewsById(p_newsId);
				 System.out.println(one);
					if(one==1) {
						System.out.println("新闻删除成功");
						response.sendRedirect("admin/news/admNews.jsp");
	//					request.getRequestDispatcher("admin/news/mafyNews.jsp").forward(request, response);
						}else {
							 System.out.println("新闻删除失败");
					}
					
				
			}
			
			/**
			 * 发布新闻
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void upNewsPo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
	//			
				String p_newsId2=request.getParameter("p_newsId");
				System.out.println(p_newsId2);
				int p_newsId = Integer.parseInt(p_newsId2);
				//检测文章是否已经发布
				Boolean flag=true;
				int po = newService.selNewsPo(p_newsId);
				if(po ==0) {//表示已经被发表
					flag = false;
				}
				
				
				PrintWriter out =response.getWriter();
				
				 
				 	if(flag) {//新闻没有被发布
				 		if(newService.upNewsPo(p_newsId) ==1) {
				 			System.out.println("新闻发布成功");
							 out.flush();
							    out.println("<script>");
							    out.println("alert('发布成功！');");
							    out.println("history.back();");
							    out.println("</script>");
							
				 		}else {
				 			 System.out.println("新闻发布失败");
				 		}
				 	}else {
				 		System.out.println("已经发布");
				 		
				 		 out.flush();//刷新流，不需要再向客户端重定向了
						    out.println("<script>");
						    out.println("alert('已经发布！');");
						    out.println("history.back();");
						    out.println("</script>");
	//					    response.sendRedirect("admin/news/admNews.jsp");
				 	}
			}
			
			
			
			/**
			 * 下架新闻
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void upNewsPo2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
	//			
				String p_newsId2=request.getParameter("p_newsId");
				System.out.println(p_newsId2);
				int p_newsId = Integer.parseInt(p_newsId2);
				//检测文章是否已经发布
				Boolean flag=true;
				int po = newService.selNewsPo(p_newsId);
				if(po ==1) {//表示已经下架
					flag = false;
				}
				
				
				PrintWriter out =response.getWriter();
				
				 
				 	if(flag) {//新闻没有被发布
				 		if(newService.upNewsPo2(p_newsId) ==1) {
				 			System.out.println("该条新闻下架成功");
							 out.flush();
							    out.println("<script>");
							    out.println("alert('该条新闻下架成功！');");
							    out.println("history.back();");
							    out.println("</script>");
							
				 		}else {
				 			 System.out.println("新闻下架失败");
				 		}
				 	}else {
				 		System.out.println("已经下架");
				 		
				 		 out.flush();//刷新流，不需要再向客户端重定向了
						    out.println("<script>");
						    out.println("alert('这条新闻已经下架！');");
						    out.println("history.back();");
						    out.println("</script>");
	//					    response.sendRedirect("admin/news/admNews.jsp");
				 	}
			}
			
			
			
			
			
			
			/**
			 * 根据新闻的id来查询新闻的信息(编辑新闻)
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void selNewsById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
				ServletContext sc= this.getServletContext();
				
				
				System.out.println("1111");
				String p_newsId2 = request.getParameter("p_newsId");
				int p_newsId = Integer.parseInt(p_newsId2);
				List<NewsBean> list = newService.selNewsById(p_newsId);
				if(list !=null) {
					NewsBean news = list.get(0);
					System.out.println(news.getP_newsContent());
					System.out.println("新闻信息查询成功");
					//sc.setAttribute("news", news);
					request.setAttribute("news", news);
					//response.sendRedirect("admin/news/upNews.jsp");
					request.getRequestDispatcher("admin/news/upNews.jsp").forward(request, response);
				}else {
					System.out.println("新闻信息查询失败");
				}
				
				
			}
			
			
			
			/**
			 * 根据新闻的id来查询新闻的信息(前台显示)
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void selNewsById2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");	
				System.out.println("1111");
				String p_newsId2 = request.getParameter("p_newsId");
				int p_newsId = Integer.parseInt(p_newsId2);
				int click = newService.selClick(p_newsId);
				System.out.println(click);
				click+=1;
				int one = newService.upClick(click ,p_newsId);
				if(one == 1) {
					System.out.println("更新成功");
				}else {
					System.out.println("更新失败");
				}
				int click2 = newService.selClick(p_newsId);
				List<NewsBean> list = newService.selNewsById(p_newsId);
				if(list !=null) {
					NewsBean news = list.get(0);
					System.out.println(news.getP_newsContent());
					System.out.println("新闻信息查询成功");
					
					
					//sc.setAttribute("news", news);
				//	request.setAttribute("click",click2 );
					request.setAttribute("click", click2);
					request.setAttribute("news", news);
					//response.sendRedirect("admin/news/upNews.jsp");
					request.getRequestDispatcher("newsDetails.jsp").forward(request, response);
				}else {
					System.out.println("新闻信息查询失败");
				}
				
				
			}
			
			/**
			 * 根据新闻的id来修改新闻(编辑新闻)
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void upNewsById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				
				//获取新闻信息
				String p_newsAu = request.getParameter("p_newsAu");
				String p_newsTitle = request.getParameter("p_newsTitle");
				String p_newsContent = request.getParameter("p_newsContent");
				String p_newsK = request.getParameter("p_newsK");
				String f_name = request.getParameter("f_name");
				String p_newsId = request.getParameter("p_newsId");
				//讲数据放入到对象中
				System.out.println(p_newsId);
				NewsBean news = new NewsBean();
				news.setP_newsAu(p_newsAu);
				news.setP_newsTitle(p_newsTitle);
				news.setP_newsContent(p_newsContent);
				news.setP_newsK(p_newsK);
				news.setF_name(f_name);
				news.setP_newsId(Integer.parseInt(p_newsId));
				
				int one = newService.upNewsById(news);
				System.out.println();
				if(one==1) {
					System.out.println("新闻修改成功");
					response.sendRedirect("admin/news/admNews.jsp");
				}else {
					System.out.println("新闻修改失败");
				}
				
			}
			
		
			/**
			 * 用户收藏新闻
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void inColl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				HttpSession session = request.getSession();
				int p_newsId =Integer.parseInt(request.getParameter("p_newsId"));
				String p_newsTitle =request.getParameter("p_newsTitle");
				
			
				if(session.getAttribute("u_username") == null && session.getAttribute("u_id")== null ) {//如果用户没有登录就不允许收藏新闻
					PrintWriter out =response.getWriter();
			 		 out.flush();//刷新流，不需要再向客户端重定向了
					    out.println("<script>");
					    out.println("alert('请先登录！');");
					    out.println("history.back();");
					    out.println("</script>");
				}else {
					CollNews coll = new CollNews();
					coll.setP_newsId(p_newsId);
					int u_id=(Integer)session.getAttribute("u_id");
					String u_username =(String) session.getAttribute("u_username");
					coll.setU_username(u_username);
					coll.setU_id(u_id);
					int one = newService.inCollec(coll);
					
					if(one ==1) {
						System.out.println("收藏成功");
						PrintWriter out =response.getWriter();
				 		 out.flush();//刷新流，不需要再向客户端重定向了
						    out.println("<script>");
						    out.println("alert('收藏成功！');");
						    out.println("history.back();");
						    out.println("</script>");
					}else {
						System.out.println("收藏失败");
					}
				}
				
				
			}
					
			
			/**
			 * 显示用户收藏的信息
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void selColl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				HttpSession session =request.getSession();
				String r =request.getParameter("pp");
				System.out.println(r);
				int u_id =(Integer)session.getAttribute("u_id");
				 List<NewsBean> list = newService.selColl(u_id);
				request.setAttribute("list",list );
				request.getRequestDispatcher("iframe/CollNews.jsp").forward(request, response);
				
				
			}
			
			
			/**
			 * 显示用户收藏的信息
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			protected void selNewsByCl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				List<NewsBean> list = newService.selNewsByCl();
			}
}	

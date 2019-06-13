package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.util.ClassifyNews;
import com.hncu.util.CollNews;
import com.hncu.util.NewsBean;

public class NewsServiceImpl implements com.hncu.service.NewsService {

					/**
					 * 插入新闻的分类信息
					 * @param cNews
					 * @return
					 */
					@Override
						public int inCaNews(ClassifyNews cNews) throws IOException {
				//		加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						
						int one = session.insert("a.b.inCaNews",cNews );
						session.commit();
						session.close();
						return one;
					}
		
					
					/**
					 * 查询新闻栏目名的信息
					 * @return
					 */
					@Override
					public List<ClassifyNews> selcfNews() throws IOException {
		//			加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						List<ClassifyNews> list = session.selectList("a.b.selcfNews");
						session.close();
						return list;
					}
		
					/**
					 * 删除新闻栏目
					 */
					@Override
					public int declnews(int f_id) throws IOException {
		//				加载配置文件
							InputStream in = Resources.getResourceAsStream("mybatis.xml");
					//		使用工厂设计模式
							SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
							SqlSession session = factory.openSession();	
							int one = session.delete("a.b.declnews",f_id);
							session.commit();
							session.close();
							return one;
					}
		
					/**
					 * 插入新闻信息
					 * @param news
					 * @return
					 * @throws IOException
					 */
					@Override
					public int inNews(NewsBean news) throws IOException {
		//				加载配置文件
							InputStream in = Resources.getResourceAsStream("mybatis.xml");
					//		使用工厂设计模式
							SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
							SqlSession session = factory.openSession();	
							 int one = session.insert("a.b.inNews", news);
							
							session.commit();
							session.close();
							return one;
					}
		
					/**
					 * 根据栏目名称来查找id
					 * @param f_name
					 * @return
					 * @throws IOException
					 */
					@Override
					public int selClId(String f_name) throws IOException {
		//				加载配置文件
							InputStream in = Resources.getResourceAsStream("mybatis.xml");
					//		使用工厂设计模式
							SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
							SqlSession session = factory.openSession();	
							int f_id = session.selectOne("a.b.selClId", f_name);
							
							System.out.println(f_id);
							session.close();
							return f_id;
					}
		
		
					/**
					 * 查询所有的新闻信息
					 * @return
					 * @throws IOException
					 */
					@Override
					public List<NewsBean> selNews() throws IOException {
		//				加载配置文件
							InputStream in = Resources.getResourceAsStream("mybatis.xml");
					//		使用工厂设计模式
							SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
							SqlSession session = factory.openSession();	
							List<NewsBean> list = session.selectList("a.b.selNews");
							
							session.close();
							return list;
					}
		
					
					/**
					 * 根据新闻id来删除新闻
					 * @param p_newsId
					 * @return
					 * @throws IOException
					 */
					@Override
					public int deNewsById(int p_newsId) throws IOException {
		//				加载配置文件
							InputStream in = Resources.getResourceAsStream("mybatis.xml");
					//		使用工厂设计模式
							SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
							SqlSession session = factory.openSession();	
							int one = session.delete("a.b.deNewsById", p_newsId);
							System.out.println(p_newsId);
							session.commit();
							session.close();
							return one;
					}
		
					/**
					 * 发布新闻，更新新闻状态
					 * @param p_newsId
					 * @return
					 * @throws IOException
					 */
					@Override
					public int upNewsPo(int p_newsId) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						int one = session.update("a.b.upNewsPo", p_newsId);
						session.commit();
						session.close();
						return one;
					}
		
					
					
					/**
					 * ，更新新闻状态(下架新闻)
					 * @param p_newsId
					 * @return
					 * @throws IOException
					 */
					@Override
					public int upNewsPo2(int p_newsId) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						int one = session.update("a.b.upNewsPo2", p_newsId);
						session.commit();
						session.close();
						return one;
					}
					/**
					 * 根据新闻id来查询文章是否已经被发表
					 * @param p_newsId
					 * @return
					 * @throws IOException
					 */
					@Override
					public int selNewsPo(int p_newsId) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						int one = session.selectOne("a.b.selNewsPo", p_newsId);
						
						session.close();
						return one;
					}
		
					/**
					 * 根据新闻的id来查找新闻的信息
					 * @return
					 * @throws IOException
					 */
					@Override
					public List<NewsBean> selNewsById(int p_newsId) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						List<NewsBean> list = session.selectList("a.b.selNewsById", p_newsId);
						
						session.close();
						return list;
					}
						
					
					
					/**
					 * 根据新闻的id来修改新闻的信息
					 * @param news
					 * @return
					 * @throws IOException
					 */
					@Override
					public int upNewsById(NewsBean news) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						
						int one = session.update("a.b.upNewsById", news);
						
						session.commit();
						session.close();
						return one;
					}
		
					/**
					 * 查询最新的新闻，从最后一条开始查询
					 * @return
					 * @throws IOException
					 */
					@Override
					public List<NewsBean> selNewsZuixin() throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						List<NewsBean> list = session.selectList("a.b.selNewsZuixin");
						session.close();
						return list;
					}
		
					
					/**
					 * 根据新闻的id来查询这条新闻的阅读量
					 * @return
					 */
					@Override
					public int selClick(int p_newsId) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						int one = session.selectOne("a.b.selClick", p_newsId);
						
						session.close();
						return one;
					}
					
					
					/**
					 * 更新新闻的阅读量
					 * @param p_click
					 * @return
					 * @throws IOException
					 */
		
					@Override
					public int upClick(int p_click,int p_newsId) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						Map<Object, Integer> map = new HashMap<Object, Integer>();
						map.put("p_click", p_click);
						map.put("p_newsId", p_newsId);
						int one = session.update("a.b.upClick",map);
						
						session.commit();
						session.close();
						return one;
					}
		
					/**
					 * 收藏夹，用户点击收藏，
					 * @param coll
					 * @return
					 * @throws IOException
					 */
					@Override
					public int inCollec(CollNews coll) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						int one = session.insert("a.b.inCollec", coll);
						
						session.commit();
						session.close();
						return one;
					}
					
					
					/**
					 * 根据用户的id来查找该用户收藏的新闻
					 * @param u_id
					 * @return
					 * @throws IOException
					 */
		
					@Override
					public List<NewsBean> selColl(int u_id) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						
						 List<NewsBean> list = session.selectList("a.b.selColl", u_id);
						session.close();
						return list;
					}
					
					
					/**
					 * 热点新闻推荐（根据新闻的阅读量进行排序）
					 * @return
					 * @throws IOException
					 */
					@Override
					public List<NewsBean> selNewsByCl() throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						List<NewsBean> list = session.selectList("a.b.selNewsByCl");
						
						session.close();
						return list;
					}

					/**
					 * 根据新闻的栏目名称来查询新闻的信息
					 * @param f_name
					 * @return
					 * @throws IOException
					 */
					@Override
					public List<NewsBean> selNewsByfn(String f_name) throws IOException {
						//加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();	
						
						List<NewsBean> list = session.selectList("a.b.selNewsByfn", f_name);
						session.close();
						return list;
					}
}

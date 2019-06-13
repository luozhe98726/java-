package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.ClassifyNews;
import com.hncu.util.CollNews;
import com.hncu.util.NewsBean;
/**
 * 新闻类增删改查
 * @author LuoZhe
 *
 */
public interface NewsService {
		/**
		 * 插入新闻的分类信息
		 * @param cNews
		 * @return
		 */
		int inCaNews(ClassifyNews cNews) throws IOException ;
		
		/**
		 * 查询新闻栏目名的信息
		 * @return
		 */
		List<ClassifyNews> selcfNews() throws IOException;
		
		/**
		 * 根据栏目名称来查找id
		 * @param f_name
		 * @return
		 * @throws IOException
		 */
		int selClId(String f_name) throws IOException;
		
		
		/**
		 * 根据栏目
		 * id删除新闻栏目
		 * @param f_id
		 * @return
		 * @throws IOException
		 */
		int declnews(int f_id) throws IOException;
		
		/**
		 * 插入新闻信息
		 * @param news
		 * @return
		 * @throws IOException
		 */
		int inNews(NewsBean news) throws IOException;
		
		
		/**
		 * 查询所有的新闻信息
		 * @return
		 * @throws IOException
		 */
		List<NewsBean> selNews()  throws IOException;
		
		/**
		 * 根据新闻id来删除新闻
		 * @param p_newsId
		 * @return
		 * @throws IOException
		 */
		int deNewsById(int p_newsId) throws IOException;
		
		/**
		 * 发布新闻，更新新闻状态（发表新闻）
		 * @param p_newsId
		 * @return
		 * @throws IOException
		 */
		int upNewsPo(int p_newsId) throws IOException;
		
		
		/**
		 * ，更新新闻状态(下架新闻)
		 * @param p_newsId
		 * @return
		 * @throws IOException
		 */
		int upNewsPo2(int p_newsId) throws IOException;
		
		/**
		 * 根据新闻id来查询文章是否已经被发表
		 * @param p_newsId
		 * @return
		 * @throws IOException
		 */
		int selNewsPo(int p_newsId)  throws IOException;
		
		
		/**
		 * 根据新闻的id来查找新闻的信息
		 * @return
		 * @throws IOException
		 */
		List<NewsBean> selNewsById(int p_newsId)  throws IOException;
		
		/**
		 * 根据新闻的id来修改新闻的信息
		 * @param news
		 * @return
		 * @throws IOException
		 */
		int upNewsById(NewsBean news) throws IOException;
		
		/**
		 * 查询最新的新闻，从最后一条开始查询
		 * @return
		 * @throws IOException
		 */
		List<NewsBean> selNewsZuixin()  throws IOException;
		
		
		/**
		 * 根据新闻的id来查询这条新闻的阅读量
		 * @return
		 */
		int	selClick(int p_newsId)throws IOException;
		
		
		/**
		 * 更新新闻的阅读量
		 * @param p_click
		 * @return
		 * @throws IOException
		 */
		int upClick(int p_click,int p_newsId) throws IOException;
		
		/**
		 * 收藏夹，用户点击收藏，
		 * @param coll
		 * @return
		 * @throws IOException
		 */
		int inCollec(CollNews coll) throws IOException;
		
		/**
		 * 根据用户的id来查找该用户收藏的新闻
		 * @param u_id
		 * @return
		 * @throws IOException
		 */
		List<NewsBean> selColl(int u_id) throws IOException;
		
		/**
		 * 热点新闻推荐（根据新闻的阅读量进行排序）
		 * @return
		 * @throws IOException
		 */
		List<NewsBean> selNewsByCl()  throws IOException;
		
		/**
		 * 根据新闻的栏目名称来查询新闻的信息
		 * @param f_name
		 * @return
		 * @throws IOException
		 */
		List<NewsBean> selNewsByfn(String f_name) throws IOException;
}

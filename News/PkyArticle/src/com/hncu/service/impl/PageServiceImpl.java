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

import com.hncu.service.PageService;
import com.hncu.util.NewsBean;
import com.hncu.util.PageInfo;
import com.hncu.util.UserBean;

public class PageServiceImpl implements PageService {
		
		/**
		 * 分页查询用户的信息
		 * @param pageNum显示的当前的页数 pageSize一页要显示的行数
		 * @param pageSize
		 * @return
		 * @throws IOException 
		 */
		@Override
		public PageInfo selUserPa(int pageNum, int pageSize) throws IOException {
//			加载配置文件mybatis.xml
			InputStream in = Resources.getResourceAsStream("mybatis.xml");
//			使用工厂设计模式,创建工厂 和 构建者模式
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
//			利用工厂来生产SQL Session对象
			SqlSession session = factory.openSession();
			Map<String,Object> map = new HashMap<>();	
			map.put("pageSize", pageSize);
			map.put("pageStart", pageSize*(pageNum-1));
			List<UserBean> list = session.selectList("a.b.selUserPa",map);
			int Toel = session.selectOne("a.b.selCount");//查询到的总行数
			
			
//			将参数存入到pageInfo对象中
			PageInfo pi = new PageInfo();
			pi.setPageNum(pageNum);//当前是第几页
			pi.setPageSize(pageSize);//当前页面显示的数据的行数
			pi.setPageList(list);//当前页面 需要显示的信息
			pi.setPageToel(Toel % pageSize==0 ? Toel/pageSize :  Toel/pageSize+1);//表示总的页数
			pi.setPageLine(Toel);
			session.close();
			
			System.out.println(list);
			
			return pi;
			
		
		}

		/**
		 * 分页查询用户的信息
		 * @param pageNum显示的当前的页数 pageSize一页要显示的行数
		 * @param pageSize
		 * @return
		 * @throws IOException 
		 */
		@Override
		public PageInfo selNewsPa(int pageNum, int pageSize) throws IOException {
//			加载配置文件mybatis.xml
			InputStream in = Resources.getResourceAsStream("mybatis.xml");
//			使用工厂设计模式,创建工厂 和 构建者模式
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
//			利用工厂来生产SQL Session对象
			SqlSession session = factory.openSession();
			Map<String,Object> map = new HashMap<>();	
			map.put("pageSize", pageSize);
			map.put("pageStart", pageSize*(pageNum-1));
			List<UserBean> list = session.selectList("a.b.selNewsPa",map);//查询到的信息
			int Toel = session.selectOne("a.b.selNCount");//查询到的总行数
			
			
//			将参数存入到pageInfo对象中
			PageInfo pi = new PageInfo();
			pi.setPageNum(pageNum);//当前是第几页
			pi.setPageSize(pageSize);//当前页面显示的数据的行数
			pi.setPageList(list);//当前页面 需要显示的信息
			pi.setPageToel(Toel % pageSize==0 ? Toel/pageSize :  Toel/pageSize+1);//表示总的页数
			pi.setPageLine(Toel);
			session.close();
			
			System.out.println(list);
			
			return pi;
			
		
		}

		
		/**
		 * 分页显示用户搜索的内容
		 * @param pageNum
		 * @param pageSize
		 * @param p_newsTitle
		 * @return
		 * @throws IOException
		 */
		@Override
		public PageInfo selNewsByName(int pageNum, int pageSize, String p_newsTitle) throws IOException {
//			加载配置文件mybatis.xml
			InputStream in = Resources.getResourceAsStream("mybatis.xml");
//			使用工厂设计模式,创建工厂 和 构建者模式
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
//			利用工厂来生产SQL Session对象
			SqlSession session = factory.openSession();
			
			Map<String,Object> map = new HashMap<>();	
			map.put("pageSize", pageSize);
			map.put("pageStart", pageSize*(pageNum-1));
			map.put("p_newsTitle", p_newsTitle);
			List<NewsBean> list = session.selectList("a.b.selNewsByName", map);
			int Toel =  session.selectOne("a.b.selNsCount", p_newsTitle);
			
			
//			将参数存入到pageInfo对象中
			PageInfo pi = new PageInfo();
			pi.setPageNum(pageNum);//当前是第几页
			pi.setPageSize(pageSize);//当前页面显示的数据的行数
			pi.setPageList(list);//当前页面 需要显示的信息
			pi.setPageToel(Toel % pageSize==0 ? Toel/pageSize :  Toel/pageSize+1);//表示总的页数
			pi.setPageLine(Toel);
			
			session.close();
			return pi;
		}


}

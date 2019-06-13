package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.service.ComService;
import com.hncu.util.ComBean;

public class ComServiceImpl implements ComService {
		
	
				/**
				 * 插入评论信息
				 * @param com
				 * @return
				 * @throws IOException 
				 */
			@Override
			public int inCom(ComBean com) throws IOException {
				//		加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//		使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				int one = session.insert("a.b.inCom", com);
				
				session.commit();
				session.close();
				return one;
			}

			/**
			 * 显示新闻的评论信息
			 * @param p_newsId 新闻id
			 * @return
			 */
			@Override
			public List<ComBean> selCom(int p_newsId) throws IOException  {
				//		加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//		使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				List<ComBean> list = session.selectList("a.b.selCom", p_newsId);
				
				session.close();
				return list;
			}

}

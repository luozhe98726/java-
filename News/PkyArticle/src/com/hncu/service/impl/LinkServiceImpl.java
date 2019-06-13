package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.service.LinkService;
import com.hncu.util.LinkBeans;

public class LinkServiceImpl implements LinkService {
			/**
			 * 添加友情链接
			 * @param link
			 * @return
			 */
			@Override
			public int inLink(LinkBeans link) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
							int one = session.insert("a.b.inLink", link);
							
							
						session.commit();
						session.close();
						return one;
			}
		
			
			/**
			 * 根据链接的id来查询链接信息
			 * @param l_id
			 * @return
			 */
			@Override
			public List<LinkBeans> selLink() throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						 List<LinkBeans> list = session.selectList("a.b.selLink", "l_id");
						
						
						session.close();
							return list;
			}

			/**
			 * 根据链接的id来删除链接
			 * @param l_id
			 * @return
			 */
			@Override
			public int deLink(int l_id) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
							int one = session.delete("a.b.deLink", l_id);
						
						
						session.commit();
						session.close();
						return one;
			}

			/**
			 * 修改友情链接
			 * @param link
			 * @return
			 */
			@Override
			public int upLink(LinkBeans link) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						int one = session.update("a.b.upLink",link);
						
						
						session.commit();
						session.close();
						return one;
			}

			/**
			 * 根据链接的id来查询链接信息
			 * @param l_id
			 * @return
			 * @throws IOException
			 */
			@Override
			public List<LinkBeans> selLinkById(int l_id) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						
						List<LinkBeans> list = session.selectList("a.b.selLinkById", l_id);
						session.close();
						return list;
			}

}

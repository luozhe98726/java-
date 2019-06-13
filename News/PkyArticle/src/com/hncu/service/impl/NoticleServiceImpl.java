package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.service.NoticleService;
import com.hncu.util.LinkBeans;
import com.hncu.util.NoticleBeans;

public class NoticleServiceImpl implements NoticleService {
			/**
			 * 添加公告
			 * @param link
			 * @return
			 */
			@Override
			public int inNotic(NoticleBeans noticle) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
							int one = session.insert("a.b.inNotic", noticle);
								session.commit();
								session.close();
								return one;
			}

			/**
			 * 查询公告
			 * @param l_id
			 * @return
			 */
			@Override
			public List<NoticleBeans> selNotic() throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						
						List<NoticleBeans> list = session.selectList("a.b.selNotic");
							session.close();
						return list;
			}
			/**
			 * 根据链接的id来删除公告
			 * @param l_id
			 * @return
			 */
			@Override
			public int deNotic(int n_id) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						
						int one = session.delete("a.b.deNotic", n_id);
						
						session.commit();
						session.close();
							return one;
			}
			/**
			 * 修改公告
			 * @param link
			 * @return
			 */
			@Override
			public int upNotic(NoticleBeans noticle) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
							int one = session.update("a.b.upNotic",noticle );
								session.commit();
								session.close();
							return one;
			}

			/**
			 * 根据链接的id来查询公告
			 * @param l_id
			 * @return
			 * @throws IOException
			 */
			@Override
			public List<NoticleBeans> selNoticById(int n_id) throws IOException {
//				加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						
						List<NoticleBeans> list = session.selectList("a.b.selNoticById", n_id);
							session.close();
						
						return list;
			}

}

package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import org.apache.catalina.Session;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.service.UserService;
import com.hncu.util.UserBean;

public class UserServiceImpl implements UserService {
	
	
			/**
			 * 添加用户到数据库
			 */
			@Override
			public int inUser(UserBean user) throws IOException {
			//	加载配置文件
					InputStream in = Resources.getResourceAsStream("mybatis.xml");
			//		使用工厂设计模式
					SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
					SqlSession session = factory.openSession();
					
					int one = session.insert("a.b.inUser",user );
					session.commit();
					session.close();
					return one;
			}
		
			
			/**
			 * 用过用户名 和密码来查询用户	
			 */
			@Override
			public List<UserBean> selByup(UserBean user) throws IOException {
		//		加载配置文件
					InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//			使用工厂设计模式
					SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
					SqlSession session = factory.openSession();
						
					List<UserBean> list = session.selectList("a.b.selByup", user);
					session.close();
					return list;
					
			}
			
			
			/**
			 * 查询全部的用户
			 */
			@Override
			public List<UserBean> selAll() throws IOException {
		//		加载配置文件
					InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//			使用工厂设计模式
					SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
					SqlSession session = factory.openSession();
				
					List<UserBean> list = session.selectList("a.b.selAll");
					session.close();
					return list;
			}

			
			
			/**
			 * 根据用户id来删除用户
			 * @return
			 * @throws IOException
			 */
			@Override
			public int deUserById(UserBean user) throws IOException {
//				加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				
				int one = session.delete("a.b.deUserById",user);
				session.commit();
				session.close();
				return one;
			}



			/**
			 * 查询所有的用户名
			 * @return
			 */
			@Override
			public List<UserBean> selUname() throws IOException {
				//加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				List<UserBean> list = session.selectList("a.b.selUname");
				session.close();
				return list;
			}

			/**
			 * 查询用户的状态
			 * @param u_id
			 * @return
			 * @throws IOException
			 */
			@Override
			public int selFre(int u_id) throws IOException {
				//加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				int one = session.selectOne("a.b.selFre", u_id);
				
				session.close();
				return one;
			}

			/**
			 * 更新用户的状态
			 * @param user
			 * @return
			 */
			@Override
			public int upFre(UserBean user) throws IOException {
				//加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				int one = session.update("a.b.upFre", user);
				
				session.commit();
				session.close();
				return one;
			}

			/**
			 * 修改用户密码
			 * @param u_password
			 * @param u_username
			 * @return
			 * @throws IOException
			 */
			@Override
			public int upPs(String u_password, String u_username) throws IOException {
				//加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				
				Map<String, Object> map = new HashMap<>();
				map.put("u_password", u_password);
				map.put("u_username", u_username);
				int one = session.update("a.b.upPs", map);
				session.commit();
				session.close();
				
				return one;
			}

			/**
			 * 根据用户id来查询用户的信息
			 * @param u_id
			 * @return
			 * @throws IOException
			 */
			@Override
			public List<UserBean> selUserbyId(int u_id) throws IOException {
				//加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				List<UserBean> list = session.selectList("a.b.selUserbyId", u_id);
				
				
				session.close();
				
				return list;
			}

			 /**
			  * 根据用户的id来修改用户的信息
			  * @param user
			  * @return
			  * @throws IOException
			  */
			@Override
			public int upUserbyId(UserBean user) throws IOException {
				//加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
	//			使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				int one = session.update("a.b.upUserbyId", user);
				
				session.commit();
				session.close();
				
				return one;
			}

		
}

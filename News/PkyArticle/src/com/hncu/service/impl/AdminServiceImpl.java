package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.service.AdminService;
import com.hncu.util.AdminBeans;

public class AdminServiceImpl implements AdminService {
			/**
			 * 根据用户名和密码来查寻用户
			 * @param admin
			 * @return
			 * @throws IOException 
			 */
			@Override
			public List<AdminBeans> selAdByup(AdminBeans admin) throws IOException {
				//				加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//		使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				List<AdminBeans> list = session.selectList("a.b.selAdByup", admin);
				
				session.close();
				return list;
			}

}

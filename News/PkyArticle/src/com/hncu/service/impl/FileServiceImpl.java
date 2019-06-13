package com.hncu.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hncu.service.FileService;
import com.hncu.util.FileBean;
import com.hncu.util.PhotoBean;

public class FileServiceImpl implements FileService {
	/**
	 * 上传文件
	 * @param file
	 * @return
	 * @throws IOException 
	 */
	@Override
	public int inFile(FileBean file) throws IOException {
//		加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//		使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				
				int one = session.insert("a.b.inFile", file);
				System.out.println(file.getPf_image());
				session.commit();	
				session.close();			
				return one;
	}
	/**
	  * 查询所有的文件
	  * @return
	  * @throws IOException
	  */

	@Override
	public List<FileBean> selAllFile() throws IOException {
//		加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//		使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				List<FileBean> list = session.selectList("a.b.selAllFile");
				session.close();
				return list;
	}
	
	 /**
	  * 根据文件编号查询文件
	  * @param pf_id
	  * @return
	  * @throws IOException
	  */
	@Override
	public List<FileBean> selFile(int pf_id) throws IOException {
//		加载配置文件
				InputStream in = Resources.getResourceAsStream("mybatis.xml");
		//		使用工厂设计模式
				SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
				SqlSession session = factory.openSession();
				
					List<FileBean> list = session.selectList("a.b.selFile", pf_id);
					session.close();
					return list;
	}
		
				/**
				 * 上传头像
				 * @param file
				 * @return
				 * @throws IOException 
				 */
					@Override
				public int inPhoto(PhotoBean photo) throws IOException {
//						加载配置文件
						InputStream in = Resources.getResourceAsStream("mybatis.xml");
				//		使用工厂设计模式
						SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
						SqlSession session = factory.openSession();
						
						int one = session.insert("a.b.inPhoto", photo);
						session.commit();
						session.close();
						
						return one;
				}
					
					/**
					 *查询头像信息
					 */
				@Override
				public List<PhotoBean> selPhoto(int u_id) throws IOException {
//					加载配置文件
					InputStream in = Resources.getResourceAsStream("mybatis.xml");
			//		使用工厂设计模式
					SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
					SqlSession session = factory.openSession();
					
					List<PhotoBean> list = session.selectList("a.b.selPhoto", u_id);
					session.close();
					return list;
				}

}

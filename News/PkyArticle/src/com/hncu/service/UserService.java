package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.UserBean;

/**
 * 用户的登录注册操作
 * @author LuoZhe
 *
 */
public interface UserService {
		/**
		 * 插入用户信息
		 * @param user
		 * @return
		 * @throws IOException
		 */
		int inUser(UserBean user) throws IOException;
		
		/**
		 * 根据用户名和密码来查找用户
		 * @param user
		 * @return
		 */
		List<UserBean> selByup(UserBean user) throws IOException ;
		
		/**
		 * 查询全部的用户信息，方便管理员对用户进行操作
		 * @return
		 * @throws IOException
		 */
		List<UserBean> selAll() throws IOException;
		
		/**
		 * 根据用户id来删除用户
		 * @return
		 * @throws IOException
		 */
		int deUserById(UserBean user) throws IOException;
		
		/**
		 * 查询所有的用户名
		 * @return
		 */
		List<UserBean> selUname() throws IOException;
		
		/**
		 * 查询用户的状态
		 * @param u_id
		 * @return
		 * @throws IOException
		 */
		int selFre(int u_id) throws IOException;
		
		
		/**
		 * 更新用户的状态
		 * @param user
		 * @return
		 */
		int upFre(UserBean user) throws IOException;
		
		/**
		 * 修改用户密码
		 * @param u_password
		 * @param u_username
		 * @return
		 * @throws IOException
		 */
		int upPs(String u_password,String u_username) throws IOException;
		
		
		/**
		 * 根据用户id来查询用户的信息
		 * @param u_id
		 * @return
		 * @throws IOException
		 */
		 List<UserBean> selUserbyId(int u_id) throws IOException;
		 
		 /**
		  * 根据用户的id来修改用户的信息
		  * @param user
		  * @return
		  * @throws IOException
		  */
		 int upUserbyId(UserBean user) throws IOException;
		 
}

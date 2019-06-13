package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.AdminBeans;

public interface AdminService {
	/**
	 * 根据用户名和密码来查寻用户
	 * @param admin
	 * @return
	 */
	List<AdminBeans> selAdByup(AdminBeans admin) throws IOException ;
}

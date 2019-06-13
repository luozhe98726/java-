package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.LinkBeans;
import com.hncu.util.NoticleBeans;

public interface NoticleService {
			/**
			 * 添加公告
			 * @param link
			 * @return
			 */
			 int inNotic(NoticleBeans noticle) throws IOException;
			
			/**
			 * 查询公告
			 * @param l_id
			 * @return
			 */
			 List<NoticleBeans> selNotic() throws IOException ;
			
			/**
			 * 根据链接的id来删除公告
			 * @param l_id
			 * @return
			 */
			int deNotic(int n_id) throws IOException ;
			
			/**
			 * 修改公告
			 * @param link
			 * @return
			 */
			int upNotic(NoticleBeans noticle) throws IOException;
			
			/**
			 * 根据链接的id来查询公告
			 * @param l_id
			 * @return
			 * @throws IOException
			 */
			List<NoticleBeans> selNoticById(int n_id) throws IOException;
			
	
}

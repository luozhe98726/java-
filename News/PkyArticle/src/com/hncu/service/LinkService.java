package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.LinkBeans;

public interface LinkService {
		/**
		 * 添加友情链接
		 * @param link
		 * @return
		 */
		 int inLink(LinkBeans link) throws IOException;
		
		/**
		 * 查询链接信息
		 * @param l_id
		 * @return
		 */
		 List<LinkBeans> selLink() throws IOException ;
		
		/**
		 * 根据链接的id来删除链接
		 * @param l_id
		 * @return
		 */
		int deLink(int l_id) throws IOException ;
		
		/**
		 * 修改友情链接
		 * @param link
		 * @return
		 */
		int upLink(LinkBeans link) throws IOException;
		
		/**
		 * 根据链接的id来查询链接信息
		 * @param l_id
		 * @return
		 * @throws IOException
		 */
		List<LinkBeans> selLinkById(int l_id) throws IOException;
		
		
}

package com.hncu.service;

import java.io.IOException;

import com.hncu.util.PageInfo;

public interface PageService {
	
		/**
		 * 
		 * @param pageNum显示的当前的页数 pageSize一页要显示的行数
		 * @param pageSize
		 * @return
		 */
		PageInfo selUserPa(int pageNum, int pageSize) throws IOException ;
		
		/**
		 * 
		 * @param pageNum显示的当前的页数 pageSize一页要显示的行数
		 * @param pageSize
		 * @return
		 */
		PageInfo selNewsPa(int pageNum, int pageSize) throws IOException ;
		
		
		/**
		 * 分页显示用户搜索的内容
		 * @param pageNum
		 * @param pageSize
		 * @param p_newsTitle
		 * @return
		 * @throws IOException
		 */
		PageInfo selNewsByName(int pageNum, int pageSize,String p_newsTitle)throws IOException;
}

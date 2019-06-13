package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.ComBean;

public interface ComService {
	
			/**
			 * 插入评论信息
			 * @param com
			 * @return
			 */
			int inCom(ComBean com) throws IOException;
			
			/**
			 * 显示新闻的评论信息
			 * @param p_newsId 新闻id
			 * @return
			 */
			List<ComBean> selCom(int p_newsId) throws IOException;
}	

package com.hncu.service;

import java.io.IOException;
import java.util.List;

import com.hncu.util.FileBean;
import com.hncu.util.PhotoBean;

public interface FileService {
	
	/**
	 * 上传文件
	 * @param file
	 * @return
	 */
	 int inFile(FileBean file) throws IOException;
	 
	 
	 /**
	  * 查询所有的文件
	  * @return
	  * @throws IOException
	  */
	 List<FileBean> selAllFile() throws IOException;
	 
	 /**
	  * 根据文件编号查询文件
	  * @param pf_id
	  * @return
	  * @throws IOException
	  */
	 List<FileBean> selFile(int pf_id) throws IOException;
	 
	 
	 
	 /**
		 * 上传头像
		 * @param file
		 * @return
		 */
		 int inPhoto(PhotoBean photo) throws IOException;
		 
		 
		
		 /**
		  * 根据用户id查询头像
		  * @param pf_id
		  * @return
		  * @throws IOException
		  */
		 List<PhotoBean> selPhoto(int u_id) throws IOException;
}

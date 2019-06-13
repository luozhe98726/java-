package com.hncu.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.hncu.service.FileService;
import com.hncu.service.impl.FileServiceImpl;
import com.hncu.util.FileBean;


@WebServlet("/DownServlet")
public class DownServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	FileService fileService = new FileServiceImpl();
       	
	protected void selFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取请求参数
				String pf_id=request.getParameter("pf_id");
				InputStream input=null;
				OutputStream output=null;
				
				System.out.println(pf_id);
				List<FileBean> list = fileService.selFile(Integer.parseInt(pf_id));
				FileBean fileBean = list.get(0);
				String path=getServletContext().getRealPath("/")+fileBean.getPf_image();
				String fileName=fileBean.getPf_name();
				response.setHeader("content-disposition", "attachment;filename="+URLEncoder.encode(fileName, "utf-8"));
				input=new FileInputStream(path);
				output=response.getOutputStream();
				IOUtils.copy(input, output);
				if(output!=null){
					output.close();
				}
				if(input!=null){
					input.close();
				}
				
				
				
				
		
		
	}

}

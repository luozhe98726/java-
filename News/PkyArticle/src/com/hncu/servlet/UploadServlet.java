package com.hncu.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.hncu.service.FileService;
import com.hncu.service.impl.FileServiceImpl;
import com.hncu.util.FileBean;
import com.hncu.util.PhotoBean;


@WebServlet("/UploadServlet")
public class UploadServlet extends BaseServlet {
		private static final long serialVersionUID = 1L;
		FileService fileService = new FileServiceImpl();
		
		/**
		 * 用户上传新闻稿件
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void inFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			//1.创建工厂
			DiskFileItemFactory factory=new DiskFileItemFactory();
			//2.获取解析器
			ServletFileUpload upload=new ServletFileUpload(factory);
			
			/*开始设置上传的文件路径*/
			Calendar c=Calendar.getInstance();//获取一个日历对象
			//获取系统的年月日用来做文件夹的分层
			String year=c.get(Calendar.YEAR)+"";//年
			int m=c.get(Calendar.MONTH)+1;
			String month=m<10?"0"+m : m+"";
			int d=c.get(Calendar.DAY_OF_MONTH);
			String day=d<10? "0"+d : d+"";
			//获取项目的绝对路径  /servlet_7/
			String basePath=getServletContext().getRealPath("/");
			System.out.println(basePath);
			//获取文件需要上传保存的路径	
			String uploadPath="/upload/"+year+"/"+month+"/"+day;
			File file=new File(basePath+uploadPath);
			if(!file.exists()){
				file.mkdirs();//如果文件不存在就创建文件
			}
			/*结束设置上传的文件路径*/
			InputStream input=null;
			OutputStream output=null;
			//Connection conn=null;
			
			try {
				//3.获取上传表单中的内容
				List<FileItem> list=upload.parseRequest(request);
				//循环遍历集合
				for(FileItem item : list){
					System.out.println("上传的属性名："+item.getFieldName());
					if(item.getFieldName().equals("file1")){
						String fileName=item.getName();//获取文件的文件名
						//为了避免文件名带了盘符需要对文件名进行字符串截取
						fileName=fileName.substring(fileName.lastIndexOf(File.separator)+1);
						//为了避免文件名重复需要加上随机数
						String myfileName=getNumber()+fileName;
						//计算文件的相对路径 用于保存数据库
						String relativePath=uploadPath+"/"+myfileName;
						//生成图片的绝对路径用于文件上传
						String realPath=basePath+relativePath;
						//获取请求输入流中的文件
						input=item.getInputStream();
						//通过绝对路径创建一个输出流
						output=new FileOutputStream(realPath);
						//复制文件
						int num=IOUtils.copy(input, output);
						System.out.println(num);
						System.out.println("需要上传的文件的大小："+item.getSize());
						System.out.println(fileName + relativePath);
				 		FileBean files = new FileBean();
						HttpSession session = request.getSession();
						String u_username = (String)session.getAttribute("u_username");
						Integer u_id =(Integer) session.getAttribute("u_id");
						files.setU_id(u_id);
						files.setPf_name(fileName);
						files.setPf_image(relativePath);
						files.setU_username(u_username);
						
						int one = fileService.inFile(files);
						if(one == 1) {
							System.out.println("添加成功");
							
							PrintWriter out =response.getWriter();
							 out.flush();
							    out.println("<script>");
							    out.println("alert('上传成功！');");
							    out.println("history.back();");
							    out.println("</script>");
						}else {
							System.out.println("添加失败");
						}
						//通过dbutil下的QueryRunner来做数据库操作
						//QueryRunner qr=new QueryRunner();
						//获取数据库链接
					//	conn=DBHelper.getConn();
						//int x=qr.update(conn, "insert into userphoto(upid,userid,photo_image,photo_name)"
							//	+ "values(1,5,?,?)", relativePath,fileName);
						//if(x==1){
						//	System.out.println("数据库保存成功");
					//	}else if(item.getFieldName().equals("file2")){
							
						//}
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				
				if(output!=null){
					output.close();
				}
				if(input!=null){
					input.close();
				}
				
				}
			
		}
		public String getNumber(){
			//获取当前时间戳
			String str=System.currentTimeMillis()+"";
			//再来几位随机数
			Random r=new Random();
			return str+(r.nextInt(90000000)+10000000);	
		}
		

	
		/**
		 * 后台显示所有的新闻稿件
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void selAllFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			/**
			 * 		 
			 * ResultSetHandler接口

			       正如它的名字所示，这一接口执行处理一个java.sql.ResultSet，将数据转变并处理为任何一种形式，这样有益于其应用而且使用起来更容易。这一组件提供了
			    ArrayHandler ：将ResultSet中第一行的数据转化成对象数组
			    ArrayListHandler将ResultSet中所有的数据转化成List，List中存放的是Object[]
			    BeanHandler ：将ResultSet中第一行的数据转化成类对象
			    BeanListHandler ：将ResultSet中所有的数据转化成List，List中存放的是类对象
			    ColumnListHandler ：将ResultSet中某一列的数据存成List，List中存放的是Object对象
			    KeyedHandler ：将ResultSet中存成映射，key为某一列对应为Map。Map中存放的是数据
			    MapHandler ：将ResultSet中第一行的数据存成Map映射
			    MapListHandler ：将ResultSet中所有的数据存成List。List中存放的是Map
			    ScalarHandler ：将ResultSet中一条记录的其中某一列的数据存成Object等转化类。
			     ResultSetHandler接口提供了一个单独的方法：Object handle(java.sql.ResultSet .rs)。
			     因此任何ResultSetHandler 的执行需要一个结果集（ResultSet）作为参数传入，
			     然后才能处理这个结果集，再返回一个对象。因为返回类型是java.lang.Object，
			     所以除了不能返回一个原始的Java类型之外，其它的返回类型并没有什么限制。
			     如果你发现这七个执行程序中没有任何一个提供了你想要的服务，你可以自己写执行程序并使用它。
			 */
			
			List<FileBean> list = fileService.selAllFile();
				if(list != null) {
					//FileBean li = list.get(0);
					System.out.println("查询成功");
					request.setAttribute("list", list);
					request.getRequestDispatcher("admin/news/newsFile.jsp").forward(request, response);
				}else {
					System.out.println("查询失败");
				}
				
		}
		
		
		
		
		
		/**
		 * 用户上传头像
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		protected void inPhoto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			//1.创建工厂
			DiskFileItemFactory factory=new DiskFileItemFactory();
			//2.获取解析器
			ServletFileUpload upload=new ServletFileUpload(factory);
			
			/*开始设置上传的文件路径*/
			Calendar c=Calendar.getInstance();//获取一个日历对象
			//获取系统的年月日用来做文件夹的分层
			String year=c.get(Calendar.YEAR)+"";//年
			int m=c.get(Calendar.MONTH)+1;
			String month=m<10?"0"+m : m+"";
			int d=c.get(Calendar.DAY_OF_MONTH);
			String day=d<10? "0"+d : d+"";
			//获取项目的绝对路径  /servlet_7/
			String basePath=getServletContext().getRealPath("/");
			System.out.println(basePath);
			//获取文件需要上传保存的路径	
			String uploadPath="/upload/"+year+"/"+month+"/"+day;
			File file=new File(basePath+uploadPath);
			if(!file.exists()){
				file.mkdirs();//如果文件不存在就创建文件
			}
			/*结束设置上传的文件路径*/
			InputStream input=null;
			OutputStream output=null;
			//Connection conn=null;
			
			try {
				//3.获取上传表单中的内容
				List<FileItem> list=upload.parseRequest(request);
				//循环遍历集合
				for(FileItem item : list){
					System.out.println("上传的属性名："+item.getFieldName());
					if(item.getFieldName().equals("file")){
						String fileName=item.getName();//获取文件的文件名
						//为了避免文件名带了盘符需要对文件名进行字符串截取
						fileName=fileName.substring(fileName.lastIndexOf(File.separator)+1);
						//为了避免文件名重复需要加上随机数
						String myfileName=getNumber()+fileName;
						//计算文件的相对路径 用于保存数据库
						String relativePath=uploadPath+"/"+myfileName;
						//生成图片的绝对路径用于文件上传
						String realPath=basePath+relativePath;
						//获取请求输入流中的文件
						input=item.getInputStream();
						//通过绝对路径创建一个输出流
						output=new FileOutputStream(realPath);
						//复制文件
						int num=IOUtils.copy(input, output);
						System.out.println(num);
						System.out.println("需要上传的文件的大小："+item.getSize());
						System.out.println(fileName + relativePath);
						PhotoBean photo = new PhotoBean();
						HttpSession session = request.getSession();
						String u_username = (String)session.getAttribute("u_username");
						Integer u_id =(Integer) session.getAttribute("u_id");
						photo.setU_id(u_id);
						photo.setU_username(u_username);
						photo.setUp_name(fileName);
						photo.setUp_image(relativePath);
						
						int one = fileService.inPhoto(photo);
						if(one == 1) {
							System.out.println("添加成功");
							session.setAttribute("photo", relativePath);
							PrintWriter out =response.getWriter();
								    out.println("<script>");
								  
							   out.println("alert('上传成功！');");
							    out.println("history.back();");
							    out.println("</script>");
								
								//response.sendRedirect("userCenter.jsp");
							   
						}else {
							System.out.println("添加失败");
						}
						//通过dbutil下的QueryRunner来做数据库操作
						//QueryRunner qr=new QueryRunner();
						//获取数据库链接
					//	conn=DBHelper.getConn();
						//int x=qr.update(conn, "insert into userphoto(upid,userid,photo_image,photo_name)"
							//	+ "values(1,5,?,?)", relativePath,fileName);
						//if(x==1){
						//	System.out.println("数据库保存成功");
					//	}else if(item.getFieldName().equals("file2")){
							
						//}
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				
				if(output!=null){
					output.close();
				}
				if(input!=null){
					input.close();
				}
				
				}
			
		}	
	}
	   




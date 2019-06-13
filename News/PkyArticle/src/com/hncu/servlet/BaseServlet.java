package com.hncu.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	
		@Override
		public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
			ServletContext con = this.getServletContext();
			System.out.println("base---");
			//设置请求和相应的编码格式
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("text/html,charset=utf-8");
			//获取前端的数据
			String methodName = request.getParameter("method");
			System.out.println("方法名"+methodName);
			//先判断方法是否为空
			if(methodName != null){
				//获取当前类Servlet的字节码文件
				Class clazz = this.getClass();
				try {
					//获取当前方法名所对应的方法
					Method m = clazz.getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
					if(m != null){
						//通过反射调用当前类的方法
						try {
							m.invoke(this,request,response);
						} catch (IllegalAccessException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IllegalArgumentException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
}
		
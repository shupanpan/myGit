/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:LoginInterceptor.java 
 * 包名:com.fh.shop.admin.interceptor 
 * 创建日期:2018年10月16日下午8:35:35 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fh.shop.admin.po.Employee;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：LoginInterceptor    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月16日 下午8:35:35    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月16日 下午8:35:35    
 * 修改备注：       
 * @version </pre>    
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

	/* (non-Javadoc)    
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)    
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("==========进入拦截器");
		String servletPath = request.getServletPath();
		if(servletPath.contains("login")){
			return true;
		}
		Employee user = (Employee) request.getSession().getAttribute("user");
		if(null != user){
			return true;
		}else{
			response.sendRedirect("login.jsp");
			return false;
		}
		
	}

	
}

/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:WebContext.java 
 * 包名:com.fh.shop.admin.util 
 * 创建日期:2018年10月17日下午2:23:30 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.util;

import javax.servlet.http.HttpServletRequest;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：WebContext    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月17日 下午2:23:30    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月17日 下午2:23:30    
 * 修改备注：       
 * @version </pre>    
 */
public class WebContext {

	public static ThreadLocal<HttpServletRequest> requestLocal = new ThreadLocal<>();
	
	public static void setRequest(HttpServletRequest request){
		requestLocal.set(request);
	}
	
	public static HttpServletRequest getRequest(){
		return requestLocal.get();
	}
	
	public static void remove(){
		requestLocal.remove();
	}
	
	
	
	
	
}

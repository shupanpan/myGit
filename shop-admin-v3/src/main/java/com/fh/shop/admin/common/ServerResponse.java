/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:ServerResponse.java 
 * 包名:com.fh.shop.admin.common 
 * 创建日期:2018年10月18日下午7:47:51 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.common;

import java.io.Serializable;


/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：ServerResponse    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月18日 下午7:47:51    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月18日 下午7:47:51    
 * 修改备注：       
 * @version </pre>    
 */
public class ServerResponse implements Serializable{

	private static final long serialVersionUID = -8900176883792304992L;

	private Integer code;
	
	private String message;
	
	private Object data;
	
	public ServerResponse(){
		
	}
	
	private ServerResponse(int code,String message,Object data){
		this.code = code;
		this.message = message;
		this.data = data;
	}
	
	public static final ServerResponse error(int code,String message){
		return new ServerResponse(code,message,null);
	}
	
	public static final ServerResponse error(){
		return new ServerResponse(-1,"出错啦！",null);
	}
	
	public static final ServerResponse error(SystemEnum systemEnum){
		return new ServerResponse(systemEnum.getCode(),systemEnum.getMessage(),null);
	}
	
	public static final ServerResponse success(Object data){
		return new ServerResponse(200,"ok",data);
	}
	
	public static final ServerResponse success(){
		return new ServerResponse(200,"ok",null);
	}

	public Integer getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public Object getData() {
		return data;
	}
	
}

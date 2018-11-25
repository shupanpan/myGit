/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:SystemEnum.java 
 * 包名:com.fh.shop.admin.common 
 * 创建日期:2018年10月19日下午2:05:08 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.common;


/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：SystemEnum    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月19日 下午2:05:08    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月19日 下午2:05:08    
 * 修改备注：       
 * @version </pre>    
 */
public enum SystemEnum {
	
	LOGIN_PASSWORD_ERROR(1004,"密码错误"),
	LOGIN_USERNAME_NOT_EXIST(1003,"用户名不存在"),
	LOGIN_CODE_ERROR(1002,"验证码错误"),
	LOGIN_USER_LOCK(1005,"该用户被锁定"),
	USER_INFO_MISS(1001,"用户登录信息不完整");
	
	private int code;
	
	private String message;

	
	private SystemEnum(int code,String message){
		this.code = code;
		this.message = message;
	}

	public Integer getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
	

}

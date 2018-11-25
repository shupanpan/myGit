/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:Log.java 
 * 包名:com.fh.shop.admin.po 
 * 创建日期:2018年10月17日下午4:56:53 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：Log    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月17日 下午4:56:53    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月17日 下午4:56:53    
 * 修改备注：       
 * @version </pre>    
 */
public class Log extends Page implements Serializable{

	private static final long serialVersionUID = 8177069751772976969L;
	
	private Integer logId;
	
	private String userName;
	
	private String info;
	
	private Integer status;
	
	private String ipAddress;
	
	private String message;
	
	@DateTimeFormat(pattern="yyyy-MM-dd hh")
	private Date createTime;
	
	private Long useTime;

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	@JsonFormat(pattern="yyyy-MM-dd hh")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getUseTime() {
		return useTime;
	}

	public void setUseTime(Long useTime) {
		this.useTime = useTime;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
	

}

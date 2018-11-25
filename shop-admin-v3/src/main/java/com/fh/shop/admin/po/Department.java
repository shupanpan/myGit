/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:Department.java 
 * 包名:com.fh.shop.admin.po 
 * 创建日期:2018年10月6日下午9:27:41 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：Department    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月6日 下午9:27:41    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月6日 下午9:27:41    
 * 修改备注：       
 * @version </pre>    
 */
public class Department implements Serializable{

	private static final long serialVersionUID = 6511041813230586347L;
	
	private Integer id;
	
	private String deptName;
	
	private Integer fatherId;
	
	private String description;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Integer getFatherId() {
		return fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@JsonFormat(pattern="yyyy-MM-dd")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "Department [id=" + id + ", deptName=" + deptName + ", fatherId=" + fatherId + ", description="
				+ description + ", createDate=" + createDate + "]";
	}


}

/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:Area.java 
 * 包名:com.fh.shop.admin.po 
 * 创建日期:2018年10月11日下午2:30:01 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：Area    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 下午2:30:01    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 下午2:30:01    
 * 修改备注：       
 * @version </pre>    
 */
public class Area implements Serializable{

	private static final long serialVersionUID = -1754265462109830056L;

	private Integer areaId;
	
	private String areaName;
	
	private Integer fatherId;

	public Integer getAreaId() {
		return areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Integer getFatherId() {
		return fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}
	
	
}

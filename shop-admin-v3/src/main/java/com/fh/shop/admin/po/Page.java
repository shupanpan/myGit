/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:Page.java 
 * 包名:com.fh.shop.admin.po 
 * 创建日期:2018年10月14日下午5:30:17 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：Page    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月14日 下午5:30:17    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月14日 下午5:30:17    
 * 修改备注：       
 * @version </pre>    
 */
public class Page implements Serializable{

	private static final long serialVersionUID = -5730665960734541320L;

	private long start;
	
	private long length;

	public long getStart() {
		return start;
	}

	public void setStart(long start) {
		this.start = start;
	}

	public long getLength() {
		return length;
	}

	public void setLength(long length) {
		this.length = length;
	}
	
	
	
	
}

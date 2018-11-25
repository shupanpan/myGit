/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:AreaMapper.java 
 * 包名:com.fh.shop.admin.mapper 
 * 创建日期:2018年10月11日下午2:38:38 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper;

import java.util.List;

import com.fh.shop.admin.po.Area;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：AreaMapper    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 下午2:38:38    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 下午2:38:38    
 * 修改备注：       
 * @version </pre>    
 */
public interface AreaMapper {

	public List<Area> findAreaList();

}

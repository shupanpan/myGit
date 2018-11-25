/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:AreaService.java 
 * 包名:com.fh.shop.admin.biz.area 
 * 创建日期:2018年10月11日下午2:34:45 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.area;

import java.util.List;

import com.fh.shop.admin.po.Area;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：AreaService    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 下午2:34:45    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 下午2:34:45    
 * 修改备注：       
 * @version </pre>    
 */
public interface AreaService {

	public List<Area> findAreaList();
}

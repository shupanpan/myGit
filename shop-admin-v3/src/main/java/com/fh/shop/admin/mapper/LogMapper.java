/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:LogMapper.java 
 * 包名:com.fh.shop.admin.controller.log 
 * 创建日期:2018年10月17日下午5:12:28 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper;

import java.util.List;

import com.fh.shop.admin.po.Log;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：LogMapper    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月17日 下午5:12:28    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月17日 下午5:12:28    
 * 修改备注：       
 * @version </pre>    
 */
public interface LogMapper {

	/** <pre>findLogList(查询日志信息)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午5:16:14    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午5:16:14    
	 * 修改备注： 
	 * @param log 
	 * @return</pre>    
	 */
	List<Log> findLogList(Log log);

	/** <pre>selectCount(这里用一句话描述这个方法的作用)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午7:10:38    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午7:10:38    
	 * 修改备注： 
	 * @param log
	 * @return</pre>    
	 */
	int selectCount(Log log);

	/** <pre>addLog(新增日志)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午7:50:46    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午7:50:46    
	 * 修改备注： 
	 * @param log</pre>    
	 */
	void addLog(Log log);

	

}

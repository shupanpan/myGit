/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:LogService.java 
 * 包名:com.fh.shop.admin.biz.log 
 * 创建日期:2018年10月17日下午5:05:17 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.log;

import java.util.List;

import com.fh.shop.admin.po.Log;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：LogService    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月17日 下午5:05:17    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月17日 下午5:05:17    
 * 修改备注：       
 * @version </pre>    
 */
public interface ILogService {

	public List<Log> findLogList(Log log);

	/** <pre>selectCount(分页查询总条数)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午7:05:55    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午7:05:55    
	 * 修改备注： 
	 * @param log
	 * @return</pre>    
	 */
	public int selectCount(Log log);

	/** <pre>addLog(新增日志到数据库)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午7:48:42    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午7:48:42    
	 * 修改备注： 
	 * @param log</pre>    
	 */
	public void addLog(Log log);
}

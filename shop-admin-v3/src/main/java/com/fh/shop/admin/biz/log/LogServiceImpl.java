/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:LogServiceImpl.java 
 * 包名:com.fh.shop.admin.biz.log 
 * 创建日期:2018年10月17日下午5:07:32 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.log;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.shop.admin.mapper.LogMapper;
import com.fh.shop.admin.po.Log;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：LogServiceImpl    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月17日 下午5:07:32    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月17日 下午5:07:32    
 * 修改备注：       
 * @version </pre>    
 */
@Service("logService")
public class LogServiceImpl implements ILogService {
	
	@Autowired
	private LogMapper logMapper;

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.log.ILogService#findLogList()    
	 */
	@Override
	public List<Log> findLogList(Log log) {
		List<Log> findLogList = logMapper.findLogList(log);
		return findLogList;
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.log.ILogService#selectCount(com.fh.shop.admin.po.Log)    
	 */
	@Override
	public int selectCount(Log log) {
		return logMapper.selectCount(log);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.log.ILogService#addLog(com.fh.shop.admin.po.Log)    
	 */
	@Override
	public void addLog(Log log) {
		logMapper.addLog(log);		
	}

}

/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:LogController.java 
 * 包名:com.fh.shop.admin.controller.log 
 * 创建日期:2018年10月17日下午6:37:08 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.log;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.objenesis.instantiator.annotations.Typology;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.biz.log.ILogService;
import com.fh.shop.admin.po.Log;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：LogController    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月17日 下午6:37:08    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月17日 下午6:37:08    
 * 修改备注：       
 * @version </pre>    
 */

@Controller
public class LogController {

	@Autowired
	private ILogService logService;
	
	@RequestMapping("/toLog")
	@com.fh.shop.admin.annotation.Log(value="跳转到log页面")
	public String toLog(){
		return "logList";
	}
	
	@RequestMapping("/log/list")
	@ResponseBody
	@com.fh.shop.admin.annotation.Log(value="查询日志列表")
	public Map findLogList(Log log){
		Map resultMap = new HashMap();
		int count = logService.selectCount(log);
		List<Log> logList = logService.findLogList(log);
		resultMap.put("status", "ok");
		resultMap.put("data", logList);
		resultMap.put("recordsTotal", count);
		resultMap.put("recordsFiltered", count);
		
		return resultMap;
	}
}

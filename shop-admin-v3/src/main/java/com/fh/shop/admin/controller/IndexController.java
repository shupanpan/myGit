/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:IndexController.java 
 * 包名:com.fh.shop.admin.controller 
 * 创建日期:2018年10月8日下午7:18:57 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.annotation.Log;
import com.fh.shop.admin.biz.dept.IDeptService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Department;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：IndexController    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月8日 下午7:18:57    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月8日 下午7:18:57    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
public class IndexController {
	
	@Resource
	private IDeptService deptService;
	
	@RequestMapping("/index")
	@Log(value="跳转到index页面")
	public String index(){
		System.out.println("==========进入index");
		return "index";
	}
	
	//删除
	@RequestMapping("/dept/deleteBatch")
	@ResponseBody
	@Log(value="删除部门")
	public ServerResponse deleteBatch(@RequestParam("ids[]") List<Integer> ids){
		
		deptService.deleteBatch(ids);
		return ServerResponse.success();
	}
	
	//修改
	@RequestMapping("/dept/update")
	@ResponseBody
	@Log(value="修改部门")
	public ServerResponse updateDept(Department dept){
	
		deptService.updateDept(dept);
		return ServerResponse.success();
	}
	
	//添加
	@RequestMapping("/dept/add")
	@ResponseBody
	@Log(value="添加部门")
	public ServerResponse addDept(Department dept){
		
		deptService.addDept(dept);
		return ServerResponse.success(dept);
		
	}
	
	//查询
	@RequestMapping("/dept/list")
	@ResponseBody
	@Log(value="查询部门树")
	public ServerResponse findDeptList(){
		
		List<Department> deptList = deptService.findDeptList();
		List<Map> resultMapList = new ArrayList<Map>();
		for (Department dept : deptList) {
			Map item = new HashMap();
			item.put("id", dept.getId());
			item.put("name", dept.getDeptName());
			item.put("pId", dept.getFatherId());
			item.put("description", dept.getDescription());
			item.put("createDate", dept.getCreateDate());
			resultMapList.add(item);
		}
		return ServerResponse.success(resultMapList);
	}

}

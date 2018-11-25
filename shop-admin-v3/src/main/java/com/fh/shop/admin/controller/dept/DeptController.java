/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:DeptController.java 
 * 包名:com.fh.shop.admin.controller.dept 
 * 创建日期:2018年10月6日下午10:30:33 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.dept;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fh.shop.admin.biz.dept.IDeptService;
import com.fh.shop.admin.po.Department;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：DeptController    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月6日 下午10:30:33    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月6日 下午10:30:33    
 * 修改备注：       
 * @version </pre>    
 */

@Controller
public class DeptController {
	
	@Resource
	private IDeptService deptService;
	
	//增加
	@RequestMapping("")
	public void addDept(Department dept){
		
		dept.setDeptName("人力资源部");
		dept.setFatherId(1);
		
		deptService.addDept(dept);
	}

}

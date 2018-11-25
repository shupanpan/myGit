/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:DeptServiceImpl.java 
 * 包名:com.fh.shop.admin.biz.dept 
 * 创建日期:2018年10月6日下午10:18:57 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.dept;

import java.util.List;

import javax.annotation.Resource;

import com.fh.shop.admin.util.CacheManager;
import org.springframework.stereotype.Service;

import com.fh.shop.admin.mapper.DeptMapper;
import com.fh.shop.admin.po.Department;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：DeptServiceImpl    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月6日 下午10:18:57    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月6日 下午10:18:57    
 * 修改备注：       
 * @version </pre>    
 */

@Service
public class DeptServiceImpl implements IDeptService {

	@Resource
	private DeptMapper deptMapper;
	
	//增加
	@Override
	public void addDept(Department dept) {
		CacheManager.getInstance().remove("deptInfoList");
		deptMapper.addDept(dept);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.dept.IDeptService#findDeptList()    
	 */
	@Override
	public List<Department> findDeptList() {
		//从缓存中找到指定数据
		Object deptInfoList = CacheManager.getInstance().getObj("deptInfoList");
		//如果该数据存在，则直接返回，不用操作数据库
		if(deptInfoList != null){
			return (List<Department>) deptInfoList;
		}
		//查询数据库
		List<Department> deptList = deptMapper.findDeptList();
		//如果没有将数据放入缓存中一份
		CacheManager.getInstance().putObj("deptInfoList",deptList);
		//将数据返回
		return deptList;
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.dept.IDeptService#updateDept(com.fh.shop.admin.po.Department)    
	 */
	@Override
	public void updateDept(Department dept) {
		CacheManager.getInstance().remove("deptInfoList");
		deptMapper.updateDept(dept);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.dept.IDeptService#deleteBatch(java.util.List)    
	 */
	@Override
	public void deleteBatch(List<Integer> ids) {
		CacheManager.getInstance().remove("deptInfoList");
		deptMapper.deleteBatch(ids);	
	}

}

/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:IDeptService.java 
 * 包名:com.fh.shop.admin.biz.dept 
 * 创建日期:2018年10月6日下午10:13:24 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.dept;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.shop.admin.po.Department;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：IDeptService    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月6日 下午10:13:24    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月6日 下午10:13:24    
 * 修改备注：       
 * @version </pre>    
 */
public interface IDeptService {
	
	/**
	 * <pre>addDept(增加部门)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午6:37:00    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午6:37:00    
	 * 修改备注： 
	 * @param dept</pre>
	 */
	public void addDept(Department dept);

	/** <pre>findDeptList(查询部门树)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午7:35:40    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午7:35:40    
	 * 修改备注： 
	 * @return</pre>    
	 */
	public List<Department> findDeptList();

	/** <pre>updateDept(修改部门节点)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午10:39:12    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午10:39:12    
	 * 修改备注： 
	 * @param dept</pre>    
	 */
	public void updateDept(Department dept);

	/** <pre>deleteBatch(删除节点)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午11:01:42    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午11:01:42    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void deleteBatch(List<Integer> ids);

}

/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:DeptMapper.java 
 * 包名:com.fh.shop.admin.mapper 
 * 创建日期:2018年10月6日下午10:26:20 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper;

import java.util.List;

import com.fh.shop.admin.po.Department;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：DeptMapper    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月6日 下午10:26:20    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月6日 下午10:26:20    
 * 修改备注：       
 * @version </pre>    
 */
public interface DeptMapper {
	
	public void addDept(Department dept);

	/** <pre>findDeptList(查询部门树)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午7:36:45    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午7:36:45    
	 * 修改备注： 
	 * @return</pre>    
	 */
	public List<Department> findDeptList();

	/** <pre>updateDept(修改部门节点)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午10:39:57    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午10:39:57    
	 * 修改备注： 
	 * @param dept</pre>    
	 */
	public void updateDept(Department dept);

	/** <pre>deleteBatch(删除节点)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月8日 下午11:03:53    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月8日 下午11:03:53    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void deleteBatch(List<Integer> ids);

}

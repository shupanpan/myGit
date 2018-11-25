/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:EmpMapper.java 
 * 包名:com.fh.shop.admin.mapper 
 * 创建日期:2018年10月11日上午10:08:29 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.mapper;

import java.util.Date;
import java.util.List;

import com.fh.shop.admin.po.Employee;
import org.apache.ibatis.annotations.Param;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：EmpMapper    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 上午10:08:29    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 上午10:08:29    
 * 修改备注：       
 * @version </pre>    
 */
public interface EmpMapper {

	public List<Employee> findEmpList(Employee emp);

	/** <pre>selectCount(这里用一句话描述这个方法的作用)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月11日 上午10:45:04    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月11日 上午10:45:04    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	public int selectCount(Employee emp);

	/** <pre>addEmp(员工新增)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月11日 下午12:06:51    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月11日 下午12:06:51    
	 * 修改备注： 
	 * @param emp</pre>    
	 */
	public void addEmp(Employee emp);

	/** <pre>deleteEmp(这里用一句话描述这个方法的作用)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月11日 下午5:32:16    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月11日 下午5:32:16    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void deleteEmp(List<Integer> ids);

	/** <pre>getEmpByLoginname(根据登录名查询员工信息)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月16日 下午7:39:23    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月16日 下午7:39:23    
	 * 修改备注： 
	 * @param loginName
	 * @return</pre>    
	 */
	public Employee getEmpByLoginname(String loginName);

	/** <pre>downLoadExcel(动态导出Excel)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月20日 上午7:31:45    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月20日 上午7:31:45    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	public List<Employee> downLoadExcel(Employee emp);


	//更新用户登录错误的信息
    void updateUserLoginErrorInfo(@Param("currentDate") Date date, @Param("userId") Integer empId);

	void updateUserLoginCount(Integer empId);

	void updateUserStatus(@Param("empId") Integer empId, @Param("status") int userLock);

    void updateUserLastLoginTime(@Param("empId") Integer empId,@Param("loginTime") Date date);

	void updateUserLoginNum(@Param("count") int i,@Param("empId") Integer empId);

    void updateUserLoginTime(@Param("id") Integer empId,@Param("date") Date date);
}

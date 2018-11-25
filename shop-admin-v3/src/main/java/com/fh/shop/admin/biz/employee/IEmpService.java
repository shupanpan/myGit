/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:EmpService.java 
 * 包名:com.fh.shop.admin.biz.employee 
 * 创建日期:2018年10月11日上午10:03:38 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.employee;

import java.util.Date;
import java.util.List;

import com.fh.shop.admin.po.Employee;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：EmpService    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 上午10:03:38    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 上午10:03:38    
 * 修改备注：       
 * @version </pre>    
 */
public interface IEmpService {

	public List<Employee> findEmpList(Employee emp);

	/** <pre>selectCount(分页查询总条数)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月11日 上午10:43:54    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月11日 上午10:43:54    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	public int selectCount(Employee emp);

	/** <pre>addEmp(员工新增)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月11日 下午12:04:46    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月11日 下午12:04:46    
	 * 修改备注： 
	 * @param emp</pre>    
	 */
	public void addEmp(Employee emp);

	/** <pre>deleteEmp(这里用一句话描述这个方法的作用)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月11日 下午5:31:39    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月11日 下午5:31:39    
	 * 修改备注： 
	 * @param ids</pre>    
	 */
	public void deleteEmp(List<Integer> ids);

	/** <pre>getEmpByLoginname(根据登录名查询用户信息)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月16日 下午7:38:30    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月16日 下午7:38:30    
	 * 修改备注： 
	 * @param loginName
	 * @return</pre>    
	 */
	public Employee getEmpByLoginname(String loginName);

	/** <pre>downLoadExcel(动态导出Excel)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月20日 上午7:30:53    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月20日 上午7:30:53    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>    
	 */
	public List<Employee> downLoadExcel(Employee emp);

	/**
	 * 更新用户登录错误的信息
	 * @param date
	 * @param empId
	 */
    void updateUserLoginErrorInfo(Date date, Integer empId);

	void updateUserLoginCount(Integer empId);

    void updateUserStatus(Integer empId, int userLock);

    void updateUserLastLoginTime(Integer empId);

    void updateUserLoginNum(int i, Integer empId);

    void updateUserLoginTime (Integer empId);
}

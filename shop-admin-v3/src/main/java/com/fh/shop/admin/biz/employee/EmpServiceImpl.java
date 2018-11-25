/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:EmpServiceImpl.java 
 * 包名:com.fh.shop.admin.biz.employee 
 * 创建日期:2018年10月11日上午10:06:11 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.biz.employee;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.fh.shop.admin.util.Md5Util;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Service;

import com.fh.shop.admin.mapper.EmpMapper;
import com.fh.shop.admin.po.Employee;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：EmpServiceImpl    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 上午10:06:11    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 上午10:06:11    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class EmpServiceImpl implements IEmpService {
	
	@Resource
	private EmpMapper empMapper;

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.EmpService#findEmpList()    
	 */
	@Override
	public List<Employee> findEmpList(Employee emp) {

		List<Employee> empList = empMapper.findEmpList(emp);
		return empList;
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.IEmpService#selectCount(com.fh.shop.admin.po.Employee)    
	 */
	@Override
	public int selectCount(Employee emp) {
		return empMapper.selectCount(emp);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.IEmpService#addEmp(com.fh.shop.admin.po.Employee)    
	 */
	@Override
	public void addEmp(Employee emp) {
		//获得密码
		String pwd = emp.getPwd();
		//获得salt
		String salt = RandomStringUtils.randomAlphanumeric(20);
		//md5结合salt进行双重加密
		String newPwd = Md5Util.md5(Md5Util.md5(pwd) + "_" + salt);
        System.err.println(newPwd);
		//重新赋值
		emp.setPwd(newPwd);
		emp.setSalt(salt);
		empMapper.addEmp(emp);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.IEmpService#deleteEmp(java.util.List)    
	 */
	@Override
	public void deleteEmp(List<Integer> ids) {
		if(null != ids && ids.size() > 0){
			empMapper.deleteEmp(ids);		
		}
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.IEmpService#getEmpByLoginname(java.lang.String)    
	 */
	@Override
	public Employee getEmpByLoginname(String loginName) {
		return empMapper.getEmpByLoginname(loginName);
	}

	/* (non-Javadoc)    
	 * @see com.fh.shop.admin.biz.employee.IEmpService#downLoadExcel(com.fh.shop.admin.po.Employee)    
	 */
	@Override
	public List<Employee> downLoadExcel(Employee emp) {
		return empMapper.downLoadExcel(emp);
	}

	//更新用户登录错误信息
	@Override
	public void updateUserLoginErrorInfo(Date date, Integer empId) {
		empMapper.updateUserLoginErrorInfo(date,empId);
	}

	@Override
	public void updateUserLoginCount(Integer empId) {
		empMapper.updateUserLoginCount(empId);
	}

	@Override
	public void updateUserStatus(Integer empId, int userLock) {
		empMapper.updateUserStatus(empId,userLock);
	}

	@Override
	public void updateUserLastLoginTime(Integer empId) {
		empMapper.updateUserLastLoginTime(empId,new Date());
	}

	@Override
	public void updateUserLoginNum(int i, Integer empId){
		empMapper.updateUserLoginNum(i,empId);
	}

	@Override
	public void updateUserLoginTime(Integer empId) {
		empMapper.updateUserLoginTime(empId,new Date());
	}
}

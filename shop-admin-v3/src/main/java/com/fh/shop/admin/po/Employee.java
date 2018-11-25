/** 
 * <pre>项目名称:shop-admin-v2 
 * 文件名称:Employee.java 
 * 包名:com.fh.shop.po 
 * 创建日期:2018年10月10日上午9:47:41 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fh.shop.admin.biz.dept.DeptServiceImpl;

/** 
 * <pre>项目名称：shop-admin-v2    
 * 类名称：Employee    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月10日 上午9:47:41    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月10日 上午9:47:41    
 * 修改备注：       
 * @version </pre>    
 */
public class Employee extends Page implements Serializable{

	private static final long serialVersionUID = 1873407007870382318L;
	
	private Integer empId;
	
	private String empName;
	
	private Integer empSex;
	
	private String loginName;
	
	private String pwd;
	
	private String imgCode;

	private Integer loginCount;

	private Date lastLoginTime;

	private String lastLoginDate;

	public String getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	private Department dept = new Department();
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	
	private Double salary;
	
	private List<Integer> idList = new ArrayList<Integer>();
	
	private Double minSalary;
	
	private Double maxSalary;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date minDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date maxDate;

	private Integer loginErrorCount;

	private Date loginErrorTime;

	private Integer status;

	private String salt;

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getEmpSex() {
		return empSex;
	}

	public void setEmpSex(Integer empSex) {
		this.empSex = empSex;
	}

	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	
	public Double getMinSalary() {
		return minSalary;
	}

	public void setMinSalary(Double minSalary) {
		this.minSalary = minSalary;
	}

	public Double getMaxSalary() {
		return maxSalary;
	}

	public void setMaxSalary(Double maxSalary) {
		this.maxSalary = maxSalary;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	public Date getMinDate() {
		return minDate;
	}

	public void setMinDate(Date minDate) {
		this.minDate = minDate;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	public Date getMaxDate() {
		return maxDate;
	}

	public void setMaxDate(Date maxDate) {
		this.maxDate = maxDate;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public String getImgCode() {
		return imgCode;
	}

	public void setImgCode(String imgCode) {
		this.imgCode = imgCode;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public Integer getLoginErrorCount() {
		return loginErrorCount;
	}

	public void setLoginErrorCount(Integer loginErrorCount) {
		this.loginErrorCount = loginErrorCount;
	}

	public Date getLoginErrorTime() {
		return loginErrorTime;
	}

	public void setLoginErrorTime(Date loginErrorTime) {
		this.loginErrorTime = loginErrorTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Employee{" +
				"empId=" + empId +
				", empName='" + empName + '\'' +
				", empSex=" + empSex +
				", loginName='" + loginName + '\'' +
				", pwd='" + pwd + '\'' +
				", imgCode='" + imgCode + '\'' +
				", dept=" + dept +
				", birthday=" + birthday +
				", salary=" + salary +
				", idList=" + idList +
				", minSalary=" + minSalary +
				", maxSalary=" + maxSalary +
				", minDate=" + minDate +
				", maxDate=" + maxDate +
				", loginErrorCount=" + loginErrorCount +
				", loginErrorTime=" + loginErrorTime +
				", status=" + status +
				'}';
	}
}
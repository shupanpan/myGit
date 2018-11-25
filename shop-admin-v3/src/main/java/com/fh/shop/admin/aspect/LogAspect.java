/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:LogAspect.java 
 * 包名:com.fh.shop.admin.aspect 
 * 创建日期:2018年10月13日下午4:46:09 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.aspect;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.fh.shop.admin.biz.log.ILogService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Employee;
import com.fh.shop.admin.po.Log;
import com.fh.shop.admin.util.IpUtil;
import com.fh.shop.admin.util.SystemConstant;
import com.fh.shop.admin.util.WebContext;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：LogAspect    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月13日 下午4:46:09    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月13日 下午4:46:09    
 * 修改备注：       
 * @version </pre>    
 */
@Component("logAspectInfo")
public class LogAspect {

	public static final Logger LOG = LoggerFactory.getLogger(LogAspect.class);
	
	@Resource(name="logService")
	private ILogService logService;
	
	public Object doLog(ProceedingJoinPoint pjp){
		//获取方法签名
		MethodSignature signature = (MethodSignature) pjp.getSignature();
		//获取方法
		Method method = signature.getMethod();
		String message = "";
		//判断方法上是否有指定的注解
		if(method.isAnnotationPresent(com.fh.shop.admin.annotation.Log.class)){
			com.fh.shop.admin.annotation.Log logAnnotation = method.getAnnotation(com.fh.shop.admin.annotation.Log.class);
			message = logAnnotation.value();
		}
		
		
		//获取调用的类
		String className = pjp.getTarget().getClass().getCanonicalName();
		//获取调用的方法
		String methodName = signature.getName();
		//调用webContext类里的getRequest()获得session中的user
		HttpServletRequest request = WebContext.getRequest();
		Employee userInfo = (Employee) request.getSession().getAttribute("user");
		String userName = "";
		if(null != userInfo){
			userName = userInfo.getEmpName();
		}
		Object result = null;
		
		long end = 0L;
		long start = 0L;
		try {
			 start = System.currentTimeMillis();
			//执行真正的业务
			result = pjp.proceed();
			 end = System.currentTimeMillis();
			 
			//给log实体类赋值
			Log log = new Log();
			insertDBLog(className, methodName, request, userName, end, start, log,SystemConstant.LOG_SUCCESS,null,message);
			 
			LOG.info("用户{}操作了{}层的{}方法,消耗{}毫秒",userName,className,methodName,(end-start));
		} catch (Throwable e) {
			e.printStackTrace();
			
			//给log实体类赋值
			Log log = new Log();
			insertDBLog(className, methodName, request, userName, end, start, log,SystemConstant.LOG_FAIL,e,message);

			LOG.error("用户{}操作{}层的{}的方法出现异常：{},消耗{}毫秒",userName,className,methodName,e,(end-start));
			return ServerResponse.error();
		}
		return result;
	}

	/** <pre>insertDBLog(这里用一句话描述这个方法的作用)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月18日 下午2:55:23    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月18日 下午2:55:23    
	 * 修改备注： 
	 * @param className
	 * @param methodName
	 * @param request
	 * @param userName
	 * @param end
	 * @param start
	 * @param log</pre>    
	 */
	private void insertDBLog(String className, String methodName, HttpServletRequest request, String userName, long end,
			long start, Log log,int status,Throwable e,String message) {
		String ipAddress = IpUtil.getIpAddress( request);
		log.setIpAddress(ipAddress);
		log.setCreateTime(new Date());
		log.setUserName(userName);
		log.setUseTime((end-start));
		log.setInfo(className+":"+methodName+(e == null? "":":"+e));
		log.setMessage(message);
		log.setStatus(status);
		//调用service层插入数据库
		logService.addLog(log);
	}
	
}

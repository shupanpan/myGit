/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:Log.java 
 * 包名:com.fh.shop.admin.annotation 
 * 创建日期:2018年10月18日下午6:52:26 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：Log    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月18日 下午6:52:26    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月18日 下午6:52:26    
 * 修改备注：       
 * @version </pre>    
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {

	String value() default "";
}

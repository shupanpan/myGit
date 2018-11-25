/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:AreaController.java 
 * 包名:com.fh.shop.admin.controller 
 * 创建日期:2018年10月11日下午2:52:33 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.area;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.biz.area.AreaService;
import com.fh.shop.admin.po.Area;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：AreaController    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 下午2:52:33    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 下午2:52:33    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
public class AreaController {
	
	@Resource
	private AreaService areaService;
	
	//跳转到area页面
	@RequestMapping("/toArea")
	public String toArea(){
		return "area";
		
	}
	
	//查询地区菜单
	@RequestMapping("/area/list")
	@ResponseBody
	public Map findAreaList(){
		Map resultMap = new HashMap();
		try {
			List<Area> areaList = areaService.findAreaList();
			List<Map> resultMapList = new ArrayList<Map>();
			for (Area area : areaList) {
				Map item = new HashMap();
				item.put("id", area.getAreaId());
				item.put("name", area.getAreaName());
				item.put("pId", area.getFatherId());
				resultMapList.add(item);
			}
			resultMap.put("status", "ok");
			resultMap.put("data", resultMapList);
			
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", "error");
			throw new RuntimeException(e);
		}
		return resultMap;
	}
}

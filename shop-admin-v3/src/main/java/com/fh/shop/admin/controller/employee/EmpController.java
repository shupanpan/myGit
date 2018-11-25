/** 
 * <pre>项目名称:shop-admin-v3 
 * 文件名称:EmpController.java 
 * 包名:com.fh.shop.admin.controller.employee 
 * 创建日期:2018年10月11日上午10:16:44 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.fh.shop.admin.controller.employee;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fh.shop.admin.util.DateUtil;
import com.fh.shop.admin.util.Md5Util;
import com.fh.shop.admin.util.SystemConstant;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.shop.admin.annotation.Log;
import com.fh.shop.admin.biz.employee.IEmpService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.common.SystemEnum;
import com.fh.shop.admin.po.Employee;
import com.fh.shop.admin.util.FileUtil;

/** 
 * <pre>项目名称：shop-admin-v3    
 * 类名称：EmpController    
 * 类描述：    
 * 创建人：舒盼盼 1060908421@qq.com    
 * 创建时间：2018年10月11日 上午10:16:44    
 * 修改人：舒盼盼 1060908421@qq.com      
 * 修改时间：2018年10月11日 上午10:16:44    
 * 修改备注：       
 * @version </pre>    
 */
@Controller
public class EmpController {
	
	@Resource
	private IEmpService empService;
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * <pre>logout(安全退出)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午4:15:24    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午4:15:24    
	 * 修改备注： 
	 * @return</pre>
	 */
	@RequestMapping("/logout")
	@Log(value="安全退出")
	public String logout(){
		request.getSession().invalidate();
		return "redirect:login.jsp";
	}
	
	/**
	 * <pre>login(登录)   
	 * 创建人：舒盼盼 1060908421@qq.com     
	 * 创建时间：2018年10月17日 下午4:15:50    
	 * 修改人：舒盼盼 1060908421@qq.com    
	 * 修改时间：2018年10月17日 下午4:15:50    
	 * 修改备注： 
	 * @param emp
	 * @return</pre>
	 */
	@RequestMapping("/login")
	@ResponseBody
	@Log(value="用户登录")
	public ServerResponse login(Employee emp){
		
		//判断信息是否完整
		if(StringUtils.isEmpty(emp.getLoginName()) || StringUtils.isEmpty(emp.getPwd()) || StringUtils.isEmpty(emp.getImgCode())){
			
			return ServerResponse.error(SystemEnum.USER_INFO_MISS);
		}
		
		//获得session中的验证码
		String sessionCode = (String) request.getSession().getAttribute("code");
		//先判断验证码
		if(!emp.getImgCode().equals(sessionCode)){
			return ServerResponse.error(SystemEnum.LOGIN_CODE_ERROR);
		}

		//再判断用户名
		Employee dbEmp = empService.getEmpByLoginname(emp.getLoginName());
		if(dbEmp == null){
			return ServerResponse.error(SystemEnum.LOGIN_USERNAME_NOT_EXIST);
		}
		//判断用户是否被锁定
		if(dbEmp.getStatus() == SystemConstant.USER_LOCK){
			return ServerResponse.error(SystemEnum.LOGIN_USER_LOCK);
		}

		//如果不是同一天，则将错误登陆次数重置为0
		if(null != dbEmp.getLoginErrorTime()){
			Date loginErrorTime = DateUtil.convertStr2Date(DateUtil.convertDate2Str(dbEmp.getLoginErrorTime(),DateUtil.Y_M_D),DateUtil.Y_M_D);
			Date currentTime =DateUtil.convertStr2Date(DateUtil.convertDate2Str(new Date(),DateUtil.Y_M_D),DateUtil.Y_M_D) ;
			if(currentTime.after(loginErrorTime)){
				//不再同一天
				empService.updateUserLoginCount(dbEmp.getEmpId());
				//重置dbEmp
				dbEmp.setLoginErrorCount(0);
			}
		}

		
		//再判断密码,密码错误
		String pwd = emp.getPwd();
		String salt = dbEmp.getSalt();
		//MD5结合salt进行双重加密
		String newPwd = Md5Util.md5(pwd+ "_" + salt) ;
        System.err.println(newPwd);
		if(!newPwd.equals(dbEmp.getPwd())){
			empService.updateUserLoginErrorInfo(new Date(),dbEmp.getEmpId());
			if(dbEmp.getLoginErrorCount() == (SystemConstant.LOGIN_ERROR_COUNT-1)){
				//更新用户状态为锁定
				empService.updateUserStatus(dbEmp.getEmpId(),SystemConstant.USER_LOCK);
			}
			return ServerResponse.error(SystemEnum.LOGIN_PASSWORD_ERROR);
		}else{
			//密码正确,将错误次数重置为0，这样用户就有三次机会
			empService.updateUserLoginCount(dbEmp.getEmpId());
		}

		//如果以上验证通过，登录
		request.getSession().setAttribute("user", dbEmp);
		//记录用户成功登陆的时间
		empService.updateUserLastLoginTime(dbEmp.getEmpId());
		if(dbEmp.getLastLoginTime() != null){
			String date = DateUtil.convertDate2Str(dbEmp.getLastLoginTime(),DateUtil.YMD_HMS);
			dbEmp.setLastLoginDate(date);
		}
		//记录用户今天是第几次登录
		if(dbEmp.getLastLoginTime() != null){
			Date lastLoginTime = DateUtil.convertStr2Date(DateUtil.convertDate2Str(dbEmp.getLastLoginTime(),DateUtil.Y_M_D),DateUtil.Y_M_D);
			Date currentTime =DateUtil.convertStr2Date(DateUtil.convertDate2Str(new Date(),DateUtil.Y_M_D),DateUtil.Y_M_D) ;
			if(currentTime.after(lastLoginTime)){
				//将内存中dbEmp的登陆次数重置为0
				dbEmp.setLoginCount(0);
				//数据库中重置为1
				empService.updateUserLoginNum(1,dbEmp.getEmpId());
			}else {
				//将登录次数增加1
				Integer count = dbEmp.getLoginCount() + 1;
				empService.updateUserLoginNum(count,dbEmp.getEmpId());
			}
		}else {
			//重置为1
			empService.updateUserLoginNum(1,dbEmp.getEmpId());
		}


		//清除session中的验证码
		request.getSession().removeAttribute("code");
		return ServerResponse.success();

	}
	
	//删除
	@RequestMapping("/emp/deleteBatch")
	@ResponseBody
	@Log(value="删除员工")
	public ServerResponse deleteEmp(@RequestParam("idList[]") List<Integer> ids){
		empService.deleteEmp(ids);
		return ServerResponse.success();
	}
	
	//员工新增
	@RequestMapping("/emp/add")
	@ResponseBody
	@Log(value="员工新增")
	public ServerResponse addEmp(Employee emp){
		empService.addEmp(emp);
		return ServerResponse.success(emp);
		
	}
	
	//查询员工列表
	@RequestMapping("/emp/list")
	@ResponseBody
	@Log(value="查询员工列表")
	public Map findEmpList(Employee emp,@RequestParam(value="ids[]",required=false) List<Integer> idList){
		emp.setIdList(idList);
		if (null != emp) {
			if (StringUtils.isNotBlank(emp.getEmpName())) {
				emp.setEmpName("%"+emp.getEmpName()+"%");
			}
		}
		
		//获取总条数
		int count = empService.selectCount(emp);
		//获取分页列表
		List<Employee> emptList = empService.findEmpList(emp);
		Map resultMap = new HashMap();
		resultMap.put("data",emptList);
		resultMap.put("recordsTotal", count);
		resultMap.put("recordsFiltered", count);
		return resultMap;
		
	}
	
		//导出Excel
		@RequestMapping("/emp/downLoadExcel")
		public void downLoadExcel(Employee emp,HttpServletResponse response){
			
			
			// 查询数据
			List<Employee> empList = empService.downLoadExcel(emp);
			for (int i = 0; i < empList.size(); i++) {
				System.err.println(empList.get(i));
			}
			
			// 将数据转换为excel
			XSSFWorkbook wb = buildExcel(empList);
			// 下载
			FileUtil.excelDownload(wb,response);
		}
		private XSSFWorkbook buildExcel(List<Employee> empList) {
			// 创建workbook
			XSSFWorkbook wb = new XSSFWorkbook();
			// 创建sheet
			XSSFSheet sheet = wb.createSheet("员工人数"+empList.size());
			// 构建title
			buildTitle(sheet, wb);
			// 构建header
			buildHeader(wb, sheet);
			// 构建主体
			buildBody(empList, wb, sheet);
			return wb;
		}
	//--------------------------------------------------------------------------
		private void buildTitle(XSSFSheet sheet, XSSFWorkbook wb) {
			// 构建title样式
			XSSFCellStyle titleStyle = buildTitleStyle(wb);
			
			XSSFRow titleRow = sheet.createRow(3);
			XSSFCell titleCell = titleRow.createCell(7);
			titleCell.setCellValue("员工列表");
			titleCell.setCellStyle(titleStyle);
			CellRangeAddress cellRangeAddress = new CellRangeAddress(3, 4, 7, 11);
			sheet.addMergedRegion(cellRangeAddress);
		}
		private XSSFCellStyle buildTitleStyle(XSSFWorkbook wb) {
			// 创建居中的样式
			XSSFCellStyle titleStyle = wb.createCellStyle();
			titleStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);//水平居中
			titleStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);//垂直居中
			// 创建字体样式
			XSSFFont font = wb.createFont();
			font.setFontHeightInPoints((short) 22);
			font.setBold(true);
			titleStyle.setFont(font);
			// 设置背景颜色
			titleStyle.setFillForegroundColor(HSSFColor.GREEN.index);//设置图案颜色
			//titleStyle.setFillBackgroundColor(HSSFColor.RED.index);//设置图案背景色
			titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//设置图案样式
			return titleStyle;
		}
		
	//-------------------------------------------------------------------------
		private void buildHeader(XSSFWorkbook wb, XSSFSheet sheet) {
			String[] headers = {"员工名", "性别", "生日", "部门", "薪资"};
			XSSFRow headerRow = sheet.createRow(5);
			XSSFCellStyle headerStyle = wb.createCellStyle();
			// 加粗
			XSSFFont headerFont = wb.createFont();
			headerFont.setBold(true);
			headerStyle.setFont(headerFont);
			// 居中
			headerStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
			headerStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			// 背景色
			headerStyle.setFillForegroundColor(HSSFColor.RED.index);
			headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			int start = 7;
			int end = start + headers.length;
			for (int i = start; i < end; i++) {
				XSSFCell HeaderCell = headerRow.createCell(i);
				HeaderCell.setCellValue(headers[i-start]);
				HeaderCell.setCellStyle(headerStyle);
			}
		}
	//----------------------------------------------------------------------
		private void buildBody(List<Employee> empList, XSSFWorkbook wb, XSSFSheet sheet) {
			XSSFCellStyle dateCellStyle = wb.createCellStyle();
			dateCellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
			XSSFCellStyle warnStyle = wb.createCellStyle();
			warnStyle.setFillForegroundColor(HSSFColor.YELLOW.index);
			warnStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			XSSFCellStyle warnDateStyle = wb.createCellStyle();
			warnDateStyle.setFillForegroundColor(HSSFColor.YELLOW.index);
			warnDateStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			warnDateStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
			// 构建内容主体
			for (int i = 0; i < empList.size(); i++) {
				Employee empInfo = empList.get(i);
				XSSFRow row = sheet.createRow(i+6);
				
				XSSFCell movieNameCell = row.createCell(7);
				movieNameCell.setCellValue(empInfo.getLoginName());
				
				XSSFCell scoreCell = row.createCell(8);
				scoreCell.setCellValue(empInfo.getEmpSex());
				
				XSSFCell showDateCell = row.createCell(9);
				showDateCell.setCellValue(empInfo.getBirthday());
				showDateCell.setCellStyle(dateCellStyle);
				
				XSSFCell typeCell = row.createCell(10);
				typeCell.setCellValue(empInfo.getDept().getDeptName());
				
				XSSFCell areaCell = row.createCell(11);
				areaCell.setCellValue(empInfo.getSalary());
				
					if (empInfo.getSalary() > 600) {
					movieNameCell.setCellStyle(warnStyle);
					scoreCell.setCellStyle(warnStyle); 
					showDateCell.setCellStyle(warnDateStyle);
					typeCell.setCellStyle(warnStyle);
					areaCell.setCellStyle(warnStyle);
				}
				
			}
		}
}

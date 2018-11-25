<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/datetimePicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
 
<title>index</title>
</head>
<body>

	<!--导航条-->
	<nav class="navbar navbar-default">
	    <div class="container-fluid" style="height: 60px;" >
	        <ul class="nav navbar-nav navbar-left" style="margin-top: 20px;">
	            <li> 欢迎&nbsp;${user.dept.deptName}部门的<span style="color: pink">${user.empName},</span>您今天是第${user.loginCount+1}次登陆,<c:if test="${!empty user.lastLoginTime }" >  上次登录时间是${user.lastLoginDate}</c:if></li>
	        </ul>
	        <ul class="nav navbar-nav navbar-right" >
	            <li><a href="<%=request.getContextPath() %>/logout.jhtml"><span class="glyphicon glyphicon-off">安全退出</span></a></li>
	        </ul>
	    </div>
	</nav>

	<div class="container-fluid">
	  <div class="row">
		<div class="col-md-4">
			<div class="panel panel-info">
			  <div class="panel-heading">
			  	部门管理
			  	<button type="button" class="btn btn-primary" onclick="addDeptDlg();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
			  	<button type="button" class="btn btn-info" onclick="editDeptDlg();"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改</button>
			  	<button type="button" class="btn btn-danger" onclick="deleteDeptDlg();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
			  </div>
			  
			  <div class="panel-body">
			    <ul id="deptTree" class="ztree"></ul>
			  </div>
			</div>

			<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
			<div id="containerColumn" style="width: 550px; height: 400px; margin: 0 auto"></div>

		</div>
		
	  	<div class="col-md-8">
	  		<div class="panel panel-info">
			  <div class="panel-heading">员工查询</div>
			  <div class="panel-body">
			    
			    	<form class="form-horizontal" style="margin-right: 300px" id="searchForm">
			    	<input type="hidden" name="deptId">
					  <div class="form-group">
						<label class="col-sm-4 control-label">名字:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="empName" name="empName">
						</div>
					</div>
					  <div class="form-group">
						<label class="col-sm-4 control-label">薪资:</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" class="form-control" id="minSalary" name="minSalary">
								<div class="input-group-addon"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span></div>
								<input type="text" class="form-control" id="maxSalary" name="maxSalary">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">生日:</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" class="form-control" id="minDate" name="minDate">
								<div class="input-group-addon"><span class="glyphicon glyphicon-th" aria-hidden="true"></span></div>
								<input type="text" class="form-control" id="maxDate" name="maxDate">
							</div>
						</div>
					</div>
					
					<div style="text-align: center;">
						<button type="button" onclick="searchEmp()" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询</button>
						<button type="button" onclick ="clearForm(this)" class="btn btn-primary"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>重置</button>
				 	</div>
			 	</form>
			  </div>
			</div>
	  	
	  	<button type="button" class="btn btn-primary" onclick="addEmployee()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
	  	<button type="button" class="btn btn-info" onclick="updateEmp()"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改</button>
	  	<button type="button" class="btn btn-danger" onclick="deleteEmp()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
			<button type="button" class="btn btn-warning" onclick="findLogList()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>查询日志列表</button>
			<button type="button" class="btn btn-warning" onclick="findBrandList()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>查询品牌列表</button>
			<button type="button" class="btn btn-warning" onclick="findGoodsList()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>查询商品列表</button>
	  	<button type="button" class="btn btn-danger" onclick=""><span class="glyphicon glyphicon-retweet" aria-hidden="true"></span>批量换部门</button>
	  	<button type="button" class="btn btn-primary" onclick="importEmpExcel()"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>动态导出Excel</button>
	  	<button type="button" class="btn btn-primary" onclick=""><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span>按部门导出Excel</button>
  		
	  	
	  	<div class="panel panel-info">
		  <div class="panel-heading">员工列表</div>
		  <div class="panel-body">
		    <table id="empTable" class="table table-striped table-bordered" style="width:100%">
			    <thead>
			        <tr>
			            <th>员工编号</th>
			            <th>员工姓名</th>
			            <th>性别</th>
			            <th>生日</th>
			            <th>薪资</th>
			            <th>登录名</th> 
			            <th>部门名</th>
			        </tr>
			    <thead>
			</table>
		  </div>
		</div>

	  	</div>
	  </div>
	</div>


	<!--员工信息修改  -->
	<div id="editEmpForm" style="display: none;">
		<form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">名字</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="edit_empName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <input type="radio" name="empSex" value="0">&nbsp;男&nbsp;&nbsp;
		      <input type="radio" name="empSex" value="1">&nbsp;女&nbsp;&nbsp;
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">生日</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="edit_birthday">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">薪资</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="edit_salary">
		    </div>
		  </div>
		</form>
	</div>
	
	
	<!--员工新增  -->
	<div id="addEmpForm" style="display: none;">
		<form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">员工名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="add_empName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <input type="radio" name="empSex" value="0">&nbsp;男&nbsp;&nbsp;
		      <input type="radio" name="empSex" value="1">&nbsp;女&nbsp;&nbsp;
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">生日</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="birthday">
		    </div>
		  </div>

			<div class="form-group">
				<label class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pwd">
				</div>
			</div>
		  
		   <div class="form-group">
		    <label class="col-sm-2 control-label">薪资</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="salary">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">登录名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="loginName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">所属部门</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="deptName" readonly="readonly">
		      <input type="text" class="form-control" id="deptId">
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-primary" onclick="selectEmpDlg()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>选择部门</button>
		    </div>
		    </div>
		  </div>
		  
		</form>
	</div>
	
	
	

	<!--新增  -->
	<div id="addDeptForm" style="display: none;">
		<form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-3 control-label">上级部门</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="fatherName" readonly="readonly">
		      <input type="hidden" class="form-control" id="fatherId">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-3 control-label">部门名</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="add_deptName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-3 control-label">部门描述</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="description">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-3 control-label">创建日期</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="add_time">
		    </div>
		  </div>
		</form>
	</div>

	<!--更新  -->
	<div id="updateDeptForm" style="display: none;">
		<form class="form-horizontal">
		  
		  <div class="form-group">
		    <label class="col-sm-3 control-label">部门名</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="update_deptName">
		      <input type="hidden" class="form-control" id="update_deptId">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-3 control-label">部门描述</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="edit_description">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-3 control-label">创建日期</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="edit_time">
		    </div>
		  </div>
		</form>
	</div>



	<div id="selectDeptForm">
		<ul id="selectDeptTree" class="ztree"></ul>
	</div>	
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>  
    <script src="<%=request.getContextPath()%>/js/zTree/js/jquery.ztree.core.min.js"></script>  
	<script src="<%=request.getContextPath()%>/js/bootbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/moment.js"></script>
	<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/datetimePicker/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/Highcharts-6.1.2/code/highcharts.js"></script>

	<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
	<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>

</body>


<script type="text/javascript">
	$(function(){
		initTree();
		initDataTable();
		initClickEvent();
        containerColumn();
	})

	//highcharts
	//饼图
    Highcharts.chart('container', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Browser market shares in January, 2018'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Chrome',
                y: 61.41,
                sliced: true,
                selected: true
            }, {
                name: 'Internet Explorer',
                y: 11.84
            }, {
                name: 'Firefox',
                y: 10.85
            }, {
                name: 'Edge',
                y: 4.67
            }, {
                name: 'Safari',
                y: 4.18
            }, {
                name: 'Other',
                y: 7.05
            }]
        }]
    });

	//柱状图
    function containerColumn(){
        var chart = Highcharts.chart('containerColumn', {
            chart: {
                type: 'column'
            },
            title: {
                text: '分公司效率优化嵌套图'
            },
            xAxis: {
                categories: [
                    '杭州总部',
                    '上海分部',
                    '北京分部'
                ]
            },
            yAxis: [{
                min: 0,
                title: {
                    text: '雇员'
                }
            }, {
                title: {
                    text: '利润 (millions)'
                },
                opposite: true
            }],
            legend: {
                shadow: false
            },
            tooltip: {
                shared: true
            },
            plotOptions: {
                column: {
                    grouping: false,
                    shadow: false,
                    borderWidth: 0
                }
            },
            series: [{
                name: '雇员',
                color: 'rgba(165,170,217,1)',
                data: [150, 73, 20],
                pointPadding: 0.3, // 通过 pointPadding 和 pointPlacement 控制柱子位置
                pointPlacement: -0.2
            }, {
                name: '优化的员工',
                color: 'rgba(126,86,134,.9)',
                data: [140, 90, 40],
                pointPadding: 0.4,
                pointPlacement: -0.2
            }, {
                name: '利润',
                color: 'rgba(248,161,63,1)',
                data: [183.6, 178.8, 198.5],
                tooltip: {  // 为当前数据列指定特定的 tooltip 选项
                    valuePrefix: '$',
                    valueSuffix: ' M'
                },
                pointPadding: 0.3,
                pointPlacement: 0.2,
                yAxis: 1  // 指定数据列所在的 yAxis
            }, {
                name: '优化的利润',
                color: 'rgba(186,60,61,.9)',
                data: [203.6, 198.8, 208.5],
                tooltip: {
                    valuePrefix: '$',
                    valueSuffix: ' M'
                },
                pointPadding: 0.4,
                pointPlacement: 0.2,
                yAxis: 1
            }]
        });
    }


    //条件查询
	function searchEmp(ids){

		var param = {};
		param.empName = $("#empName").val();
		param.minSalary =  $("#minSalary").val();
		param.maxSalary = $("#maxSalary").val();
		param.minDate = $("#minDate").val();
		param.maxDate = $("#maxDate").val();
		param.ids = ids;
        //获得选择的节点
        //var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        //var nodes = treeObj.getSelectedNodes();
        //param.dept.id = nodes[0].id;
		//传递参数
		empTable.settings()[0].ajax.data = param;
		//刷新表格
		empTable.ajax.reload();
	}
	
	//动态导出Excel
	function importEmpExcel(){
		//获取条件查询的值
		var v_empForm = document.getElementById("searchForm");
		v_empForm.action = "<%=request.getContextPath()%>/emp/downLoadExcel.jhtml";
		v_empForm.method = "post";
		v_empForm.submit();

	}
	
	//选择部门弹出框
	function selectEmpDlg(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/dept/list.jhtml",
			success:function(result){
				if(result.code == 200){
					//初始化部门树
					var setting = {
							data: {
								simpleData: {
									enable: true
								}
							}
						};
				$.fn.zTree.init($("#selectDeptTree"), setting, result.data);
					
				}	
			}
		})
		
		var selectDeptDlg = bootbox.dialog({
			title: '选择部门',
            message:$("#selectDeptTree"),
            size:"small",
            buttons:{
            	confirm:{
            		label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback:function(){
                    	//获得当前选中的节点
                		var treeObj = $.fn.zTree.getZTreeObj("selectDeptTree");
                		var nodes = treeObj.getSelectedNodes();
                		if(nodes.length == 1){
                			//获取选中节点的id和name
                			var v_id = nodes[0].id;
                			var v_name = nodes[0].name;
                			//给部门赋值
                			$("#deptName",addEmpDlg).val(v_name);
                			$("#deptId",addEmpDlg).val(v_id);
                			
                		}
                    	$("#selectDeptForm").html('<ul id="selectDeptTree" class="ztree"></ul>');
                    }
                    
            	},
            	cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger',
                    callback:function(){
                    	$("#selectDeptForm").html('<ul id="selectDeptTree" class="ztree"></ul>');
                    }
                }
            }
		})
		
	}
	
	//翻页保留选中效果
	var v_ids = [];
	function initClickEvent(){
		$("#empTable tbody").on("click","tr",function(){
			//获得选中的复选框
			var v_input = $(this).find(":checkbox");
			var v_id = v_input.val();
			if(v_input.prop("checked")){
				//移除选中
				v_input.prop("checked",false);
				//取消背景色
				v_input.closest("tr").css("background","");
				//删除id
				for (var i = 0; i < v_ids.length; i++) {
					if(v_ids[i] == v_id){
						v_ids.splice(i,1);
					}
				}
			}else{
				//被选中
				v_input.prop("checked",true);
				//添加背景色
				v_input.closest("tr").css("background","red");
				//存入id
				v_ids.push(v_id);
			}
			console.log(v_ids);
		})
	}
	
	function isExist(v_id){
		for (var i = 0; i < v_ids.length; i++) {
			if(v_ids[i] == v_id){
				return true;
			}
		}
		return false;
	}
	
	
	//表格生成
	var empTable;
	function initDataTable(){
		
		empTable = $("#empTable").DataTable({
		"searching": false,          //屏蔽datatales的查询框
		'lengthMenu': [5, 10, 15, 20],
		"processing": false,         //刷新的那个对话框
        "serverSide": true,          //服务器端分页
            "ajax" : {
            	type:"post",
            	url:"<%=request.getContextPath()%>/emp/list.jhtml",
            },
            "columns": [
                {
                	"data": "empId",
                	render:function(data,type,row){
                		return '<input type="checkbox" value="'+data+'" name="check" />';
                	}
                },
                {"data": "empName"},
                {
                	"data": "empSex",
                	render:function(data,type,row,meta){
                		return data == 0?"男":"女";
                		
                	}
                },
                {"data": "birthday"},
                {"data": "salary"},
                {"data": "loginName"},
                {"data": "dept.deptName"}
            ],
            "language": {
	            "url": "<%=request.getContextPath()%>/js/datatable/Chinese.json",
	        },
	        "drawCallback": function(){
	        	$("#empTable tbody").find(":checkbox").each(function(){
	        		var v_id = $(this).val();
	        		console.log(v_id);
	        		if(isExist(v_id)){
	        			//被选中
	        			$(this).prop("checked",true);
	        			//添加背景色
	        			$(this).closest("tr").css("background","pink");
	        		}
	        	})
	        }
        });
	}
	
	//删除员工
	function deleteEmp(){
		//判断是否有选中的记录
		if(v_ids.length > 0)			//如果有弹出确认对话框
			//点击确认删除按钮弹出会话框
			bootbox.confirm({ 
				  size: "small",
				  message: "你确定删除该数据吗？", 
				  callback: function(result){ 
					  if(result){
					  //进行ajax删除   
						  $.ajax({
							  type:"post",
							  url:"<%=request.getContextPath()%>/emp/deleteBatch.jhtml",
							  data:{"idList":v_ids},
							  success:function(result){
								  if(result.code == 200){
									//刷新页面
									searchEmp();
									
								  }else{
									//弹出提示信息
										bootbox.alert({
							              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除失败",
							              size: 'small',
							              title:"提示信息"});  
								  }
							  }
						  })
					  }else{
						//弹出提示信息
							bootbox.alert({
					              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择要删除的数据",
					              size: 'small',
					              title:"提示信息"});  
					  }
				  }
				})
		}

	//员工信息修改
	function updateEmp(){
		var ids = [];
		var empId = "";
		$("[name='updateCheck']:checked").each(function(){
			ids.push($(this).val());
		});
		//判断选择的个数
		if(ids.length == 1){
			for (var i = 0; i < ids.length; i++){
				empId += ids[i];
			}
			//发送ajax请求
			$.ajax({
				type:"post",
				data:{"empId":empId},
				url:"<%=request.getContextPath()%>/emp/toUpdateEmp.jhtml",
				success:function(result){
					if(result.code == 200){
						//弹出对话框
						var editDialog = bootbox.dialog({
							title: '修改员工信息',
			                message:$("#editEmpForm form").clone(),
			                size:"large",
			                buttons: {
			                    confirm: {
			                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
			                        className: 'btn-primary',
			                        callback: function(){
			                        	//点击确认按钮发送ajax请求,修改数据
			                       
			                        	$.ajax({
			                        		type:"post",
			                        		url:"<%=request.getContextPath()%>/dept/update.jhtml",
			                        		data:param,
			                        		success:function(result){
			                        			
			                        			}
			                        	})
			                        }  
			                    },
			                    cancel: {
			                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
			                        className: 'btn-danger'
			                    }
			                }
			                
						});
					}else{
						//弹出提示信息
						bootbox.alert({
				              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个节点",
				              size: 'small',
				              title:"提示信息"});
					}
				}
			})
		}else{
			//弹出提示信息
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个节点",
	              size: 'small',
	              title:"提示信息"});
		}
	}
	
	//员工新增
	var addEmpDlg;
	function addEmployee(){
	
		 	addEmpDlg = bootbox.dialog({
			title: '添加员工',
            message:$("#addEmpForm form").clone(),
            size:"large",
            buttons:{
            	confirm:{
            		label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback:function(){
                    	
                    	var param = {};
                    	param.empName = $("#add_empName",addEmpDlg).val();
                    	param.empSex = $("input[name='empSex']:radio:checked",addEmpDlg).val();
                    	param.birthday = $("#birthday",addEmpDlg).val();
                    	param.salary = $("#salary",addEmpDlg).val();
                    	param.loginName = $("#loginName",addEmpDlg).val();
                    	param.pwd = $("#pwd",addEmpDlg).val();
                    	param["dept.id"] = $("#deptId",addEmpDlg).val();
                    	$.ajax({
                    		type:"post",
                    		url:"<%=request.getContextPath()%>/emp/add.jhtml",
                    		data:param,
                    		success:function(result){
                    			if(result.code == 200){
                    				//弹出提示信息
                    				bootbox.alert({
                    		              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>新增成功",
                    		              size: 'small',
                    		              title:"提示信息"});
                    				//刷新页面
                                    searchEmp();

                    			}else{
                    				//弹出提示信息
                    				bootbox.alert({
                    		              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>新增失败",
                    		              size: 'small',
                    		              title:"提示信息"});
                    			}
                    		}
                    	})
                    }
            	},
            	cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
		})
	}
	
	//查询日志列表
	function findLogList(){
		location.href = "<%=request.getContextPath()%>/toLog.jhtml";
	}
	//查询品牌列表
	function findBrandList(){
        location.href = "<%=request.getContextPath()%>/toBrandList.jhtml";
	}

	//查询商品列表
	function findGoodsList(){
        location.href = "<%=request.getContextPath()%>/toGoodsList.jhtml";
    }
	
	//删除
	function deleteDeptDlg(){
		//获得当前选中的节点
		var treeObj = $.fn.zTree.getZTreeObj("deptTree");
		var nodes = treeObj.getSelectedNodes();
		
		//判断选中的节点个数  
		if(nodes.length == 0){
			//弹出提示信息
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
	              size: 'small',
	              title:"提示信息"});
		}else{
			//点击删除，弹出对话框提示是否删除
			bootbox.confirm({ 
			  size: "small",
			  message: "你确定删除该数据吗？", 
			  callback: function(result){ 
				  if(result){
				  //如果确认删除，先删除数据库  
				  var ids = [];
				  var deleteNodes = [];
				  for (var i = 0; i < nodes.length; i++) {
					var node = nodes[i];
					var nodeList = treeObj.transformToArray(node);
					for (var j = 0; j < nodeList.length; j++) {
						ids.push(nodeList[j].id);
						deleteNodes.push(nodeList[j]);
					}
				}  
					  $.ajax({
						  type:"post",
						  url:"<%=request.getContextPath()%>/dept/deleteBatch.jhtml",
						  data:{"ids":ids},
						  success:function(result){
							  if(result.code == 200){
								 //再删除前台页面 
								for (var i = 0; i < deleteNodes.length; i++) {
									treeObj.removeNode(deleteNodes[i]);
								}
							  }else{
								//弹出提示信息
									bootbox.alert({
							              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除部门失败",
							              size: 'small',
							              title:"提示信息"});  
							  }
						  }
					  })
				  }else{
					//弹出提示信息
						bootbox.alert({
				              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除部门失败",
				              size: 'small',
				              title:"提示信息"});  
				  }
			  }
			})
		}
	}
	
	//修改
	function editDeptDlg(){
		//获得选择的节点
		var treeObj = $.fn.zTree.getZTreeObj("deptTree");
		var nodes = treeObj.getSelectedNodes();
		//弹出对话框
		if(nodes.length == 1){
			//获得当前选中节点的id和name
			var v_id = nodes[0].id;
			var v_deptName = nodes[0].name;
			var v_description = nodes[0].description;
			var v_createDate = nodes[0].createDate;
			//给弹出框赋值
			$("#update_deptName").val(v_deptName);
			$("#update_deptId").val(v_id);	
			$("#edit_description").val(v_description);
			$("#edit_time").val(moment(v_createDate).format("YYYY-MM-DD"));
			//弹出对话框
			var editDialog = bootbox.dialog({
				title: '修改部门',
                message:$("#updateDeptForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                        	//点击确认按钮发送ajax请求,修改数据
                        	var param = {};
                        	param.id = v_id;
                        	param.deptName = $("#update_deptName",editDialog).val();
                        	param.description = $("#edit_description",editDialog).val();
                        	param.createDate = $("#edit_time",editDialog).val();
                        	
                        	$.ajax({
                        		type:"post",
                        		url:"<%=request.getContextPath()%>/dept/update.jhtml",
                        		data:param,
                        		success:function(result){
                        			if(result.code == 200){
                        				//进行前台的修改
                        				nodes[0].name = $("#update_deptName",editDialog).val();
                        				nodes[0].description = $("#edit_description",editDialog).val();
                        				nodes[0].createDate = $("#edit_time",editDialog).val();
                        				
                        				treeObj.updateNode(nodes[0]);
                        			}else{
                        				//弹出提示信息
                        				bootbox.alert({
                        		              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改部门"+result.message,
                        		              size: 'small',
                        		              title:"提示信息"});
                        			}
                        		}
                        	})
                      
                        	
                        }  
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
                
			});
			
		}else if(nodes.length == 0){
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择要修改的部门",
	              size: 'small',
	              title:"提示信息"});
		}else{
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择一个部门",
	              size: 'small',
	              title:"提示信息"});
		}
	}
	
	//增加
	function addDeptDlg(){
		//获得选择的节点
		var treeObj = $.fn.zTree.getZTreeObj("deptTree");
		var nodes = treeObj.getSelectedNodes();
		//弹出对话框
		if(nodes.length == 1){
			//获取选中节点的id和name
			var v_id = nodes[0].id;
			var v_name = nodes[0].name;
			var v_description = nodes[0].description;
			var v_createDate = nodes[0].createDate;
			//给弹出框赋值
			$("#fatherName").val(v_name);
			$("#fatherId").val(v_id);
			
			//弹出框
			var addDialog = bootbox.dialog({
                title: '添加部门',
                message:$("#addDeptForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                        	//点击确认按钮发送ajax请求,将数据插入到数据库
                        	var param = {};
                        	param.deptName = $("#add_deptName",addDialog).val();
                        	param.fatherId = v_id;
                        	param.description = $("#description",addDialog).val();
                        	param.createDate = $("#add_time",addDialog).val();
                        	
                        	$.ajax({
                        		type:"post",
                        		url:"<%=request.getContextPath()%>/dept/add.jhtml",
                        		data:param,
                        		success:function(result){
                        			if(result.code == 200){
                        				//进行前台增加
                        				var treeObj = $.fn.zTree.getZTreeObj("deptTree");
                        				var newNode = {};
                        				newNode.id = result.data.id;
                        				newNode.name = result.data.deptName;
                        				newNode.pId = result.data.fatherId;
                        				newNode.description = result.data.description;
                        				newNode.createDate = result.data.createDate;
                        				
                        				newNodes = treeObj.addNodes(nodes[0], newNode);
                        			}else{
                        				bootbox.alert({
                        		              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>部门添加失败",
                        		              size: 'small',
                        		              title:"提示信息"});
                        			}
                        		}
                        	})
                        	
                        }  
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
            });
			/* dataTime日期控件 */
			$("#add_time",addDialog).datetimepicker({
			    language:  'zh-CN',
			    weekStart: 1,
			    todayBtn:  1,  //显示'今天'按钮
				autoclose: true,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: false,
				format:'yyyy-mm-dd'
			});
			
		}else if(nodes.length == 0){
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择部门",
	              size: 'small',
	              title:"提示信息"});
		}else{
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个部门",
	              size: 'small',
	              title:"提示信息"});
		}
	}
	
	
	//点击部门查询相应的员工
	function deptOnClick(event,treeId,treeNode){
		
		var ids = [];
		//获取当前选中节点的ID
		var treeObj = $.fn.zTree.getZTreeObj("deptTree");
		var nodes = treeObj.transformToArray(treeNode);
		for (var i = 0; i < nodes.length; i++) {
			ids.push(nodes[i].id);
		}
	var param = {};
		param.ids = ids;
		console.log(ids);
		empTable.settings()[0].ajax.data = param;
        empTable.ajax.reload();

	}

	
	//初始化部门树
	function initTree(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/dept/list.jhtml",
			success:function(result){
				if(result.code == 200){
					//初始化部门树
					var setting = {
							callback: {
								onClick: deptOnClick
							},
							data: {
								simpleData: {
									enable: true
								}
							}
						};
					$(document).ready(function(){
						$.fn.zTree.init($("#deptTree"), setting, result.data);
					});
				}	
			}
		})
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 
 <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/datetimePicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
 
<title>日志列表</title>
</head>
<body>


	<div class="panel panel-info">
		  <div class="panel-heading">日志列表</div>
		  <div class="panel-body">
		    <table id="logTable" class="table table-striped table-bordered" style="width:100%">
			    <thead>
			        <tr>
			            <th>日志编号</th>
			            <th>用户姓名</th>
			            <th>日志信息</th>
			            <th>状态</th>
			            <th>ip地址</th>
			            <th>操作时间</th> 
			            <th>耗时</th>
			        </tr>
			    <thead>
			</table>
		  </div>
		</div>


	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>  
	<script src="<%=request.getContextPath()%>/js/bootbox.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/moment.js"></script>
	<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/datetimePicker/bootstrap-datetimepicker.min.js"></script>
    
</body>

	<script type="text/javascript">
	//表格生成
	$(function(){
		initDataTable();
	})
	var empTable;
	function initDataTable(){
		
		empTable = $("#logTable").DataTable({
		"searching": false,          //屏蔽datatales的查询框
		'lengthMenu': [5, 10, 15, 20],
		"processing": false,         //刷新的那个对话框
        "serverSide": true,          //服务器端分页
            "ajax" : {
            	url:"<%=request.getContextPath()%>/log/list.jhtml",
            },
            "columns": [
                {
                	"data": "logId",
                	render:function(data,type,row){
                		return '<input type="checkbox" value="'+data+'" name="check" />';
                	}
                },
                {"data": "userName"},
                {"data": "info"},
                {"data": "status"},
                {"data": "ipAdress"},
                {"data": "createTime"},
                {"data": "useTime"}
            ],
            "language": {
	            "url": "<%=request.getContextPath()%>/js/datatable/Chinese.json",
	        },
        });
	}
	
		
	</script>
</html>
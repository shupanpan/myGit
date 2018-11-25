<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <link href="<%=request.getContextPath()%>/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
 
<title>area页面</title>
</head>
<body>

	<div class="container-fluid">
	  <div class="row">
	    <div class="col-md-4">
	    	<div class="panel panel-info">
			  <div class="panel-heading">
			  	地区管理
			  	<button type="button" class="btn btn-primary" onclick="addAreaDlg();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
			  	<button type="button" class="btn btn-info" onclick="editAreaDlg();"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改</button>
			  	<button type="button" class="btn btn-danger" onclick="deleteAreaDlg();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
			  </div>
			  <div class="panel-body">
			    <div id="areaTree" class="ztree"></div>
			  </div>
			</div>
	    </div>
	    
	    
  		<div class="col-md-8">.col-md-1</div>
	  </div>
	</div>
	
	
	<!--添加地区  -->
	<div id="addAreaForm">
		<form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-3 control-label">上级地区</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="fatherArea">
		      <input type="text" class="form-control" id="add_areaId">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-3 control-label">地区名</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="add_areaName">
		    </div>
		  </div>
		 </form>
	</div>
	
 <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
 <script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
 <script src="<%=request.getContextPath()%>/js/zTree/js/jquery.ztree.core.min.js"></script>  
 <script src="<%=request.getContextPath()%>/js/bootbox.min.js"></script>  

</body>

<script type="text/javascript">

	$(function(){
		initTree();
	})
	
	//增加地区节点
	function addAreaDlg(){
		//获取选中的节点
		var treeObj = $.fn.zTree.getZTreeObj("areaTree");
		var nodes = treeObj.getSelectedNodes();
		console.log(nodes);
		//判断选中的节点个数
		if(nodes.length == 1){
			//获取选中节点的id和name
			var v_id = nodes[0].id;
			var v_name = nodes[0].name;
			//弹出对话框
			var addDialog = bootbox.dialog({
				title: '添加地区',
                message:$("#addAreaForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                        	
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                }
			});
			
		}else if(nodes.length == 0){
			//弹出提示信息
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择节点",
	              size: 'small',
	              title:"提示信息"});
		}else{
			//弹出提示信息
			bootbox.alert({
	              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个节点",
	              size: 'small',
	              title:"提示信息"});
		}
		
		//发送ajax请求进行添加
		
		
	}
	
	//初始化部门树
	function initTree(){
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/area/list.jhtml",
			success:function(result){
				if(result.status == "ok"){
					//初始化部门树
					var setting = {
							data: {
								simpleData: {
									enable: true
								}
							}
						};
					$(document).ready(function(){
						$.fn.zTree.init($("#areaTree"), setting, result.data);
					});
				}	
			}
		})
	}
	
</script>
</html>
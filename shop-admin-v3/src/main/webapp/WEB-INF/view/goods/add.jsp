<%--
  Created by IntelliJ IDEA.
  User: 舒盼盼
  Date: 2018/10/30
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
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
    <link href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css">

    <title>商品新增</title>
</head>
<body>

<!-- 新增商品 -->
<div class="panel panel-info">
    <div class="panel-heading">商品</div>
    <div class="panel-body">

<div id="addGoodsForm">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品名称：</label>

            <div class="col-sm-6">
                <input type="text" class="form-control" id="add_goodsName" placeholder="商品名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品价格：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="goodsPrice" placeholder="商品价格">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品库存：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="stock" placeholder="商品库存">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" >商品图片：</label>
            <div class="col-sm-6">
                <input type="file" name="photo" data-ref="url12" id="path" />
                <input type="hidden" id="goodsPhoto">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" >商品品牌：</label>
            <div class="col-sm-6">
                <select class="form-control" name="brand" id="add_brandName">
                    <option value="-1">==请选择==</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" >商品分类：</label>
            <div class="col-sm-2">

            </div>
        </div>


        <div>
            <button type="button" class="btn btn-primary" onclick="addGoods();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
            <button type="button" class="btn btn-danger" onclick="deleteGoods();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>ojiu907不过他那</button>
        </div>
    </form>
</div>
    </div>
</div>




<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootbox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput/js/locales/zh.js"></script>

<script>

</script>

</body>
</html>

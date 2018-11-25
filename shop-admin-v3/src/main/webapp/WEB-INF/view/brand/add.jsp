<%--
  Created by IntelliJ IDEA.
  User: 舒盼盼
  Date: 2018/10/29
  Time: 14:03
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
    <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css">

    <title>品牌新增</title>
</head>
<body>

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-primary" onclick="addBrandPanel()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增面板</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info" >
                    <div class="panel-heading">品牌新增</div>
                        <div class="panel-body">

                            <div id="addBrandForm">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >品牌名称：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="brandName" id="add_brandName" placeholder="品牌名">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >品牌描述：</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" name="description" id="add_description" placeholder="品牌描述">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >品牌Logo：</label>
                                        <div class="col-sm-6">
                                            <input type="file" name="photo" data-ref="url12" id="logo"/>
                                            <input type="text" id="brandLogo" name="brandLogo">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <div style="text-align: center;">
                    <button type="button" onclick="addBrand()" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>新增</button>
                    <button type="button" onclick ="clearForm(this)" class="btn btn-primary"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>重置</button>
                </div>
                </div>
            </div>
        </div>
    </div>



    <div style="display: none;" id="brandInfoDiv">

        <div class="panel panel-info" flag="brandInfo">
            <div class="panel-heading">品牌</div>
            <div class="panel-body">
            </div>
        </div>

        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label" >品牌名称：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="brandName"  placeholder="品牌名">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" >品牌描述：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="description" placeholder="品牌描述">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" >品牌Logo：</label>
                <div class="col-sm-6">
                    <input type="file" name="photo" data-ref="url12"/>
                    <input type="text"  name="brandLogo">
                </div>
            </div>
        </form>
    </div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/fileinput/js/fileinput.js"></script>
    <script src="<%=request.getContextPath() %>/js/fileinput/js/locales/zh.js"></script>

<script type="text/javascript">
$(function(){
    initBrandLogo();
})

//增加panel面板
function addBrandPanel(){
    var v_info = $("div[flag='brandInfo']").last().clone();
    $("div[flag='brandPanel']").after(v_info);
}

function initBrandLogo(){
    var settings = {
        uploadUrl:"<%=request.getContextPath()%>/brand/flieinput.jhtml",
        language:'zh', //设置语言
        showRemove :false, //显示移除按钮
        showPreview :true, //是否显示预览
        autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
        enctype:'multipart/form-data',
        maxFileCount:1, //表示允许同时上传的最大文件个数,
        initialPreviewAsData:true,
    };
    //初始化fileinput
    $("#logo").fileinput(settings);

}
</script>
</body>
</html>

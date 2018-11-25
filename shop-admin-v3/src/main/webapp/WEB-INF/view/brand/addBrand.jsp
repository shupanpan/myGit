<%--
  Created by IntelliJ IDEA.
  User: 舒盼盼
  Date: 2018/10/29
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理界面</title>
<!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css">

</head>
<body>
<div class="panel-heading">
    <button type="button" onclick="addBatchBrand()" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>批量新增</button>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-info"  flag ="brandFormDiv" name="brandPannel">
                <div class="panel-heading">新增商品</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">品牌名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="brandName" name="brandName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">品牌Logo</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control"  name="photo" id="uploadBrandLogo">
                                <input type="text" id="brandLogo" name="brandLogo">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">品牌描述</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="discription" name="discription">
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="text-align: center">
    <button type="button" onclick="addBrand()"
            class="btn btn-primary">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>新增
    </button>
    <button type="button" onclick="clearForm(this)"
            class="btn btn-primary">
        <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>重置
    </button>
</div>

<div  style="display: none;">
    <div class="panel panel-info" flag ="brandFormDiv" name="brandPannel">
        <div class="panel-heading">新增商品
            <button type="button" onclick="deleteBrand(this)" class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
        </div>
        <div class="panel-body">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">品牌名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="brandName" name="brandName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">品牌Logo</label>
                    <div class="col-sm-10">
                        <input type="file" class="form-control" id="fileInput" name="photo" data-id="fileInput">
                        <input type="text"  name="brandLogo">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">品牌描述</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="discription" name="discription">
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput/js/locales/zh.js"></script>


<script>
    $(function () {
        initFileinput();
    })
    //新增Pannel
    function addBatchBrand() {
        //克隆
        var v_info = $("[flag='brandFormDiv']").last().clone();
       // 初始化fileinput
        fileUpload(v_info);
        //追加
        $(".row div[name='brandPannel']").last().after(v_info);

    }
    //删除增加的pannel
    function deleteBrand(obj){
        $(obj).parents("div[flag ='brandFormDiv']").remove();
    }
//初始化fileinput
    function initFileinput(){
        $("#uploadBrandLogo").fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            uploadUrl:"<%=request.getContextPath()%>/brand/fileinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#brandLogo").val(data.response.data);
            //console.log(data.response.data)//携带的图片路径
        });
    }

    //第二个fileinput
    function fileUpload(obj){
        $("#fileInput").fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            uploadUrl:"<%=request.getContextPath()%>/brand/fileinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("[data-id='fileInput']",obj).val(data.response.data);
            //console.log(data.response.data)//携带的图片路径
        });
    }

    //清空form表单 -------------------------------------不起作用了
    function clearForm(obj) {
        var form = $(obj).parents("form");
        $(form)[0].reset();
        // $("[name='bigId']").val("");// 设置地址之后进行查询
    }

    //批量新增品牌信息
    function addBrand(){
        var v_brandName = $("form [name='brandName']").val();
        var v_brandLogo = $("form [name='brandLogo']").val();
        var v_discription = $("form [name='discription']").val();
      //  console.log(v_brandName);
        // console.log(v_brandLogo);
       // console.log(v_discription);
    }
</script>

</body>
</html>

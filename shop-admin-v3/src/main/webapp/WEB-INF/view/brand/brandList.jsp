<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>品牌列表</title>
    <link href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/js/datetimePicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css">
</head>
<body>


<div class="col-md-8">
    <div class="panel panel-info">
        <div class="panel-heading">品牌查询</div>
        <div class="panel-body">

            <form class="form-horizontal" style="margin-right: 300px" id="searchForm">
                <div class="form-group">
                    <label class="col-sm-4 control-label">品牌名字:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="brandName1" name="brandName">
                    </div>
                </div>

                <div style="text-align: center;">
                    <button type="button" onclick="searchBrand()" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询</button>
                    <button type="button" onclick ="clearForm(this)" class="btn btn-primary"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>重置</button>
                </div>
            </form>
        </div>
    </div>


    <button type="button" class="btn btn-primary" onclick="addBrandDlg();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
    <button type="button" class="btn btn-danger" onclick="deleteBrandDlg();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
    <button type="button" class="btn btn-warning" onclick="updateBrandDlg();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>修改</button>

    <div class="panel panel-info">
        <div class="panel-heading">品牌列表</div>
        <div class="panel-body">
            <table id="brandTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>品牌编号</th>
                        <th>品牌名</th>
                        <th>品牌logo</th>
                        <th>品牌描述</th>
                    </tr>
                <thead>
            </table>
        </div>
    </div>

</div>

<!-- 新增 -->
<div class="container-fluid" id="add_Brand" style="display:block; ">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <button type="button" class="btn btn-plus" onclick="addpanel(this)" id="a">
                        <span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>
                        添加面板
                    </button>
                </div>
                <div id="addBrandForm">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" >品牌名：</label>
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
                                <input type="file" name="photo" data-ref="url12" id="path" multiple/>
                                <input type="text" id="brandLogo" name="brandLogo">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 修改-->
<div id="updateBrandDiv" style="display: none">
    <form class="form-horizontal" id="updateBrandForm">
        <div class="form-group">
            <label  class="col-sm-2 control-label">品牌名</label>
            <div class="col-sm-8">
                <input type="text" class="form-control"  name="brandName" >
                <input type="text" class="form-control" name="id" id="bid">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">品牌logo</label>
            <div class="col-sm-8">
                <input  type="text"  name="logo"/>
                <input type="file"  id="logo"  name="photo">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">品牌描述</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="description">
            </div>
        </div>
    </form>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootbox.min.js"></script>
<script src="<%=request.getContextPath()%>/js/moment.js"></script>
<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/js/fileinput/js/locales/zh.js"></script>
</body>

<script type="text/javascript">

    $(function(){
        initBrandTable();
        initClickEvent();
    })

    //条件查询
    function  searchBrand(){
        var v_brandName = $("#brandName1").val();
        var param = {};
        param.brandName = v_brandName;
        brandTable.settings()[0].ajax.data=param;
        brandTable.ajax.reload();
    }


    //删除品牌
    function deleteBrandDlg(){
        //判断是否有选中的复选框
        if(v_ids.length > 0){
            bootbox.confirm({
                size: "small",
                message: "你确定删除该数据吗？",
                callback: function(result){
                    if(result){
                        //进行ajax删除
                        $.ajax({
                            type:"post",
                            url:"<%=request.getContextPath()%>/brand/deleteBrand.jhtml",
                            data:{"idList":v_ids},
                            success:function(result){
                                if(result.code == 200){
                                    //刷新页面
                                    brandTable.ajax.reload();

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
    }

  //修改品牌信息
    var updateBrandDlg;
    function updateBrandDlg() {
        if(v_ids.length==1){
            //执行修改操作
            //赋值，数据回显
            $("#bid").val(ids[0]);
            $.ajax({
                type:"post",
                async:false,
                url:"<%=request.getContextPath()%>/brand/queryBrandById.jhtml",
                data:{"id":$("#bid").val()},
                success:function(result){
                    if(result.code==200){
                        //弹出对话框
                        updateBrandDlg = bootbox.dialog({
                            title: '修改品牌',
                            message:$("#updateBrandDiv form").clone(),
                            size: 'large',
                            buttons: {
                                cancel:{
                                    label:'<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消',
                                    className: 'btn-danger',
                                    callback: function(){
                                    }
                                },
                                ok: {
                                    label: '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>确定',
                                    className: 'btn-info',
                                    callback: function(){
                                        //点击确定后执行的操作
                                        //表单序列化
                                        var parem=$("#brandForm",updateBrand).serialize();
                                        $.ajax({
                                            type:"post",
                                            url:"<%=request.getContextPath()%>/brand/updateBrand.jhtml",
                                            data:parem,
                                            success:function(result){
                                                if(result.code==200){
                                                    //刷新表格
                                                    seach();
                                                    bootbox.alert({
                                                        message: "修改成功",
                                                        size: 'small'
                                                    });
                                                    //刷新表格
                                                    seach();
                                                }else{
                                                    bootbox.alert({
                                                        message: "修改失败",
                                                        size: 'small'
                                                    });
                                                }
                                            },
                                            error:function(){
                                                //服务器故障,新增失败
                                                bootbox.alert({
                                                    message: "服务器故障,修改失败",
                                                    size: 'small'
                                                });
                                            }
                                        })
                                    }
                                }
                            }
                        });
                        $("[name='brandName']",updateBrand).val(result.data.brandName);
                        $("[name='logo']",updateBrand).val(result.data.logo);
                        $("[name='description']",updateBrand).val(result.data.brandDescribe)
                        //fileinput回显图片
                        var url=new Array();
                        url.push('<%=request.getContextPath()%>'+result.data.logo);
                        //销毁fileinput
                        $("#logo").fileinput("destroy");
                        //调用方法
                        initUploadFiles(url,updateBrand);
                    }
                }
            })
        }else{
            //弹出相应的提示信息
            bootbox.alert({
                message: "请选择一条信息",
                size: 'small',
                title:'提示信息',
            });
        }
    }



    //翻页
    var v_ids = [];
    function initClickEvent(){
        $("#brandTable tbody").on("click","tr",function(){
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
                v_input.closest("tr").css("background","");
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
    
    //添加面板
    function addpanel(obj){
        var parentDiv = $(obj).parent().parent();
        var parentCloneDiv = parentDiv.clone();
        parentDiv.parent().append(parentCloneDiv);
        var parentButton = parentCloneDiv.children().first();
        parentButton.html('<button type="button" class="btn btn-primary glyphicon glyphicon-remove" onclick="delpanel(this)">删除品牌</button>');
        updateaa();
    }
    //删除面板
    function delpanel(Obj){
        $(Obj).parent().parent().remove();
    }
    //添加品牌
    var addBrandDlg;
    function addBrandDlg() {
        addBrandDlg = bootbox.dialog({
            title: '<h2>添加面板</h2>',
            message:$("#add_Brand"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        //点击确定获取新增用户输入框里新增节点的值
                        //获得面板里所有的from表单
                        var formObj = $(".form-horizontal",addBrandDlg);
                        //遍历表单  放入集合中  接收往表里添加的值
                        var dataList = new Array();
                        for (var i = 0; i < formObj.length; i++){
                            //创建对象，先把值放进对象，最后再放进集合中
                            var brand = new Object();
                            //接收所有form表单的值
                            var formJson = $(formObj[i]).serializeArray();
                            //循环form的值
                            for (var k=0; k<formJson.length; k++){
                                //获取第一个值   品牌名
                                if (formJson[k].name == "brandName"){
                                    brand.brandName = formJson[k].value;
                                }
                                if (formJson[k].name == "description") {
                                    brand.description = formJson[k].value;
                                }
                                if (formJson[k].name == "brandLogo"){
                                    brand.brandLogo =formJson[k].value;
                                }
                            }
                            dataList.push(brand);
                        }
                        //把script对象转换成json格式的数据传怂到后台
                        var dataListJson = JSON.stringify(dataList);
                        $.ajax({
                            type:"post",
                            data:dataListJson,
                            contentType:"application/json; charset=utf-8",
                            url:"<%=request.getContextPath()%>/brand/addBrands.jhtml",
                            success:function(result){
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                        size: 'small',
                                        title:"提示信息"});
                                    brandTable.ajax.reload();
                                }else{
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
                                        size: 'small',
                                        title:"警告"});
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
    }

   /* function addBrandDlg() {
        addBrandDlg = bootbox.dialog({
            title: '增加品牌',
            message: $("#addBrandForm form").clone(),
            size: "large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function () {
                        //点击确定获取新增用户输入框里新增节点的值
                        var param = {};
                        var add_brandName = $("#add_brandName", addBrandDlg).val();
                        var add_description = $("#add_description", addBrandDlg).val();
                        var add_brandLogo = $("#brandLogo", addBrandDlg).val();
                        param.brandName = add_brandName;
                        param.description = add_description;
                        param.logo = add_brandLogo;
                        console.log(param);
                        $.ajax({
                            type: "post",
                            data: param,
                            url: "<%=request.getContextPath()%>/brand/add.jhtml",
                            success: function (result) {
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加成功",
                                        size: 'small',
                                        title: "提示信息"
                                    });
                                    brandTable.ajax.reload();
                                } else {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>添加失败",
                                        size: 'small',
                                        title: "警告"
                                    });
                                }
                            }
                        })
                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
        });
        updateaa(addBrandDlg);
    }*/
        //图片
        function  updateaa(addBrandDlg){
            $("#path",addBrandDlg).fileinput({
                language:'zh', //设置语言
                showRemove :false, //显示移除按钮
                showPreview :true, //是否显示预览
                autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
                enctype:'multipart/form-data',
                maxFileCount:1, //表示允许同时上传的最大文件个数,
                initialPreviewAsData:true,
                uploadUrl:"<%=request.getContextPath()%>/brand/flieinput.jhtml",
            }) .on("fileuploaded", function(event, data) {
                $("#brandLogo",addBrandDlg).val(data.response.data);
                console.log(data.response.data);
            });
    }

    //表格生成
    var brandTable;
    function initBrandTable(){

            brandTable =  $("#brandTable").DataTable({
            "searching": false,          //屏蔽datatales的查询框
            'lengthMenu': [5, 10, 15, 20],
            "processing": false,         //刷新的那个对话框
            "serverSide": true,          //服务器端分页
            "ajax" : {
                url:"<%=request.getContextPath()%>/brand/list.jhtml",
                type:"post",
                dataSrc:function (result) {
                    result.draw = result.data.draw;
                    result.recordsTotal = result.data.recordsTotal;
                    result.recordsFiltered = result.data.recordsFiltered;
                    return result.data.data;
                }
            },
            "columns": [
                {
                    "data": "id",
                    render:function(data,type,row){
                        return '<input type="checkbox" value="'+data+'" name="check" />';
                    }
                },
                {"data": "brandName"},
                {
                    "data": "logo",
                    render:function(data){
                        return '<img src="<%=request.getContextPath()%>/'+data+'" width="100px"/>'
                    }

                },
                {"data": "description"}
            ],
            "language": {
                "url": "<%=request.getContextPath()%>/js/datatable/Chinese.json",
            },
            "drawCallback": function(){
                $("#brandTable tbody").find(":checkbox").each(function(){
                    var v_id = $(this).val();
                    console.log(v_id);
                    if(isExist(v_id)){
                        //被选中
                        $(this).prop("checked",true);
                        //添加背景色
                        $(this).closest("tr").css("background","");
                    }
                })
            }
        });
    }

</script>
</html>
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
    <link href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.css"  media="all" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/js/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">


    <title>商品列表</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    商品分类管理
                    <button type="button" class="btn btn-primary" onclick="addTypeDlg();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
                    <button type="button" class="btn btn-info" onclick="editTypeDlg();"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改</button>
                    <button type="button" class="btn btn-danger" onclick="deleteTypeDlg();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
                </div>

                <div class="panel-body">
                    <ul id="goodsTypeTree" class="ztree"></ul>
                </div>
            </div>
        </div>

<div class="col-md-8">
    <div class="panel panel-info">
        <div class="panel-heading">品牌查询</div>
        <div class="panel-body">

            <form class="form-horizontal" style="margin-right: 300px" id="searchForm">
                <div class="form-group">
                    <label class="col-sm-4 control-label">商品名字:</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="goodsName" name="goodsName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">价格:</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <input type="text" class="form-control" id="minPrice" name="minPrice">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span></div>
                            <input type="text" class="form-control" id="maxPrice" name="maxPrice">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">库存:</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <input type="text" class="form-control" id="minStock" name="minStock">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></div>
                            <input type="text" class="form-control" id="maxStock" name="maxStock">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">品牌名:</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="brand" id="search_brandName">
                            <option value="-1">==请选择==</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label" >商品分类：</label>
                    <div class="col-sm-3">
                        <select class="form-control" name="Category1" onchange="changeSelect(this)" id="search_Category1">
                            <option value="-1">=一级菜单=</option>
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" name="Category2" id="search_Category2" onchange="changetype2idSelect(this)">
                            <option value="-1">=二级菜单=</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <select class="form-control" name="Category3" id="search_Category3">
                            <option value="-1">=三级菜单=</option>
                        </select>
                    </div>
                </div>

                <div style="text-align: center;">
                    <button type="button" onclick="searchGoods()" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询</button>
                    <button type="button" onclick ="clearForm(this)" class="btn btn-danger"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>重置</button>
                </div>
            </form>
        </div>
    </div>


    <button type="button" class="btn btn-primary" onclick="addGoods();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
    <button type="button" class="btn btn-danger" onclick="deleteGoods();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
    <button type="button" class="btn btn-warning" onclick="updateGoods();"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>修改</button>


    <div class="panel panel-info">
        <div class="panel-heading">商品列表</div>
        <div class="panel-body">
            <table id="goodsTable" class="table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>商品库存</th>
                    <th>商品图片</th>
                    <th>商品品牌</th>

                </tr>
                <thead>
            </table>
        </div>
    </div>

</div>


<!-- 新增商品 -->
<div id="addGoodsForm" style="display:none">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品名：</label>
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
                <select class="form-control" name="Category1" onchange="changeSelect(this)" id="category1">
                    <option value="-1">=一级菜单=</option>
                </select>
            </div>
            <div class="col-sm-2">
                <select class="form-control" name="Category2" id="category2" onchange="changetype2idSelect(this)">
                    <option value="-1">=二级菜单=</option>
                </select>
            </div>
            <div class="col-sm-2">
                <select class="form-control" name="Category3" id="category3">
                    <option value="-1">=三级菜单=</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" >商品图片：</label>
            <div class="col-sm-6">
                <input type="file" name="photo" data-ref="url12" id="path" multiple/>
                <input type="hidden" id="goodsPhoto">
            </div>
        </div>
    </form>
</div>


<%--修改商品信息--%>
<div id="updateGoodsForm" style="display:none">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品名：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="update_goodsName" placeholder="商品名">
                <input type="text" class="form-control" name="goodsId" id="update_goodsId">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品价格：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="uddate_goodsPrice" placeholder="商品价格">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品库存：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="update_stock" placeholder="商品库存">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" >商品品牌：</label>
            <div class="col-sm-6">
                <select class="form-control" name="brand" id="update_brandName">
                    <option value="-1">==请选择==</option>

                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" >商品分类：</label>
            <div class="col-sm-2">
                <select class="form-control" name="Category1" id="update_category1" onchange="changeSelect(this)">
                    <option value="-1">=一级菜单=</option>
                </select>
            </div>
            <div class="col-sm-2">
                <select class="form-control" name="Category2" id="update_category2" onchange="changetype2idSelect(this)">
                    <option value="-1">=二级菜单=</option>
                </select>
            </div>
            <div class="col-sm-2">
                <select class="form-control" name="Category3" id="update_category3">
                    <option value="-1">=三级菜单=</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" >商品图片：</label>
            <div class="col-sm-6">
                <input type="file" name="photo" data-ref="url12" id="path1" multiple/>
                <input type="text" id="update_goodsPhoto">
            </div>
        </div>
    </form>
</div>


        <!--新增节点-->
        <div id="addTypeForm" style="display: none;">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">上级分类</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="fatherName" readonly="readonly">
                        <input type="hidden" class="form-control" id="fatherId">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">分类名</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="add_typeName">
                    </div>
                </div>
            </form>
        </div>

        <!--更新节点  -->
        <div id="updateTypeForm" style="display: none;">
            <form class="form-horizontal">

                <div class="form-group">
                    <label class="col-sm-3 control-label">分类名</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="update_typeName">
                        <input type="hidden" class="form-control" id="update_typeId">
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
    <script src="<%=request.getContextPath()%>/js/zTree/js/jquery.ztree.core.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/datatable/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/datetimePicker/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/fileinput/js/fileinput.js"></script>
    <script src="<%=request.getContextPath() %>/js/fileinput/js/locales/zh.js"></script>


<script type="text/javascript">

    $(function(){
        initDataTable();
        initClickEvent();
        initTree();
        initType();
    })

    //三级联动
    var  datalist = null;
    function  initType() {
        $.ajax({
            url:"<%=request.getContextPath()%>/goods/findTypeList.jhtml",
            type:"post",
            success:function(result){
                datalist =result.data;
                for (var i = 0; i < datalist.length; i++) {
                    if (datalist[i].fatherId == 1) {
                        $("[name='Category1']").append('<option  value="' + datalist[i].id + '">' + datalist[i].name + '</option>');
                    };

                }
                changeSelect();
                changetype2idSelect();
            }
        })
    }
    //第一个下拉框的
    function changeSelect(obj) {
        $("[name='Category2']").html("<option  value=''>=二级菜单=</option>");
        for (var i = 0; i < datalist.length; i++) {
            if ($(obj).val() == datalist[i].fatherId) {
                $("[name='Category2']").append('<option  value="' + datalist[i].id + '">' + datalist[i].name + '</option>');
            }
        }
        if ($(obj).val() == ''){
            $("[name='Category2']").html("<option  value=''>---请选择-</option>");
        }
    }

    //第二个下拉框的
    function  changetype2idSelect(obj) {
        $("[name='Category3']").html("<option  value=''>=三级菜单=</option>");
        for (var i = 0; i < datalist.length; i++) {
            if ($(obj).val()== datalist[i].fatherId) {
                $("[name='Category3']").append('<option  value="' + datalist[i].id + '">' + datalist[i].name + '</option>');
            }
        }
        if ($(obj).val()== ''){
            $("[name='Category3']").html("<option  value=''>---请选择-</option>");
        }
    }

    //修改商品
    var updateGoodsDlg;
    function updateGoods() {
        if (v_ids.length == 1) {
            $("#update_goodsId").val(v_ids[0]);
            updateGoodsDlg = bootbox.dialog({
            title: '修改商品',
                message: $("#updateGoodsForm form").clone(),
                size: "large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function (){

                            $.ajax({
                                type: "post",
                                data:{"goodsId":$("#update_goodsId").val()},
                                url: "<%=request.getContextPath()%>/goods/queryGoodsById.jhtml",
                                success: function (result) {
                                    if (result.code == 200) {
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>商品添加成功",
                                            size: 'small',
                                            title: "提示信息"
                                        });
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
        }else if(v_ids.length == 0){
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请先选择一个",
                size: 'small',
                title: "提示",
            })
        }else{
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个",
                size: 'small',
                title: "提示",
            })
        }
    }

    //条件查询
    function  searchGoods() {
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/goods/findBrand.jhtml",
            success:function (result) {
                console.log(result);
                for (var i=0; i<=result.data.length; i++){
                    $("#search_brandName").append('<option value="'+result.data[i].id+'">'+result.data[i].brandName+'</option>');
                }
            }
        })

        //获取数据并赋值
        var param = {};
        param.goodsName = $("#goodsName").val();
        param.minPrice = $("#minPrice").val();
        param.maxPrice = $("#maxPrice").val();
        param.minStock = $("#minStock").val();
        param.maxStock = $("#maxStock").val();
        param.category1 = $("#search_Category1").val();
        param.category2 = $("#search_Category2").val();
        param.category3 = $("#search_Category3").val();
        //传递参数
        goodsTable.settings()[0].ajax.data = param;
        //刷新表格
        goodsTable.ajax.reload();

    }

    //新增商品
    var addGoodsDlg;
    function addGoods() {
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/goods/findBrand.jhtml",
            success:function (result) {
                console.log(result);
                for (var i=0; i<=result.data.length; i++){
                    $("#add_brandName",addGoodsDlg).append('<option value="'+result.data[i].id+'">'+result.data[i].brandName+'</option>');
                }
            }
        })

        addGoodsDlg = bootbox.dialog({
            title: '添加商品',
            message: $("#addGoodsForm form").clone(),
            size: "large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function () {
                        //点击确定获取新增用户输入框里新增节点的值
                        var param = {};
                        var add_goodsName = $("#add_goodsName", addGoodsDlg).val();
                        var add_goodsPrice = $("#goodsPrice", addGoodsDlg).val();
                        var add_stock = $("#stock", addGoodsDlg).val();
                        var add_brand = $("#brand", addGoodsDlg).val();
                        var add_photo = $("#goodsPhoto", addGoodsDlg).val();
                        var add_brand = $("#add_brandName",addGoodsDlg).val();
                        var Category1 = $("#category1",addGoodsDlg).val();
                        var Category2 = $("#category2",addGoodsDlg).val();
                        var Category3 = $("#category3",addGoodsDlg).val();

                        param.goodsName = add_goodsName;
                        param.goodsPrice = add_goodsPrice;
                        param.stock = add_stock;
                        param.goodsPhoto = add_photo;
                        param["brand.id"] = add_brand;
                        param.category1 = Category1;
                        param.category2 = Category2;
                        param.category3 = Category3;

                        console.log(param);
                        $.ajax({
                            type: "post",
                            data: param,
                            url: "<%=request.getContextPath()%>/goods/add.jhtml",
                            success: function (result) {
                                if (result.code == 200) {
                                    bootbox.alert({
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>商品添加成功",
                                        size: 'small',
                                        title: "提示信息"
                                    });
                                    goodsTable.ajax.reload();
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
        updateaa(addGoodsDlg);
    }
    //图片
    function  updateaa(addGoodsDlg){
        $("#path",addGoodsDlg).fileinput({
            language:'zh', //设置语言
            showRemove :false, //显示移除按钮
            showPreview :true, //是否显示预览
            autoReplace:false, //是否自动替换当前图片，设置为true时，再次选择文件， 会将当前的文件替换掉。
            enctype:'multipart/form-data',
            maxFileCount:1, //表示允许同时上传的最大文件个数,
            initialPreviewAsData:true,
            uploadUrl:"<%=request.getContextPath()%>/goods/flieinput.jhtml",
        }) .on("fileuploaded", function(event, data) {
            $("#goodsPhoto",addGoodsDlg).val(data.response.data);
            console.log(data.response.data);
        });
    }

    //删除品牌
    function deleteGoods(){
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
                            url:"<%=request.getContextPath()%>/goods/deleteBatch.jhtml",
                            data:{"idList":v_ids},
                            success:function(result){
                                if(result.code == 200){
                                    //刷新页面
                                    goodsTable.ajax.reload();

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

    //翻页
    var v_ids = [];
    function initClickEvent(){
        $("#goodsTable tbody").on("click","tr",function(){
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
                v_input.closest("tr").css("background","pink");
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

    //商品表格生成
    var goodsTable;
    function initDataTable(){

        goodsTable = $("#goodsTable").DataTable({
            "searching": false,          //屏蔽datatales的查询框
            'lengthMenu': [5, 10, 15, 20],
            "processing": false,         //刷新的那个对话框
            "serverSide": true,          //服务器端分页
            "ajax" : {
                url:"<%=request.getContextPath()%>/goods/list.jhtml",
                "dataSrc":function(result){
                    if(result.code==200){
                        result.draw = result.data.draw;
                        result.iTotalRecords=result.data.iTotalRecords;
                        result.iTotalDisplayRecords=result.data.iTotalDisplayRecords;
                        return result.data.data;
                    }
                }
            },
            "columns": [
                {
                    "data": "goodsId",
                    render:function(data,type,row){
                        return '<input type="checkbox" value="'+data+'" name="check" />';
                    }
                },
                {"data": "goodsName"},
                {"data": "goodsPrice"},
                {"data": "stock"},
                {
                    "data": "goodsPhoto",
                    render:function (data) {
                        return '<img src="<%=request.getContextPath()%>/'+data+'" width="50px;"/>';
                    }
                },
                {"data": "brand.brandName"},
            ],
            "language": {
                "url": "<%=request.getContextPath()%>/js/datatable/Chinese.json",
            },

            "drawCallback": function(){
                $("#goodsTable tbody").find(":checkbox").each(function(){
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

    //初始化商品分类树
    function initTree(){
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/goods/goodsType.jhtml",
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
                    $(document).ready(function(){
                        $.fn.zTree.init($("#goodsTypeTree"), setting, result.data);
                    });
                }
            }
        })
    }

    //增加
    function addTypeDlg(){
        //获得选择的节点
        var treeObj = $.fn.zTree.getZTreeObj("goodsTypeTree");
        var nodes = treeObj.getSelectedNodes();
        //弹出对话框
        if(nodes.length == 1){
            //获取选中节点的id和name
            var v_id = nodes[0].id;
            var v_name = nodes[0].name;
            //给弹出框赋值
            $("#fatherName").val(v_name);
            $("#fatherId").val(v_id);

            //弹出框
            var addDialog = bootbox.dialog({
                title: '添加分类',
                message:$("#addTypeForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            //点击确认按钮发送ajax请求,将数据插入到数据库
                            var param = {};
                            param.name = $("#add_typeName",addDialog).val();
                            param.fatherId = v_id;
                            $.ajax({
                                type:"post",
                                url:"<%=request.getContextPath()%>/goods/addType.jhtml",
                                data:param,
                                success:function(result){
                                    if(result.code == 200){
                                        //进行前台增加
                                        var treeObj = $.fn.zTree.getZTreeObj("goodsTypeTree");
                                        var newNode = {};
                                        newNode.id = result.data.id;
                                        newNode.name = result.data.name;
                                        newNode.pId = result.data.fatherId;
                                        newNodes = treeObj.addNodes(nodes[0], newNode);
                                    }else{
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>类型添加失败",
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
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择类别",
                size: 'small',
                title:"提示信息"});
        }else{
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个类别",
                size: 'small',
                title:"提示信息"});
        }
    }


    //修改节点
    function editTypeDlg(){
        //获得选择的节点
        var treeObj = $.fn.zTree.getZTreeObj("goodsTypeTree");
        var nodes = treeObj.getSelectedNodes();
        //弹出对话框
        if(nodes.length == 1){
            //获得当前选中节点的id和name
            var v_id = nodes[0].id;
            var v_deptName = nodes[0].name;
            //给弹出框赋值
            $("#update_typeName").val(v_deptName);
            $("#update_typeId").val(v_id);
            //弹出对话框
            var editDialog = bootbox.dialog({
                title: '修改类别',
                message:$("#updateTypeForm form").clone(),
                size:"large",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-primary',
                        callback: function(){
                            //点击确认按钮发送ajax请求,修改数据
                            var param = {};
                            param.id = v_id;
                            param.name = $("#update_typeName",editDialog).val();

                            $.ajax({
                                type:"post",
                                url:"<%=request.getContextPath()%>/goods/queryGoodsById.jhtml",
                                data:param,
                                success:function(result){
                                    if(result.code == 200){
                                        //进行前台的修改
                                        nodes[0].name = $("#update_typeName",editDialog).val();

                                        treeObj.updateNode(nodes[0]);
                                    }else{
                                        //弹出提示信息
                                        bootbox.alert({
                                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>修改类别"+result.message,
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
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择要修改的类别",
                size: 'small',
                title:"提示信息"});
        }else{
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>只能选择一个类别",
                size: 'small',
                title:"提示信息"});
        }
    }

    //删除类别
    function deleteTypeDlg(){
        //获得当前选中的节点
        var treeObj = $.fn.zTree.getZTreeObj("goodsTypeTree");
        var nodes = treeObj.getSelectedNodes();

        //判断选中的节点个数
        if(nodes.length == 0){
            //弹出提示信息
            bootbox.alert({
                message: "<span class='glyphicon glyphicon-exclamation-sign'></span>请选择类别",
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
                            url:"<%=request.getContextPath()%>/goods/deleteGoodsType.jhtml",
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
                                        message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除类别失败",
                                        size: 'small',
                                        title:"提示信息"});
                                }
                            }
                        })
                    }else{
                        //弹出提示信息
                        bootbox.alert({
                            message: "<span class='glyphicon glyphicon-exclamation-sign'></span>删除类别失败",
                            size: 'small',
                            title:"提示信息"});
                    }
                }
            })
        }
    }

</script>
</body>
</html>
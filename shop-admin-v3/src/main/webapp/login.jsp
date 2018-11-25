<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>

 	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css"  rel="stylesheet" >
	
</head>
<body>

	<form class="form-horizontal">
	  <div class="form-group" style="margin-top: 10px;text-align: center;">
	    <label class="col-sm-3 control-label">用户名</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="loginName" placeholder="请输入用户名">
	    </div>
	  </div>
	  
	   <div class="form-group" style="margin-top: 10px;text-align: center;">
	    <label class="col-sm-3 control-label">密码</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="pwd" placeholder="请输入密码">
	    </div>
	  </div>
	  
	    <div class="form-group">
            <label  class="col-sm-3 control-label">验证码</label>
            <div class="col-sm-3" style="width:400px;">
                  <input type="text" class="form-control" placeholder="请输入验证码" id="imgCode" />
            </div>
            <div class="col-sm-3">
            	 <img src="<%=request.getContextPath()%>/img/code" onclick="imgAuthImagText(this)"/>
            </div>
        </div>
	  
	  <div class="form-group" style="margin-top: 10px;text-align: center;">
        	<div class="col-sm-4"></div>
        	<div class="col-sm-4">
	        	<div style="float: left;margin-left: 50px;"><button type="button" class="btn btn-success" onclick="login()"  ><span class="glyphicon glyphicon-search" >登录</span></button></div>
                <div style="float: left;margin-left: 50px;"><button type="reset" class="btn btn-danger" ><span class="glyphicon glyphicon-edit" >重置</span></button></div>
        	</div>
        </div>
	</form>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootbox.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/md5.js"></script>
</body>

	<script type="text/javascript">
		
		function login(){
			//获取用户填入的用户名，密码，验证码
			v_loginName = $("#loginName").val();
			v_pwd = $("#pwd").val();
			v_imgCode = $("#imgCode").val();
			var param = {};
			param.loginName = v_loginName;
			param.pwd = hex_md5(v_pwd);
			param.imgCode = v_imgCode;
			console.log(param);
			$.ajax({
				type:"post",
				data:param,
				url:"<%=request.getContextPath()%>/login.jhtml",
				success:function(result){
					if(result.code == 200){
						location.href = "<%=request.getContextPath()%>/index.jhtml";
					}else{
						//弹出提示信息
						bootbox.alert({
				              message: "<span class='glyphicon glyphicon-exclamation-sign'></span>"+result.message,
				              size: 'small',
				              title:"提示信息"});
					}
				}
			})
			
			
		}
	</script>
</html>
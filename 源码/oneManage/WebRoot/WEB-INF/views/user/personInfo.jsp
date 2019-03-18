<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="keywords" content="" />
    <meta name="description" content="LarryCMS Version:1.09" />
	<meta name="Author" content="larry" />
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="${path}/common/frame/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/common/css/gobal.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/common/css/animate.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/system/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/system/css/mypanel.css" media="all">
</head>
</head>
<body>
<div class="larry-fluid larry-wrapper">
    <div class="layui-row lay-col-space20">
    	<div class="layui-cos-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12">
    		<section class="larry-body animated fadeInRightBig">
    			<div class="larry-body-header">
    				<span class="tit">个人信息</span>
    			</div>
    			<div class="larry-body-content clearfix">
    				<form class="layui-form" action="" method="post">
    				<input type="hidden" name="id" value="${user.id }">
				        <div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
						<input type="text" name="loginName"  value="${user.loginName }" autocomplete="off"  class="layui-input layui-disabled" disabled="disabled" >
					</div>
				</div>
				<!-- <div class="layui-form-item">
					<label class="layui-form-label">所属角色</label>
					<div class="layui-input-block">
						<input type="text" name="username"  autocomplete="off" class="layui-input layui-disabled" value="超级管理员" disabled="disabled">
					</div>
				</div> -->
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-block">
						<input type="text" name="name" required  lay-verify="required" autocomplete="off" class="layui-input" value="${user.name }">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text" name="mobile"  value="${user.mobile }" autocomplete="off" class="layui-input" placeholder="输入手机号码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" name="email"  value="${user.email }" autocomplete="off" class="layui-input" placeholder="输入邮箱地址">
					</div>
				</div>
				<!-- <div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<input type="radio" id="boy" name="sex" value="1" title="男"><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>男</span></div>
						<input type="radio" id="girl" name="sex" value="0" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>女</span></div>
					</div>
				</div> -->
				<div class="layui-form-item">
					<label class="layui-form-label">修改头像</label>
					<div class="layui-input-block">
						<img id="imgg" alt="" src="${path }${user.img}" width="200px" height="200px" />
						<input type="hidden" id="img" name="img" value="${user.img }">
						<button type="button" class="layui-btn" id="test1">
						  <i class="layui-icon">&#xe67c;</i>上传图片
						</button>
						
					</div>
				</div>
				
				<!-- <div class="layui-form-item">
					<label class="layui-form-label">界面语言</label>
					<div class="layui-input-block">
						<select name="interest" lay-filter="aihao">
							<option value=""></option>
							<option value="0" selected="selected">中文</option>
							<option value="1">英文</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">座右铭</label>
					<div class="layui-input-block">
						<textarea placeholder="既然选择了远方，便只顾风雨兼程；路漫漫其修远兮，吾将上下而求索" value="" class="layui-textarea"></textarea>
					</div>
				</div> -->
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
    			</div>
    		</section>
    	</div>
    </div>
</div>
<!-- 加载js文件 -->
<script type="text/javascript" src="${path}/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path}/system/js/common.js"></script> 
<script type="text/javascript" src="${path}/system/js/mypanel.js"></script>
<script type="text/javascript">
	var path = "${path}";
	var sex = "${user.sex}";
	
	layui.config({
		base: path + '/common/lib/'
	});
	
	/* if(sex == '0'){
		$("#girl").attr("checked","checked");
	}else{
		alert('aa');
		$("#boy").attr("checked", true);
	} */
</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Basic后台管理系统2.0.0登录页面</title>
	<meta name="keywords" content="LarryCMS后台管理模版" />
    <meta name="description" content="LarryCMS后台管理模版" />
    <meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="Author" content="larry" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="Shortcut Icon" href="../favicon.ico" />
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="${path}/common/frame/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path}/common/css/gobal.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path}/common/css/animate.css" media="all">
	<link rel="stylesheet" type="text/css" href="${path}/system/css/login.css" media="all">
</head>
<body>
<div class="larry-main layui-layout animated shake larry-delay2" id="larry_login">
	<div class="title">OneManage管理系统</div>
	<p class="info">后台登录中心</p>
	<div class="user-info">
		<div class="avatar"><img src="${path }/system/images/photo/admin.png" alt=""></div>
		<form class="layui-form" id="larry_form" action="" method="post">
			 <div class="layui-form-item">
			 	  <label class="layui-form-label">用户名:</label>
			 	  <input type="text" name="name" required  lay-verify="required" aautocomplete="off" class="layui-input larry-input" placeholder="请输入您的用户名">
			 </div>
			 <div class="layui-form-item" id="password">
			 	  <label class="layui-form-label">密码:</label>
			 	  <input type="password" name="pwd" required lay-verify="required|password" aautocomplete="off" class="layui-input larry-input" placeholder="请输入您的登录密码">
			 </div>
			<%--  <div class="layui-form-item larry-verfiy-code" id="larry_code">
			 	   <input type="text" name="code" lay-verfy="" aautocomplete="off" class="layui-input larry-input layui-disabled" placeholder="输入验证码"  disabled="disabled">
			 	   <div class="code">
			 	   	   <div class="arrow"></div>
			 	   	   <div class="code-img"><img src="${path }/system/images/login/captcha.jpg" alt="" class="layui-disabled" id="codeimage" disabled="disabled"></div>
			 	   	   <a id="change" class="change layui-disabled" disabled="disabled" title="看不清,点击更换验证码"><i></i></a>
			 	   </div>
			 </div> --%>
			 <div class="layui-form-item">
			 	 <button class="layui-btn larry-btn" lay-filter="submit" lay-submit>立即登录</button>
			 </div>
		</form>
	</div>
	<div class="copy-right">© 2016-2017 ONE源码 版权所有  <a href="http://www.y-oen.cn" target="_blank">y-one.cn</a></div>
</div>
	<!-- 加载js文件-->
<script type="text/javascript" src="${path}/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path}/common/js/gobal.js"></script>
<script type="text/javascript" src="${path}/system/js/login.js"></script>
<script type="text/javascript">
	var path = "${path}";
	layui.config({
		base: path + '/common/lib/'
	});
	
</script>
</body>
</html>
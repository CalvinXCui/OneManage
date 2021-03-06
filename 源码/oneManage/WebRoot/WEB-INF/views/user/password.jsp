<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改密码</title>
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
    		<section class="larry-body animated bounceIn">
                <div class="larry-body-header">
    				<span class="tit">修改密码</span>
    			</div>
    			<div class="larry-body-content clearfix changepwd">
                    <form class="layui-form layui-col-lg8 layui-col-md12 layui-col-sm12 layui-col-xs12 " method="post" action="">
			 	        <!-- <div class="layui-form-item">
				        	<label class="layui-form-label">用户名</label>
				        	<div class="layui-input-block">  
				        	  	<input type="text" name="title"  autocomplete="off"  class="layui-input layui-disabled" value="admin" disabled="disabled" >
				        	</div>
				        </div> -->
				        <div class="layui-form-item">
				        	<label class="layui-form-label">旧密码</label>
				        	<div class="layui-input-block">  
				        	  	<input type="password" name="pwd"  autocomplete="off" required  lay-verify="required" class="layui-input" value="" placeholder="请输入旧密码">
				        	</div>
				        </div>
				        <div class="layui-form-item">
				        	<label class="layui-form-label">新密码</label>
				        	<div class="layui-input-block">  
				        	  	<input type="password" name="pwd1"  autocomplete="off" required  lay-verify="required" class="layui-input" value="" placeholder="请输入新密码">
				        	</div>
				        </div>
				        <div class="layui-form-item">
				        	<label class="layui-form-label">确认密码</label>
				        	<div class="layui-input-block">  
				        	  	<input type="password" name="pwd2"  autocomplete="off"  required  lay-verify="required" class="layui-input" value="" placeholder="请输入确认新密码">
				        	</div>
				        </div>
				        <div class="layui-form-item change-submit">
				        	<div class="layui-input-block">
				        		<button class="layui-btn larry-tj" lay-submit="" lay-filter="demo2">立即提交</button>
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
</script>
</body>
</html>
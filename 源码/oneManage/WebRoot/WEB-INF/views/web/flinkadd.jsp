<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>友情链接</title>
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
	<link rel="stylesheet" type="text/css" href="${path }/common/frame/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path }/common/css/gobal.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path }/system/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path }/system/css/flink.css" media="all">
</head>
<style type="text/css" media="screen">
	.larry-tj{
		margin-left: 10px;
		margin-right: 25px;
	}
	.larry-btn-btn{
		width: 230px;
		padding-top: 10px;
		margin: 0 auto;
	}
	.layui-form .layui-form-label{
		padding-left: 15px;
		color: #666666;
	}
	.layui-form .layui-input-block{
		width: 300px;
	}
	.layui-form .layui-input-block input,.layui-form .layui-input-block textarea{
		color: #aaaaaa;
	}
</style>
<body>
<div class="layui-fluid larry-wrapper">

    <fieldset class="layui-elem-field layui-field-title site-title">
      <legend><a name="methodRender">添加友情链接</a></legend>
    </fieldset>
  <form class="layui-form">
  		<input type="hidden" name="id" value="${friendLink.id }">
		<div class="layui-form-item">
			<label class="layui-form-label">网站名称</label>
			<div class="layui-input-block">
				<input type="text" name="webname" value="${friendLink.webname }" class="layui-input linksName" lay-verify="required" placeholder="请输入网站名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">网站地址</label>
			<div class="layui-input-block">
				<input type="tel" name="alink" value="${friendLink.alink }" class="layui-input linksUrl" lay-verify="required|url" placeholder="请输入网站地址">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">站长邮箱</label>
			<div class="layui-input-block">
				<input type="text" name="email" value="${friendLink.email }" class="layui-input masterEmail" lay-verify="email" placeholder="请输入站长邮箱">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">站点描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入站点描述" name="content" class="layui-textarea">${friendLink.content }</textarea>
			</div>
		</div>
		<div class="layui-form-item larry-btn-btn">
				<button class="layui-btn larry-tj" lay-submit lay-filter="add">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form>


</div>

<!-- 加载js文件 -->
<script type="text/javascript" src="${path }/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path }/system/js/common.js"></script>
<script type="text/javascript" src="${path }/system/js/linkadd.js"></script>
<script type="text/javascript">
	var path = "${path}";
	
	layui.config({
		base: path + '/common/lib/'
	});

</script>
</body>
</html>
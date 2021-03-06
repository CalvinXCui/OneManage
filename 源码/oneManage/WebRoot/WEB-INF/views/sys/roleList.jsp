<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>角色管理</title>
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
    <link rel="stylesheet" type="text/css" href="${path }/common/css/animate.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path }/system/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path }/system/css/user.css" media="all">
</head>
</head>
<body>
<div class="layui-fluid larry-wrapper">
    <div class="layui-row  animated bounceIn">
    	<div class="layui-col-lg12 layui-col-md12 layui-col-sm12 layui-col-xs12">
    		<fieldset class="layui-elem-field layui-field-title site-title">
                <legend><a name="color-design">角色管理</a></legend>
            </fieldset>
            <div class="layui-btn-group larry-group" id="larry_group">
                <button class="layui-btn"  data-type="add"><i class="layui-icon">&#xe61f;</i><cite>增加角色</cite></button>
                <!-- <button class="layui-btn layui-btn-normal"  data-type="edit"><i class="layui-icon">&#xe642;</i><cite>修改角色</cite></button>
                <button class="layui-btn layui-btn-danger"  data-type="del"><i class="layui-icon">&#xe640;</i><cite>删除角色</cite></button> -->
            </div>
    	</div>

    	<div class="layui-col-lg10 layui-col-md10 layui-col-sm12 layui-col-xs12">
    		<div class="user-tables">
    			<table id="userTables" lay-filter="userTables"></table>
    		</div>
    	</div>
    </div>
</div>
<script type="text/html" id="userbar">
  <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="shouquan">权限设置</a>
  {{#  if(d.useable === '0'){ }}
     	<a class="layui-btn layui-btn-warm  layui-btn-mini" lay-event="disable">禁用</a>
  {{#  } else { }}
		<a class="layui-btn layui-btn-warm  layui-btn-mini" lay-event="able">置为可用</a>
  {{#  } }}
  <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
</script>
<script type="text/html" id="img">
  {{#  if(d.img === undefined){ }}
      未知
  {{#  } else { }}
		<img id="img" alt="" src="/basicManage{{d.img}}" width="50px" height="50px" />
  {{#  } }}
</script>
<script type="text/html" id="status">
  {{#  if(d.useable === undefined){ }}
      未知
  {{#  } else { }}
		 {{#  if(d.useable === '0'){ }}
     		 可用
  		{{#  } else { }}
			禁用
  		{{#  } }}
  {{#  } }}
</script>
<!-- 加载js文件 -->
<script type="text/javascript" src="${path }/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path }/system/js/common.js"></script> 
<script type="text/javascript" src="${path }/system/js/role.js"></script> 
<script type="text/javascript">
	var path = "${path}";
	
	layui.config({
		base: path + '/common/lib/'
	});
</script>
</body>
</html>
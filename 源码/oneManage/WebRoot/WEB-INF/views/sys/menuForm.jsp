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
      <legend><a name="methodRender">菜单编辑</a></legend>
    </fieldset>
  <form class="layui-form">
  		<input type="hidden" name="id" value="${menu.id }">
  		<input type="hidden" name="pid" value="${menu.pid }">
  		<div class="layui-form-item">
			<label class="layui-form-label">上级菜单</label>
			<div class="layui-input-block">
				${menuP.title }
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">菜单名称</label>
			<div class="layui-input-block">
				<input type="text" name="title" value="${menu.title }" class="layui-input linksName" lay-verify="required" placeholder="请输入菜单名称">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">方法地址</label>
			<div class="layui-input-block">
				<input type="tel" name="url" value="${menu.url }" class="layui-input linksUrl" lay-verify="" placeholder="请输入方法地址">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">图标</label>
			<div class="layui-input-block">
				<c:if test="${menu.id eq ''}">
					<input type="text" name="icon" value="${menu.icon}" class="layui-input " lay-verify="" placeholder="请输入图标代号">
					<div class="layui-form-mid layui-word-aux">图标暂时先手动填写，后续优化选择器选择！</div>
				</c:if>
				<c:if test="${menu.id ne ''}">
					<i class="icon larry-icon">${menu.icon}</i>
				</c:if>
				
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序</label>
			<div class="layui-input-block">
				<input type="text" name="sort" value="${menu.sort }" class="layui-input masterEmail" lay-verify="required" placeholder="请输入排序">
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
<script type="text/javascript">
	var path = "${path}";
	
	layui.config({
		base: path + '/common/lib/'
	});

	layui.use(['form','layer','jquery'],function(){
		   var $ = layui.$,
		   form = layui.form,
		   layer = layui.layer;
		   form.on('submit(add)',function(data){
		     //layer.msg('最近页面写的好累啊！说好了只给个静态演示页的，完整的待后面再更新吧！',{icon: 5,time:5000,shade:0.1});
		     var ajaxReturnData;
		        //登陆验证
		        $.ajax({
		            url: path + '/menu/save.do',
		            type: 'post',
		            async: false,
		            data: data.field,
		            success: function (data) {
		                ajaxReturnData = data;
		            }
		        });
		        //结果回应
		        if (ajaxReturnData == '0') {
		        	top.layer.msg('保存成功', {icon: 1});
		            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		            parent.layer.close(index); //再执行关闭                        //刷新父页面
		            parent.location.reload();
		        } else {
		        	top.layer.msg('保存失败', {icon: 5});
		        }
		        return false;
		   });
		});
</script>
</body>
</html>
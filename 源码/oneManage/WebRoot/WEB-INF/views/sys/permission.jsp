<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>权限编辑</title>
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
    
    <!-- ztree -->
    <script src="${path}/common/zTree/js/jquery-1.4.4.min.js"></script>
    <script src="${path}/common/zTree/js/jquery.ztree.all.js"></script>
    <script src="${path}/common/zTree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${path}/common/zTree/js/jquery.ztree.excheck.js"></script>
	<link href="${path}/common/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
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
      <legend><a name="methodRender">权限编辑</a></legend>
    </fieldset>
    <div style="float:right;"><button class="layui-btn" onclick="onCheck();">保存权限</button></div>
    <div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
  <%-- 	<form class="layui-form">
  		<input type="hidden" name="id" value="${role.id }">
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称</label>
			<div class="layui-input-block">
				<input type="text" name="name" value="${role.name }" class="layui-input linksName" lay-verify="required" placeholder="请输入角色名称">
			</div>
		</div>
		<div class="layui-form-item larry-btn-btn">
				<button class="layui-btn larry-tj" lay-submit lay-filter="add">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form> --%>
		
</div>

<!-- 加载js文件 -->
<script type="text/javascript" src="${path }/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path }/system/js/common.js"></script>
<SCRIPT type="text/javascript">
	var path = "${path}";
	var roleId = "${role.id}";
	
	layui.config({
		base: path + '/common/lib/'
	});
	
	$(document).ready(function(){
		//加载树
		loadTree();
	});

	//树加载
	function loadTree(){
	    $.ajax({
	        type: "post",
	        dataType: "json", 
	        traditional: true,
	        data: { roleId: roleId },
	        url: path + "/menu/dataCheckJson.do",
	        async: true,//表示同步执行
	        success: function (data) {
	            if (data != null) {
	            	$.fn.zTree.init($("#treeDemo"), setting, data);
	            }

	        }
	    });
	} 
	
	
		var setting = {
			check: {
		        chkboxType:{"Y":"ps","N":"ps"},//勾选checkbox对于父子节点的关联关系,取消勾选时不关联父  
		        chkStyle:"checkbox",
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		var code;
		function showCode(str) {
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>"+str+"</li>");
		}
		
		//获取选中节点  
		function onCheck(){  
		     var rid = roleId;  
		     var treeObj=$.fn.zTree.getZTreeObj("treeDemo");  
		     var nodes=treeObj.getCheckedNodes(true);  
		     //var ids = new Array();
		     var ids = "";
		     for(var i=0;i<nodes.length;i++){ 
		    	// ids.push(nodes[i].id); 
		        //获取选中节点的值  
		    	 ids += nodes[i].id + ",";
		     }
		    ajaxSubmit(rid,ids);       
		}
		function ajaxSubmit(rid, ids){
			layer.msg('保存中', {
				  icon: 16
				  ,shade: 0.1
				});
			var ajaxReturnData;
	        //登陆验证
	        $.ajax({
	            url: path + '/role/savePermission.do',
	            type: 'post',
	            async: false,
	            data: {roleId:rid, ids:ids.toString()},
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
		}
	</SCRIPT>
<script type="text/javascript">

	layui.use(['form','layer','jquery'],function(){
		   var $ = layui.$,
		   form = layui.form,
		   layer = layui.layer;
		   
		   form.on('submit(add)',function(data){
		     var ajaxReturnData;
		        //登陆验证
		        $.ajax({
		            url: path + '/role/save.do',
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
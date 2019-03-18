<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>菜单管理</title>
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
    <link rel="stylesheet" type="text/css" href="${path}/system/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/system/css/flink.css" media="all">
    
	<!-- ztree -->
    <script src="${path}/common/zTree/js/jquery-1.4.4.min.js"></script>
    <script src="${path}/common/zTree/js/jquery.ztree.all.js"></script>
    <script src="${path}/common/zTree/js/jquery.ztree.core.js"></script>
	<link href="${path}/common/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<div class="layui-fluid larry-wrapper">
	<!-- <div class="layui-container">   -->
	<div class="">  
		  <div class="layui-row">
		    <div class="layui-col-md3">
				<!-- 右边 开始-->
				<div id="treeContainer" class="treeContainer">
				    <ul id="tree" class="ztree"></ul>
				</div>
				<!-- 右边 结束-->
		    </div>
		    <div class="layui-col-md9">
		    	<!-- 左边 开始 -->
			       <blockquote class="layui-elem-quote larry-btn">
					<div class="layui-inline">
					    <div class="layui-input-inline">
					    	<input type="text" name="search" value="" id="search_input" placeholder="请输入菜单名称" class="layui-input larry-search-input">
					    </div>
					    <a class="layui-btn search_btn" data-type="getSelect">查询</a>
					</div>
					<div class="layui-inline">
						<a class="layui-btn layui-bg-pale" data-type="addLink">添加顶级菜单</a>
					</div>
					<div class="layui-inline">
						<a class="layui-btn layui-btn-danger" data-type="delLink">批量删除</a>
					</div>
				</blockquote>
				<!-- 友链数据列表 -->
				<div class="flinkTable">
					<table class="layui-table" id="flinklist" lay-filter="flinkTables"></table>
				</div>
		    	<!-- 左边 结束-->
		    </div>
		  </div>
	 </div>
</div>
<script type="text/html" id="flinkbar">
  <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
  <a class="layui-btn layui-btn-normal layui-btn-mini" lay-event="add">添加下一节点</a>
</script>
<script type="text/html" id="linkTpl">
	<i class="icon larry-icon">{{d.icon}}</i>
</script>
<!-- 加载js文件 -->
<script type="text/javascript" src="${path}/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path}/system/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//加载树
		loadTree('1');
	});

	//树加载
	function loadTree(pid){
	    $.ajax({
	        type: "post",
	        dataType: "json", 
	        traditional: true,
	        data: { pid: pid },
	        url: path + "/menu/dataJson.do",
	        async: true,//表示同步执行
	        success: function (data) {
	            if (data != null) {
	                $.fn.zTree.init($("#tree"), setting, data);
	                //默认收个节点选中
	                var zTree = $.fn.zTree.getZTreeObj("tree");//获取ztree对象  
	                var node = zTree.getNodeByParam('id', 75);//获取id为1的点  
	                zTree.selectNode(node);//选择点  
	                zTree.setting.callback.onClick(null, zTree.setting.treeId, node);//调用事件 
	            }

	        }
	    });
	} 

	var zTree;
	var demoIframe;

	var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			onClick: onClick,
		}
		
	};

	function onClick(e,treeId,treeNode) {
		onClick(treeNode.id);
        return false;
    }
	
</script>
<script type="text/javascript">
	var path = "${path}";
	
	layui.config({
		base: path + '/common/lib/'
	});
	
	layui.use(['layer', 'form', 'table', 'common'], function() {
		var $ = layui.$,
			layer = layui.layer,
			form = layui.form,
			table = layui.table,
			common = layui.common;

		  window.onClick = function(id){
			   table.reload('flinkTables', {
	        	  page: false,
	        	  where: {
	        		  pid:id
	        	  }
		       });
		   }
		   
		var tableIns =table.render({
			elem: '#flinklist',
			id: 'flinkTables',
			cols: [
				[{
					checkbox: true,
					width: 60,
					fixed: true
				}, {
					field: 'id',
					width: 80,
					title: 'ID',
					sort: true,
					// fixed: true
				}, {
					field: 'title',
					width: 200,
					title: '菜单名称',
					align:'center',
				}, {
					field: 'icon',
					width: 250,
					title: '图标',
					align:'center',
					templet: '#linkTpl'
				}, {
					field: 'url',
					title: '对应的方法',
					align:'center',
					width: 300
				},  {
					title: '操作',
					width: 300,
					align: 'center',
					toolbar: '#flinkbar',
					fixed: 'right',
				}]
			],
			url: path + '/menu/data.do',
			page: false,
			even: true,
		});

		//监听工具条
		table.on('tool(flinkTables)', function(obj) {
			var data = obj.data;
			if (obj.event === 'del') {
				layer.confirm('真的删除菜单及其所有子菜单么？', function(index) {
					//obj.del();
					var ajaxReturnData;
			        $.ajax({
			            url: path + '/menu/delete.do',
			            type: 'post',
			            async: false,
			            data: {id:data.id},
			            success: function (data) {
			                ajaxReturnData = data;
			            }
			        });
			        //删除结果
			        if (ajaxReturnData == '0') {
			            table.reload('flinkTables');
			            layer.msg('删除成功', {icon: 1});
			        } else {
			        	layer.msg('删除失败', {icon: 5});
			        }
					
					layer.close(index);
				});
			} else if (obj.event === 'edit') {
				var index = layer.open({
					title: "菜单修改",
					type: 2,
					skin:'larry-green',
					offset: ['85px', '430px'],
					area: ['560px', '550px'],
					content: path + "/menu/form.do?id="+data.id,
				});
			} else if (obj.event === 'add') {//增加下一节点
				var index = layer.open({
					title: "菜单添加",
					type: 2,
					skin:'larry-green',
					offset: ['85px', '430px'],
					area: ['560px', '550px'],
					content: path + "/menu/form.do?pid="+data.id,
				});
			}
			
		});


		$('.larry-btn a.layui-btn').on('click',function(){
	          var type = $(this).data('type');
	          active[type] ? active[type].call(this) : '';
		});
	    
	    var active = {
	         getSelect:function(){
	            if($('#search_input').val()){
	                var index = layer.msg('查询中，请稍候...',{icon: 16,time:false,shade:0});
	                table.reload('flinkTables', {
	                	  page: true,
	                	  where: {
	                		  webname:$('#search_input').val()
	                	  }, //设定异步数据接口的额外参数
	                	  done: function (res, curr, count) {
	                          layer.close(index);

	                      }
	                	});
	                
	            }else{
	                layer.tips('建议还是请输入点什么再搜索吧！比如网站名称', $('#search_input'), {
	                   tips: [3, '#5FB878']
	                });
	            }
	         },
			addLink: function() {
				var index = layer.open({
					title: "菜单添加",
					type: 2,
					skin:'larry-green',
					offset: ['85px', '430px'],
					area: ['560px', '550px'],
					content: path + "/menu/form.do?pid=75",
				});
			},
	         delLink:function(){
	        	 layer.confirm('真的删除行么', function(index) {
		        	 //获取选中的行
		        	 var checkStatus = table.checkStatus('flinkTables');
		             var data = checkStatus.data;
		             var ids = [];
		             for (var i in data){
		                   ids.push(data[i].id);
		                   console.log(data[i].id);
		              }
		             
		        	 var ajaxReturnData;
				        $.ajax({
				            url: path + '/friendLink/deleteBatch.do',
				            type: 'post',
				            async: false,
				            data: {ids:ids.toString()},
				            success: function (data) {
				                ajaxReturnData = data;
				            }
				        });
				        //删除结果
				        if (ajaxReturnData == '0') {
				            table.reload('flinkTables');
				            layer.msg('删除成功', {icon: 1});
				        } else {
				        	layer.msg('删除失败', {icon: 5});
				        }
	        	 });
	         }
	    };
	    
	});
</script>
</body>
</html>
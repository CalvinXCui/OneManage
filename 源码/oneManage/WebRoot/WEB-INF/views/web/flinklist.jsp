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
	<link rel="stylesheet" type="text/css" href="${path}/common/frame/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/common/css/gobal.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/system/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${path}/system/css/flink.css" media="all">
</head>
</head>
<body>
<div class="layui-fluid larry-wrapper">
    <blockquote class="layui-elem-quote larry-btn">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" name="search" value="" id="search_input" placeholder="请输入网站名称进行查询" class="layui-input larry-search-input">
		    </div>
		    <a class="layui-btn search_btn" data-type="getSelect">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-bg-pale" data-type="addLink">添加链接</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger" data-type="delLink">批量删除</a>
		</div>
		<!-- <div class="layui-inline">
			<div class="layui-form-mid layui-word-aux">因时间仓促，本页面仅为静态示例页面，无后台服务端交互场景演示</div>
		</div> -->
	</blockquote>
	<!-- 友链数据列表 -->
	<div class="flinkTable">
		<table class="layui-table" id="flinklist" lay-filter="flinkTables"></table>
	</div>

</div>
<script type="text/html" id="flinkbar">
  <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
</script>
<script type="text/html" id="linkTpl">
  {{#  if(d.alink === undefined){ }}
      未知
  {{#  } else { }}
     <a href="{{d.alink}}" class="layui-table-link" target="_blank">{{ d.alink}}</a>
  {{#  } }}
</script>
<!-- 加载js文件 -->
<script type="text/javascript" src="${path}/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path}/system/js/common.js"></script>
<%-- <script type="text/javascript" src="${path}/system/js/flink.js"></script>   --%>
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
					field: 'webname',
					width: 200,
					title: '网站名称',
					align:'center',
				}, {
					field: 'alink',
					width: 250,
					title: '链接地址',
					align:'center',
					templet: '#linkTpl'
				}, {
					field: 'email',
					title: '站长邮箱',
					align:'center',
					width: 300
				}, {
					field: 'timeF',
					title: '添加时间',
					align:'center',
					width: 200
				}, {
					field: 'dispos',
					title: '展示位置',
					align:'center',
			        width: 200
				}, {
					title: '操作',
					width: 200,
					align: 'center',
					toolbar: '#flinkbar',
					fixed: 'right',
				}]
			],
			url: path + '/friendLink/fLinkInfo.do',
			page: true,
			even: true,
		});

		//监听工具条
		table.on('tool(flinkTables)', function(obj) {
			var data = obj.data;
			if (obj.event === 'del') {
				layer.confirm('真的删除行么', function(index) {
					//obj.del();
					var ajaxReturnData;
			        $.ajax({
			            url: path + '/friendLink/delete.do',
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
				//layer.alert('编辑行：<br>' + JSON.stringify(data))
				var index = layer.open({
					title: "友情链接修改",
					type: 2,
					skin:'larry-green',
					offset: ['85px', '130px'],
					area: ['540px', '450px'],
					content: path + "/friendLink/form.do?id="+data.id,
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
	                /* setTimeout(function(){
	                     common.larryCmsSuccess('未查询到指定对象( 哈哈！这里是静态演示页，未使用本地存储和sessionStorage存储数据，露个脸我准备开始闪啦...！ )','查询结果提示！',10);
	                     layer.close(index);
	                },800); */
	                
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
					title: "友情链接添加",
					type: 2,
					skin:'larry-green',
					offset: ['85px', '130px'],
					area: ['540px', '450px'],
					content: path + "/friendLink/form.do",
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
	         	//common.larryCmsError('数据批量删除失败！',common.larryCore.errorTit,10);
	         }
	    };
	    
	});
</script>
</body>
</html>
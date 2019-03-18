layui.use(['layer', 'form', 'table', 'common'], function() {
	var $ = layui.$,
		layer = layui.layer,
		form = layui.form,
		table = layui.table,
		common = layui.common;
	
	var tableIns = table.render({
		elem: '#userTables',
		id: 'userTables',
		width: 700,
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
			},{
				field: 'name',
				width: 150,
				title: '角色名称',
				align: 'center',
			}, {
				field: 'useable',
				width: 150,
				title: '状态',
				align: 'center',
				templet: '#status'
			},{
				title: '常用操作',
				width: 260,
				align: 'center',
				toolbar: '#userbar',
				fixed:"right"
			}]

		],
		url: path + '/role/data.do',
		page: true,
		even: true,

	});

	//监听工具条
	table.on('tool(userTables)', function(obj) {
		var data = obj.data;
		if (obj.event === 'edit') {
			var index = layer.open({
				title: "角色信息修改",
				type: 2,
				skin:'larry-green',
				offset: ['85px', '530px'],
				area: ['540px', '350px'],
				content: path + "/role/form.do?id="+data.id,
			});
			
		}else if (obj.event === 'shouquan') {
			var index = layer.open({
				title: "权限设置",
				type: 2,
				skin:'larry-green',
				offset: ['85px', '530px'],
				area: ['440px', '550px'],
				content: path + "/role/setPermission.do?id=" + data.id,
			});
			
			
		}else if (obj.event === 'disable') {
			layer.confirm('真的禁用角色么', function(index) {
				var ajaxReturnData;
		        $.ajax({
		            url: path + '/role/setUse.do',
		            type: 'post',
		            async: false,
		            data: {id:data.id},
		            success: function (data) {
		                ajaxReturnData = data;
		            }
		        });
		        //删除结果
		        if (ajaxReturnData == '0') {
		            table.reload('userTables');
		            layer.msg('操作成功', {icon: 1});
		        } else {
		        	layer.msg('操作失败', {icon: 5});
		        }
				
				layer.close(index);
				
			});
		}else if (obj.event === 'able') {
			layer.confirm('真的将角色置为可用么', function(index) {
				var ajaxReturnData;
		        $.ajax({
		            url: path + '/role/setUse.do',
		            type: 'post',
		            async: false,
		            data: {id:data.id},
		            success: function (data) {
		                ajaxReturnData = data;
		            }
		        });
		        //删除结果
		        if (ajaxReturnData == '0') {
		            table.reload('userTables');
		            layer.msg('操作成功', {icon: 1});
		        } else {
		        	layer.msg('操作失败', {icon: 5});
		        }
				
				layer.close(index);
				
			});
		}else if (obj.event === 'del') {
			layer.confirm('真的删除角色么', function(index) {
				var ajaxReturnData;
		        $.ajax({
		            url: path + '/role/delete.do',
		            type: 'post',
		            async: false,
		            data: {id:data.id},
		            success: function (data) {
		                ajaxReturnData = data;
		            }
		        });
		        //删除结果
		        if (ajaxReturnData == '0') {
		            table.reload('userTables');
		            layer.msg('删除成功', {icon: 1});
		        } else {
		        	layer.msg('删除失败', {icon: 5});
		        }
				
				layer.close(index);
				
			});
		}
	});

	$('#larry_group .layui-btn').on('click',function(){
          var type = $(this).data('type');
          active[type] ? active[type].call(this) : '';
	});

	var active = {
        add:function(){
        	var index = layer.open({
				title: "角色编辑",
				type: 2,
				skin:'larry-green',
				offset: ['85px', '530px'],
				area: ['540px', '350px'],
				content: path + "/role/form.do",
			});
        },
        edit:function(){
           common.larryCmsMessage('最近好累，还是过段时间在写吧！','error');
        },
        del:function(){
           common.larryCmsMessage('最近好累，还是过段时间在写吧！','error');
        }

	};
});
layui.use(['layer', 'form', 'table', 'common'], function() {
	var $ = layui.$,
		layer = layui.layer,
		form = layui.form,
		table = layui.table,
		common = layui.common;
	
	var tableIns = table.render({
		elem: '#userTables',
		id: 'userTables',
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
				field: 'img',
				width: 150,
				height: 250,
				title: '头像',
				align: 'center',
				templet: '#img'
			},{
				field: 'loginName',
				width: 150,
				title: '用户名',
				align: 'center',
			},{
				field: 'name',
				width: 150,
				title: '真实姓名',
				align: 'center',
			}, {
				field: 'email',
				width: 255,
				title: '邮箱',
				align: 'center',
			}, {
				field: 'mobile',
				width: 150,
				title: '手机号',
				align: 'center',
			}, {
				field: 'status',
				width: 150,
				title: '状态',
				align: 'center',
				templet: '#status'
			},/* {
				field: 'lastip',
				width: 150,
				title: '最后一次登录ip',
				align: 'center',
			}, {
				field: 'lasttime',
				width: 150,
				title: '上一次登录时间',
				align: 'center',
			}, */{
				title: '常用操作',
				width: 260,
				align: 'center',
				toolbar: '#userbar',
				fixed:"right"
			}]

		],
		url: path + '/user/data.do',
		page: true,
		even: true,

	});

	//监听工具条
	table.on('tool(userTables)', function(obj) {
		var data = obj.data;
		if (obj.event === 'edit') {
			var index = layer.open({
				title: "用户信息修改",
				type: 2,
				skin:'larry-green',
				offset: ['85px', '530px'],
				area: ['540px', '450px'],
				content: path + "/user/form.do?id="+data.id,
			});
			
			//layer.alert('编辑行：<br>' + JSON.stringify(data))
		}else if (obj.event === 'shouquan') {
			layer.alert('授权行：<br>' + JSON.stringify(data))
		}else if (obj.event === 'disable') {
			layer.confirm('真的禁用用户么', function(index) {
				var ajaxReturnData;
		        $.ajax({
		            url: path + '/user/setUse.do',
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
			layer.confirm('真的将该用户置为可用么', function(index) {
				var ajaxReturnData;
		        $.ajax({
		            url: path + '/user/setUse.do',
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
			layer.confirm('真的删除行么', function(index) {
				var ajaxReturnData;
		        $.ajax({
		            url: path + '/user/delete.do',
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
				title: "用户编辑",
				type: 2,
				skin:'larry-green',
				offset: ['85px', '530px'],
				area: ['540px', '450px'],
				content: path + "/user/form.do",
			});
           //common.larryCmsMessage('最近好累，还是过段时间在写吧！','error');
        },
        edit:function(){
        	
           common.larryCmsMessage('最近好累，还是过段时间在写吧！','error');
           
        },
        del:function(){
        	
           common.larryCmsMessage('最近好累，还是过段时间在写吧！','error');
        }

	};
});
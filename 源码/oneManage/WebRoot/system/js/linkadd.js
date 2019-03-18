layui.use(['form','layer','jquery'],function(){
   var $ = layui.$,
   form = layui.form,
   layer = layui.layer;
   form.on('submit(add)',function(data){
     //layer.msg('最近页面写的好累啊！说好了只给个静态演示页的，完整的待后面再更新吧！',{icon: 5,time:5000,shade:0.1});
     var ajaxReturnData;
        //登陆验证
        $.ajax({
            url: path + '/friendLink/save.do',
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
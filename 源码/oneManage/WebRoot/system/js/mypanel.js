layui.use(['jquery', 'layer', 'form', 'upload'], function() {
	var $ = layui.$,
		layer = layui.layer,
		upload = layui.upload,
		form = layui.form;
	
	  //普通图片上传
	  var uploadInst = upload.render({
		 elem: '#test1'
	    ,url: path + '/upload/uploadimg.do'
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#imgg').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.code = 0){
	        return layer.msg('上传失败');
	      }else if(res.code = 1){//上传成功
	    	  //$('#imgg').attr('src', res.data.src); //图片链接（base64）
	    	  $("#img").val(res.data.src);
	    	  return layer.msg('上传成功');
	      }else if(res.code = 2){
	    	  return layer.msg('上传的文件不是图片');
	      }
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst.upload();
	      });
	    }
	  });
	  
	  
	  form.on('submit(demo1)',function(data){
	    	var ajaxReturnData;
	        //登陆验证
	        $.ajax({
	            url: path + '/user/saveInfo.do',
	            type: 'post',
	            async: false,
	            data: data.field,
	            success: function (data) {
	                ajaxReturnData = data;
	            }
	        });
	        //登陆成功
	        if (ajaxReturnData == '0') {
	            layer.msg('保存成功', {icon: 1});
	            return false;
	        } else {
	        	layer.msg('保存失败', {icon: 5});
            	return false;
	        }
	        
	    });
	  
	  
	  form.on('submit(demo2)',function(data){
	    	var ajaxReturnData;
	        //登陆验证
	        $.ajax({
	            url: path + '/user/savePwd.do',
	            type: 'post',
	            async: false,
	            data: data.field,
	            success: function (data) {
	                ajaxReturnData = data;
	            }
	        });
	        //修改成功
	        if (ajaxReturnData == '0') {
	            layer.msg('保存成功', {icon: 1});
	            return false;
	        } else {
	        	if(ajaxReturnData == '1'){
	        		layer.msg('新密码和确认密码不一致', {icon: 5});
	        	}else if(ajaxReturnData == '2'){
	        		layer.msg('旧密码不正确', {icon: 5});
	        	}else{
	        		layer.msg('保存失败', {icon: 5});
	        	}
            	return false;
	        }
	        
	    });
	  
});
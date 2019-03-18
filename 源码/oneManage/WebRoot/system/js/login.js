layui.use(['jquery','common','layer','form','larryMenu'],function(){
    var $ = layui.$,
        layer = layui.layer,
        form = layui.form,
        common = layui.common;
    // 页面上下文菜单
    var larryMenu = layui.larryMenu();

    var mar_top = ($(document).height()-$('#larry_login').height())/2.5;
    $('#larry_login').css({'margin-top':mar_top});
   // common.larryCmsSuccess('用户名：larry 密码：larry 无须输入验证码，输入正确后直接登录后台!','larryMS后台帐号登录提示',20);
    var placeholder = '';
    $("#larry_form input[type='text'],#larry_form input[type='password']").on('focus',function(){
          placeholder = $(this).attr('placeholder');
          $(this).attr('placeholder','');
    });
    $("#larry_form input[type='text'],#larry_form input[type='password']").on('blur',function(){
          $(this).attr('placeholder',placeholder);
    });
    
    common.larryCmsLoadJq(path + '/common/plus/jquery.supersized.min.js', function() {
        $.supersized({
            // 功能
            slide_interval: 3000,
            transition: 1,
            transition_speed: 1000,
            performance: 1,
            // 大小和位置
            min_width: 0,
            min_height: 0,
            vertical_center: 1,
            horizontal_center: 1,
            fit_always: 0,
            fit_portrait: 1,
            fit_landscape: 0,
            // 组件
            slide_links: 'blank',
            slides: [{
                image: path + '/system/images/login/1.jpg'
            }, {
                image: path + '/system/images/login/2.jpg'
            }, {
                image: path + '/system/images/login/3.jpg'
            }]
        });
    });

    form.on('submit(submit)',function(data){
    	var ajaxReturnData;
        //登陆验证
        $.ajax({
            url: path + '/login/login.do',
            type: 'post',
            async: false,
            data: data.field,
            success: function (data) {
                ajaxReturnData = data;
            }
        });
        //登陆成功
        if (ajaxReturnData == '0') {
            layer.msg('登录成功', {icon: 1});
            setTimeout("window.location.href='"+ path +"/index/index.do'",1000)//延迟一秒跳转登录成功之后界面
            return false;
        } else {
            if(ajaxReturnData == '1'){
            	layer.msg('密码不正确', {icon: 5});
            	return false;
            }else if(ajaxReturnData == '2'){
            	layer.msg('用户不存在', {icon: 5});
            	return false;
            }
        }
        
        /*if(data.field.user_name == 'larry' && data.field.password == 'larry'){
            layer.msg('登录成功',{icon:1,time:1000});
            setTimeout(function(){
                window.location.href = 'index.html';
            },1000);
           
        }else{
            layer.tips('用户名:larry 密码：larry 无需输入验证码', $('#password'), {
               tips: [3, '#FF5722']
            });
        }
        return false;*/
    });

    // 右键菜单控制
    var larrycmsMenuData = [
        [{
            text: "刷新页面",
            func: function() {
                top.document.location.reload();
            }
        }, {
            text: "检查元素(F12)",
            func: function() {
                common.larryCmsError('抱歉！暂不支持此功能，可加入LarryCMS交流群下载源码',common.larryCore.tit);
            }
        }]
    ];
    larryMenu.ContentMenu(larrycmsMenuData,{
         name: "html" 
    },$('html'));
});
    
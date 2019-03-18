<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台首页</title>
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
	<link rel="stylesheet" type="text/css" href="${path}/system/css/main.css" media="all">
</head>
</head>
<body>
<div class="layui-fluid larry-wrapper">
	<div class="layui-row layui-col-space20" id="infoSwitch">
		    <div class="layui-col-xs12  layui-col-sm12  layui-col-md12  layui-col-lg12">
		    	<blockquote class="layui-elem-quote  head-con">
                <div>尊敬的admin<span id="weather"></span></div>
		    	<i class="larry-icon close" id="closeInfo">&#xea5c;</i>
	        </blockquote>
	    </div>	
	</div>
	<!-- 快捷图标导航 -->
	<div class="layui-row layui-col-space20 larry-shortcut" id="shortcut">
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2 larry-col">
            <section class="panel pos-r larry-ico-rotate">
            	<div class="inline-block layui-bg-green larry-ico"><i class="larry-icon">&#xe641;</i></div>
            	<div class="inline-block right-value">
            		<a data-href="${path }/user/personInfo.do">
                        <h3 class="no-count">个人信息</h3>
            		</a>
            	</div>
            </section>
		</div>
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2 larry-col">
            <section class="panel pos-r larry-ico-rotate">
            	<div class="inline-block layui-bg-red larry-ico"><i class="larry-icon">&#xe70b;</i></div>
            	<div class="inline-block right-value">
            		<a data-href="${path }/user/list.do">
                        <h3 class="no-count">用户管理</h3>
            		</a>
            	</div>
            </section>
		</div>
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2 larry-col">
            <section class="panel pos-r larry-ico-rotate">
            	<div class="inline-block layui-bg-blue larry-ico"><i class="larry-icon">&#xe6d2;</i></div>
            	<div class="inline-block right-value">
            		<a data-href="${path }/role/list.do">
            			<h3 class="no-count">角色管理</h3>
            		</a>
            	</div>
            </section>
		</div>
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2 larry-col">
            <section class="panel pos-r larry-ico-rotate">
            	<div class="inline-block layui-bg-pale larry-ico"><i class="larry-icon">&#xe6e2;</i></div>
            	<div class="inline-block right-value">
            		<a data-href="${path }/menu/list.do">
                        <h3 class="no-count">菜单管理</h3>
            		</a>
            	</div>
            </section>
		</div>
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2 larry-col">
            <section class="panel pos-r larry-ico-rotate">
            	<div class="inline-block layui-bg-orange larry-ico"><i class="larry-icon">&#xe8a0;</i></div>
            	<div class="inline-block right-value">
            		<a data-href="${path }/friendLink/list.do">
            			<h3 class="no-count">友链管理</h3>
            		</a>
            	</div>
            </section>
		</div>
		<div class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2 larry-col">
            <section class="panel pos-r larry-ico-rotate">
                <div class="inline-block layui-bg-red larry-ico"><i class="larry-icon">&#xe82b;</i></div>
                <div class="inline-block right-value">
                    <a data-href="${path }/systemDoc/four.do">
                        <h3 class="no-count">404页面</h3>
                    </a>
                </div>
            </section>
        </div>
	</div>
	

	<div class="layui-row layui-col-space20">
	        <!-- 提示 -->
        <!-- <div class="layui-col-xs12 layui-col-sm12 layui-col-md12 layui-col-lg12">
        	<blockquote class="layui-elem-quote tips-con">
                <p>
                    LarryMS后台系统界面模版完全基于Layui编写，未使用layui以外其他任何第三方UI框架；layui是个人接触到的ui框架里最好用的没有之一，只有最；作为layui的忠实用户，在使用layui的过程中获的一些心得，体验了一把layui的栅格响应式布局，遂写成此套后台管理系统模版拿与大家交流；<span class="tip">限于本人精力和经验有限，此模版中所展现出的仅是layui的冰山一角，同时感谢大家的关注和支持，希望喜欢此套模版的朋友帮忙多给予建议，互相学习交流！</span>
                </p>
                
                <p class="larry-p">
                    Layui后台开发交流QQ群：<a href="https://jq.qq.com/?_wv=1027&amp;k=42fC4vT" target="_blank"><img border="0" src="images/group.png" title="LarryCMS官方交流群"></a>
                    <a href="http://fly.layui.com/case/2017/" target="_blank" class="layui-btn layui-btn-mini layui-btn-danger">去点个赞！</a><span class="beizhu"><em class="layui-btn layui-btn-mini">LarryMS文档</em>【 此系统模版源码可以通过加群获得，仅限于学习交流使用，提供给群内伙伴无限制使用，但不可对larryMS直接打包转售传播，如果需要用作商业用途，请联系作者授权，谢谢！】</span>
                </p>
                <p class="larry-p">
                    Layui开发文档：<a href="http://www.layui.com/doc/" target="_blank" class="layui-btn layui-btn-mini">乘此飞船前往</a><a href="http://layim.layui.com/" target="_blank" class="layui-btn layui-btn-mini">获取LayIM3.x授权</a><a href="http://wwww.layui.com/" target="_blank" class="layui-btn layui-btn-mini">官网下载Layui2.x</a>【惊艳的layui2.x犹如神来之笔，而这背后从编码、到文档、示例、到版本的release ...从始至终全凭贤心一人完成，惊为天人！Layui的完美无以复加！】
                </p>
	    		
	        </blockquote>
        </div> -->
            <!-- 系统概览及升级日志 -->
		<div class="layui-col-xs12 layui-col-sm12 layui-col-md6 layui-col-lg6">
			<section class="larry-panel">
				<div class="larry-panel-header">
                    <div class="larry-panel-title inline-block">OneManage更新日志</div>
                    <div class="tools inline-block fr down"><i class="larry-icon">&#xe93a;</i></div>
                </div>
                <div class="larry-panel-body">
                    <ul class="layui-timeline">
                    
                        <li class="layui-timeline-item">
                          <i class="layui-icon layui-timeline-axis">&#xe756;</i>
                          <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title"><h3 class="layui-timeline-title">2016-12-31 OneManage首个版本面世。</h3></div>
                          	<ul>
                                    <li>
                                        首个由One源码官方出品的一款基于SpringMVC +Spring +Mybatis + LarryCMS + Layui的通用后台管理系统。
                                    </li>
                                    <li>
                                        系统具备了用户管理，角色管理，菜单管理等基本功能，可以在此基础上进行二次开发。
                                    </li>
                                    <li>
				首个版本在2017年的最后一天上线，也将在2018年不断的更新版本，希望大家喜欢。
                                    </li>
                                </ul>
                          </div>
                        </li>
                        <li class="layui-timeline-item">
                          <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                          <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">更久以前，在学习并在项目中使用了LarryCMS和Layui</div>
                          </div>
                        </li>
                    </ul>
                </div>
			</section>
		</div>
		
		<div class="layui-col-xs12 layui-col-sm12 layui-col-md6 layui-col-lg6">
			<section class="larry-panel">
                <div class="larry-panel-header">
                    <div class="larry-panel-title inline-block">系统概览</div>
                    <div class="tools inline-block fr down"><i class="larry-icon">&#xe93a;</i></div>
                </div>
                <div class="larry-panel-body">
                    <div class="larry-table">
                        <table class="layui-table larry-table-info">
                            <colgroup>                
                                <col width="150">                
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td><span class="tit">系统名称:</span></td>
                                    <td><span class="info">OneManage</span></td>
                                </tr>
                                <tr>
                                    <td><span class="tit">版本信息:</span></td>
                                    <td><span class="info iframe"> OneManage v1.0.0</span></td>
                                </tr>
                                <tr>
                                    <td><span class="tit">开发作者:</span></td>
                                    <td>One源码</td>
                                </tr>
                                <tr>
                                    <td><span class="tit">官网地址:</span></td>
                                    <td><span class="info"><a href="http://www.y-one.cn" class="official" target="_blank">http://www.y-one.cn</a></span></td>
                                </tr>
                                
                                <tr>
                                    <td><span class="tit">服务器环境:</span></td>
                                    <td>Linux + Tomcat 7.0 + MySQL5.7 </td>
                                </tr>
                                <tr>
                                    <td><span class="tit">系统源码下载:</span></td>
                                    <td>
                                    	<a href="http://www.y-one.cn/code/ac4fcacc04224a71b8b49a5e683e88fb.html" class="official" target="_blank">OneManage管理系统</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
		</div>
        <!-- 数据统计 -->
        <div class="layui-col-xs12 layui-col-sm12 layui-col-md6 layui-col-lg6">
            <section class="larry-panel">
                <div class="larry-panel-header">
                    <div class="larry-panel-title inline-block">数据统计</div>
                    <div class="tools inline-block fr down"><i class="larry-icon">&#xe93a;</i></div>
                </div>
                <div class="larry-panel-body">
                    <div class="larry-seo-stats" id="larry_counts"></div>
                </div>
            </section>
        </div>
        <!-- 系统公告 -->
        <div class="layui-col-xs12 layui-col-sm12 layui-col-md6 layui-col-lg6">
            <section class="larry-panel">
                <div class="larry-panel-header">
                    <div class="larry-panel-title inline-block">系统公告</div>
                    <div class="tools inline-block fr down"><i class="larry-icon">&#xe93a;</i></div>
                </div>
                <div class="larry-panel-body layrr-document">
                    <fieldset class="layui-elem-field content">
                        <legend>后续版本更新计划</legend>
                        <div class="layui-field-box">
                            <p>
                                整体的SSM后台管理框架功能已经初具雏形，前端界面风格采用了结构简单、性能优良、页面美观大气的LarryCMS页面展示框架后续将不断的更新版本，加一些常用的功能，比如安全权限框架shiro,代码生成器等功能。
                                感谢大家的关注和支持！<br>点这里访问：<a href="http://www.y-one.cn" target="_blank">ONE源码官网</a><br>
                                <hr class="layui-bg-orange">
                                <span style="color:#FF5722; ">关于框架，大家可以加群讨论：<a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=9570e8b276e68968e472abb6895219215ad35eefc1d769ad207b51f19dbbfa88"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="ONE源码官方群" title="ONE源码官方群"></a>
                            </p>
                        </div>
                    </fieldset>
                </div>
            </section>
        </div>

        
	</div>

</div>
<!-- 加载js文件 -->
<script type="text/javascript" src="${path}/common/frame/layui/layui.js"></script> 
<script type="text/javascript" src="${path}/system/js/common.js"></script> 
<script type="text/javascript" src="${path}/system/js/main.js"></script> 
<!--[if lt IE 9]>
  <script src="/common/js/html5.min.js"></script>
  <script src="/common/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
	var path = "${path}";
	
	layui.config({
		base: path + '/common/lib/'
	});
	
</script>
</body>
</html>
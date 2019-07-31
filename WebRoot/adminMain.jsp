<%@ page language="java" contentType="text/html; charset=utf-8" import="com.model.Admin"
    pageEncoding="utf-8"%>
    
<%
	// 权限验证
	Admin admin = (Admin)session.getAttribute("admin");
	if(admin==null){
		System.out.println("没有得到adminId");
		response.sendRedirect("index.jsp");
		return;
	}
	String adminName = admin.getAdminName();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>多媒体素材库</title>
<link rel="stylesheet" href="frame/layui/css/layui.css"/>
<link rel="stylesheet" href="./frame/static/css/style.css"/>
<script type="text/javascript" src="frame/layui/layui.js"></script>
<script type="text/javascript" src="./frame/static/js/vip_comm.js"></script>
</head>
<body>

<!-- layout admin -->
<div class="layui-layout layui-layout-admin"> <!-- 添加skin-1类可手动修改主题为纯白，添加skin-2类可手动修改主题为蓝白 -->
    <!-- header -->
    <div class="layui-header my-header">
            <!--<img class="my-header-logo" src="" alt="logo">-->
            <div class="my-header-logo">多媒体素材库</div>
            <i></i>
        <div class="my-header-btn">
            <button class="layui-btn layui-btn-small btn-nav">=</button>
        </div>

        <!-- 顶部右侧添加选项卡监听 -->
        <ul class="layui-nav my-header-user-nav" lay-filter="side-top-right">
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><i class="layui-icon"></i>主题</a>
                <dl class="layui-nav-child">
                    <dd data-skin="0"><a href="javascript:;">默认</a></dd>
                    <dd data-skin="1"><a href="javascript:;">纯白</a></dd>
                    <dd data-skin="2"><a href="javascript:;">蓝白</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><img src="./frame/static/image/111111.jpg" alt="logo"><%=adminName %></a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" href-url="index3.jsp"><i class="layui-icon"></i>登录页</a></dd>
                    <dd><a href="javascript:;" href-url="adminmima.jsp"><i class="layui-icon"></i>修改密码</a></dd>
                    <dd><a target="_blank"  href="index.jsp"><i class="layui-icon"></i>返回网站</a></dd>
                    <dd><a href="tuichu.jsp"><i class="layui-icon"></i>退出</a></dd>
                </dl>
            </li>
        </ul>

    </div>
    <!-- side -->
    <div class="layui-side my-side">
        <div class="layui-side-scroll">
            <!-- 左侧主菜单添加选项卡监听 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="side-main">
               <li class="layui-nav-item  layui-nav-itemed">
                    <a href="javascript:;"><i class="layui-icon"></i>公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="admin/ggtype.jsp"><i class="layui-icon"></i>公告类型</a></dd>
                        <dd><a href="javascript:;" href-url="admin/gonggao.jsp"><i class="layui-icon"></i>公告管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon"></i>个人信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="adminmima.jsp"><i class="layui-icon"></i>修改密码</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon"></i>用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="admin/yonghu0.jsp"><i class="layui-icon"></i>审核用户</a></dd>
                        <dd><a href="javascript:;" href-url="admin/yonghu.jsp"><i class="layui-icon"></i>用户管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon"></i>素材信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="admin/sptype.jsp"><i class="layui-icon"></i>类型信息</a></dd>
                        <dd><a href="javascript:;" href-url="admin/shangpin0.jsp"><i class="layui-icon"></i>图片素材</a></dd>
                        <dd><a href="javascript:;" href-url="admin/shangpin1.jsp"><i class="layui-icon"></i>视频素材</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon"></i>用户收藏</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="admin/spchu.jsp"><i class="layui-icon"></i>素材收藏</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon"></i>系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="admin/rizhi.jsp"><i class="layui-icon"></i>登录日志</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>
    <!-- body -->
    <div class="layui-body my-body">
        <div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1"><span><i class="layui-icon"></i>欢迎页</span></li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe id="iframe" src="index3.jsp" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div class="layui-footer my-footer">
        
    </div>
</div>
<!-- 右键菜单 -->
<div class="my-dblclick-box none">
    <table class="layui-tab dblclick-tab">
        <tr class="card-refresh">
            <td><i class="layui-icon">&#x1002;</i>刷新当前标签</td>
        </tr>
        <tr class="card-close">
            <td><i class="layui-icon">&#x1006;</i>关闭当前标签</td>
        </tr>
        <tr class="card-close-all">
            <td><i class="layui-icon">&#x1006;</i>关闭所有标签</td>
        </tr>
    </table>
</div>
</body>
</html>
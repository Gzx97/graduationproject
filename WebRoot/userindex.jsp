<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="frame/layui/css/layui.css">
<link rel="stylesheet" href="frame/static/css/style.css">
<title>多媒体素材库</title>
</head>
<body class="login-body body">

<div class="login-box bgimg">
    <form class="layui-form layui-form-pane" method="post" action="loginUser">
        <div class="layui-form-item">
            <h3>多媒体素材库</h3>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号：</label>

            <div class="layui-input-inline">
                <input type="text" name="userName" class="layui-input" lay-verify="account" placeholder="账号"
                       autocomplete="on" maxlength="20"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码：</label>

            <div class="layui-input-inline">
                <input type="password" name="password" class="layui-input" lay-verify="password" placeholder="密码"
                       maxlength="20"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户组：</label>

            <div class="layui-input-inline">
                <select name="loginType">
					<option value="admin">管理员</option>
					<option value="yonghu">用户</option>
				</select>
            </div>
        </div>
        <div class="layui-form-item">
            <a href="zhuceyonghu.jsp"><button type="button" class="layui-btn layui-btn-danger btn-reset">注册</button></a>
            <button type="submit" class="layui-btn btn-submit" lay-submit="" lay-filter="sub">立即登录</button>
        </div>
        <div style="padding:10px;"><font color="red">${error }</font></div>
    </form>
</div>

<script type="text/javascript" src="frame/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {

        // 操作对象
        var form = layui.form
                , layer = layui.layer
                , $ = layui.jquery;

        // 验证
        form.verify({
            account: function (value) {
                if (value == "") {
                    return "请输入用户名";
                }
            },
            password: function (value) {
                if (value == "") {
                    return "请输入密码";
                }
            }
        });
    })

</script>
</body>
</html>
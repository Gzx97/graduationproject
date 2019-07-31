<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<title>多媒体素材库</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/colorpicker.css" />
<link rel="stylesheet" href="css/datepicker.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style2.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<style>
.control-group .controls label {
	display: inline-block;
}
</style>
</head>
<body>

	<div id="content">
		<div id="content-header">
			<h1>足球机器人素材库</h1>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span6">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>用户注册</h5>
						</div>
						<div class="widget-content nopadding">
							<form name="form1" action="zhuceYonghu" method="post"
								class="form-horizontal" onSubmit="return check()">
								<div class="control-group">
									<label class="control-label">登录名:</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="登录名"
											name="yonghuName" id="yonghuName" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">密码:</label>
									<div class="controls">
										<input type="password" class="span11" placeholder="密码"
											name="yonghuPassword" id="yonghuPassword" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">密码:</label>
									<div class="controls">
										<input type="password" class="span11" placeholder="重复密码"
											name="yonghuPassword1" id="yonghuPassword1" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">名称:</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="名称"
											name="yonghuXingming" id="yonghuXingming" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">年龄:</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="年龄"
											name="yonghuAge" id="yonghuAge" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">性别:</label>
									<div class="controls">
										<select id="yonghuSex" name="yonghuSex" class="span11">
											<option value="0">男</option>
											<option value="1">女</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">电话:</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="电话"
											name="yonghuPhone" id="yonghuPhone" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">邮箱:</label>
									<div class="controls">
										<input type="text" class="span11" placeholder="邮箱"
											name="yonghuMark1" id="yonghuMark1" />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-success">注册</button>
								</div>
								<li><font color="red">${error }</font></li>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function check() {
			var yonghuName = document.form1.yonghuName.value;
			var yonghuPassword = document.form1.yonghuPassword.value;
			var yonghuPassword1 = document.form1.yonghuPassword1.value;
			var yonghuXingming = document.form1.yonghuXingming.value;
			var yonghuAge = document.form1.yonghuAge.value;
			var yonghuPhone = document.form1.yonghuPhone.value;
			var yonghuMark1 = document.form1.yonghuMark1.value;
			var reg = /^[a-zA-Z0-9_]{6,}$/;
			if (!reg.test(yonghuName)) {
				document.form1.yonghuName.focus();
				alert("用户名不符合规则，6位以上");
				return false;
			}
			if (!reg.test(yonghuPassword)) {
				document.form1.yonghuPassword.focus();
				alert("密码不符合规则，6位以上");
				return false;
			}

			if (document.form1.yonghuPassword1.value == "") {
				alert("请输入确认密码");
				document.form1.yonghuPassword1.focus();
				return false;
			}
			if (document.form1.yonghuPassword.value != document.form1.yonghuPassword1.value) {
				alert("两次输入密码不一致");
				document.form1.yonghuPassword1.focus();
				return false;
			}
			if (document.form1.yonghuXingming.value == "") {
				alert("姓名为必填");
				document.form1.yonghuXingming.focus();
				return false;
			}
			
			//定义正则表达式部分    
			var reg1 = /^[0-9]{0,}$/;
			var reg2 = /^[1-9]{1}[0-9]{0,}$/;
			//alert(numberValue);
			if(yonghuAge ==null || yonghuAge.length==0 || yonghuAge.length>2){
				alert('请输入有效的年龄！');
				document.form1.yonghuAge.focus();
				return false;
			}
			if((!reg1.test(yonghuAge))||(!reg2.test(yonghuAge))){
				alert('请输入有效的年龄！');
				document.form1.yonghuAge.focus();
				return false;
			}
			
			//定义正则表达式部分    手机号码和邮箱
			var regphone = /^[1][3,4,5,7,8][0-9]{9}$/;
			var regemail = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
			if (!regphone.test(yonghuPhone)) {
				alert('请输入有效的手机号码！');
				document.form1.yonghuPhone.focus();
				return false;
			}
			if (!regemail.test(yonghuMark1)) {
				alert('请输入有效的邮箱地址 ！');
				document.form1.yonghuMark1.focus();
				return false;
			}
		}
	</script>
</body>
</html>
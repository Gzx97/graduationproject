<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
	function searchYonghu(){
		$('#dg').datagrid('load',{
			yonghuXingming:$('#s_yonghuXingming').val(),
			yonghuName:$('#s_yonghuName').val(),
			yonghuSex:$('#s_yonghuSex').combobox("getValue")
		});
	}
	
	function saveYonghu(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
			
				var s=result;
				var result = eval('(' + result + ')');
			
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	function openYonghuAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		url="../addYonghu";
	}
	
	function resetValue(){
	}
	
	function deleteYonghu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].yonghuId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("../deleteYonghu",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].yonghuName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function closeYonghuDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function openYonghuModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		$("#fm").form("load",row);
		url="../addYonghu?yonghuId="+row.yonghuId;
	}
	
	function formatSex(shujuSex, row) {  
		if(shujuSex==0){
			return "男";
		}
		if(shujuSex==1){
			return "女";
		}
	}
	
	function formatType1(shujuType1, row) {  
		if(shujuType1==0){
			return "零";
		}
		if(shujuType1==1){
			return "一";
		}
	}
	
	function formatType2(shujuType2, row) {  
		if(shujuType2==0){
			return "0";
		}
		if(shujuType2==1){
			return "1";
		}
	}
	
	function formatChakan(shujuImg, row) {
		if(shujuImg){
			return '<a target="_blank" style="color:red;" href="../' + shujuImg + '">查看' + '</a>'; 
		}else {
			return "未上传";
		}
	}
	
	function formatXiazai(shujuImgName, row) {
		if(shujuImgName){
			return '<a target="_blank" style="color:red;" href="../downFile?filename=' + shujuImgName + '">下载' + '</a>'; 
		}else {
			return "未上传";
		}
	}
	
	function daochuYonghu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要导出的数据！");
			return;
		}
		var yonghuIds=[];
		for(var i=0;i<selectedRows.length;i++){
			yonghuIds.push(selectedRows[i].yonghuId);
		}
		var ids=yonghuIds.join(",");
		$.messager.confirm("系统提示","您确认要导出数据吗？",function(r){
			if(r){
				$.post("../daochuYonghu",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功导出数据：D:！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].yonghuName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function datetostr(dateTime, row) {
		if(dateTime){
			var JsonDateValue = new Date(dateTime.time);
			var text = JsonDateValue.toLocaleString();
			return text;
		}else{
			return "未填写";
		}
	}
	
	function doPrint() {      
        bdhtml=window.document.body.innerHTML;      
        sprnstr="<!--startprint-->";      
        eprnstr="<!--endprint-->";      
        prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);      
        prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));      
        window.document.body.innerHTML=prnhtml;   
        window.print();      
	}
	
	function daoruYonghus(){
		$("#daoru").dialog("open").dialog("setTitle","导入用户信息");
		daoruurl="../daoruYonghu";
	}
	
	function closeDaoruYonghu(){
		$("#daoru").dialog("close");
		resetValue();
	}
	
	function saveDaoruYonghu(){
		$("#drfm").form("submit",{
			url:daoruurl,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
			
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#daoru").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	function shangchuanYonghu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#shangchuan").dialog("open").dialog("setTitle","上传用户信息");
		$("#shchfm").form("load",row);
		shchurl="../shangchuanYonghu?yonghuId="+row.yonghuId;
	}
	
	function closeShangchuanYonghu(){
		$("#shangchuan").dialog("close");
		resetValue();
	}
	
	function saveShangchuanYonghu(){
		$("#shchfm").form("submit",{
			url:shchurl,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
			
				var s=result;
				var result = eval('(' + result + ')');
			
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#shangchuan").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
</script>
</head>
<body style="margin: 5px;">
<!--startprint-->
	<table id="dg" title="用户信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" url="../getYonghus?yonghuType1=1" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="yonghuId" width="20">编号</th>
				<th field="yonghuName" width="40">登录名</th>
				<th field="yonghuPassword" width="50" hidden="true">密码</th>
				<th field="yonghuXingming" width="40">姓名</th>
				<th field="yonghuSex" width="20" formatter="formatSex">性别</th>
				<th field="yonghuAge" width="20">年龄</th>
				<th field="yonghuPhone" width="40">电话</th>
				<th field="yonghuMark1" width="40">邮箱</th>
				<th field="yonghuDate1" width="80" formatter="datetostr">时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
		&nbsp;用户名：&nbsp;<input type="text" name="s_yonghuName" id="s_yonghuName" size="10"/>
		&nbsp;姓名：&nbsp;<input type="text" name="s_yonghuXingming" id="s_yonghuXingming" size="10"/>
		&nbsp;性别：&nbsp;<select class="easyui-combobox" id="s_yonghuSex" name="s_yonghuSex" editable="false" panelHeight="auto">
		    <option value="">请选择...</option>
			<option value="0">男</option>
			<option value="1">女</option>
		</select>
		<a href="javascript:searchYonghu()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
<!--endprint-->
	<div id="dlg" class="easyui-dialog" style="width: 540px;height: 360px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>登录名：</td>
					<td><input type="text" name="yonghuName" id="yonghuName" class="easyui-validatebox" required="true"/></td>
					<td>密码：</td>
					<td><input type="password" name="yonghuPassword" id="yonghuPassword" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="yonghuXingming" id="yonghuXingming" class="easyui-validatebox" required="true"/></td>
					<td>年龄：</td>
					<td><input type="text" name="yonghuAge" id="yonghuAge" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><select class="easyui-combobox" id="yonghuSex" name="yonghuSex" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="0">男</option>
						<option value="1">女</option>
					</select></td>
					<td>电话：</td>
					<td><input type="text" name="yonghuPhone" id="yonghuPhone" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>备注1：</td>
					<td><input type="text" name="yonghuMark1" id="yonghuMark1" class="easyui-validatebox" required="true"/></td>
					<td>备注2：</td>
					<td><input type="text" name="yonghuMark2" id="yonghuMark2" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>备注3：</td>
					<td><input type="text" name="yonghuMark3" id="yonghuMark3" class="easyui-validatebox" required="true"/></td>
					<td>备注4：</td>
					<td><input type="text" name="yonghuMark4" id="yonghuMark4" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>时间1：</td>
					<td><input class="easyui-datetimebox" name="yonghuDate1" id="yonghuDate1" required="true" editable="false" /></td>
					<td>时间2：</td>
					<td><input class="easyui-datetimebox" name="yonghuDate2" id="yonghuDate2" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>类型1：</td>
					<td><select class="easyui-combobox" id="yonghuType1" name="yonghuType1" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="0">零</option>
						<option value="1">一</option>
					</select></td>
					<td>类型2：</td>
					<td><select class="easyui-combobox" id="yonghuType2" name="yonghuType2" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="0">0</option>
						<option value="1">1</option>
					</select></td>
				</tr>
				<tr>
					<td>权限：</td>
					<td><input class="easyui-combobox" id="yhroleId" name="yhroleId"  data-options="panelHeight:'auto',editable:false,valueField:'yhroleId',textField:'yhroleName',url:'../yhroleComboList'"/></td>
					<td>部门：</td>
					<td><input class="easyui-combobox" id="yhbumenId" name="yhbumenId"  data-options="panelHeight:'auto',editable:false,valueField:'yhbumenId',textField:'yhbumenName',url:'../yhbumenComboList'"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveYonghu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeYonghuDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
<!--上传-->	
	<div id="shangchuan" class="easyui-dialog" style="width: 320px;height: 140px;padding: 10px 20px"
		closed="true" buttons="#shangchuan-buttons">
		<form id="shchfm" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td><input type="file" name="uploadFile" id="uploadFile" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="shangchuan-buttons">
		<a href="javascript:saveShangchuanYonghu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeShangchuanYonghu()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
<!--导入-->	
	<div id="daoru" class="easyui-dialog" style="width: 320px;height: 140px;padding: 10px 20px"
		closed="true" buttons="#daoru-buttons">
		<form id="drfm" method="post" enctype="multipart/form-data">
			<table cellspacing="5px;">
				<tr>
					<td><input type="file" name="uploadFile" id="uploadFile" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="daoru-buttons">
		<a href="javascript:saveDaoruYonghu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDaoruYonghu()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"  import="com.model.Yonghu"  pageEncoding="utf-8"%>
   
<%
	// 权限验证
	Yonghu yonghu = (Yonghu)session.getAttribute("yonghu");
	if(yonghu==null){
		System.out.println("没有得到zhaopinId");
		response.sendRedirect("index.jsp");
		return;
	}
	String yonghuXingming = yonghu.getYonghuXingming();
	int yonghuId = yonghu.getYonghuId();
	String yonghuPassword = yonghu.getYonghuPassword();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>素材收藏管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
var yonghuId = <%=yonghuId%>;
	function searchSpchu(){
		$('#dg').datagrid('load',{
			shangpinId:$('#s_shangpinId').combobox("getValue"),
			sdate:$('#s_sdate').datebox("getValue"),
			edate:$('#s_edate').datebox("getValue")
		});
	}
	
	function saveSpchu(){
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
	
	function openSpchuAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加素材收藏");
		url="../addSpchu";
	}
	
	function resetValue(){
	}
	
	function deleteSpchu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].spchuId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("../deleteSpchu",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].spchuName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function closeSpchuDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function openSpchuModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑素材收藏");
		$("#fm").form("load",row);
		url="../addSpchu?spchuId="+row.spchuId;
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
	
	function formatType(shujuType, row) {  
		if(shujuType==0){
			return "提交";
		}
		if(shujuType==1){
			return "通过";
		}
		if(shujuType==2){
			return "拒绝";
		}
		if(shujuType==3){
			return "退货";
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
	
	function daochuSpchu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要导出的数据！");
			return;
		}
		var spchuIds=[];
		for(var i=0;i<selectedRows.length;i++){
			spchuIds.push(selectedRows[i].spchuId);
		}
		var ids=spchuIds.join(",");
		$.messager.confirm("系统提示","您确认要导出数据吗？",function(r){
			if(r){
				$.post("../daochuSpchu",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功导出数据：D:！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].spchuName+'</font>'+result.errorMsg);
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
	
	function daoruSpchus(){
		$("#daoru").dialog("open").dialog("setTitle","导入素材收藏");
		daoruurl="../daoruSpchu";
	}
	
	function closeDaoruSpchu(){
		$("#daoru").dialog("close");
		resetValue();
	}
	
	function saveDaoruSpchu(){
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
	
	function shangchuanSpchu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#shangchuan").dialog("open").dialog("setTitle","上传素材收藏");
		$("#shchfm").form("load",row);
		shchurl="../shangchuanSpchu?spchuId="+row.spchuId;
	}
	
	function closeShangchuanSpchu(){
		$("#shangchuan").dialog("close");
		resetValue();
	}
	
	function saveShangchuanSpchu(){
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
	
	function shenheSpchu(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		url="../addSpchu?spchuId="+row.spchuId;
		$.messager.confirm("系统提示","您确认要购买吗？",function(r){
			if(r){
				$.post(url,{spchuType:1},function(result){
					if(result.errorMsg){
						$.messager.alert("系统提示",result.errorMsg);
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","您已成功购买！");
						$("#dg").datagrid("reload");
					}
				},"json");
			}
		});
	}
</script>
</head>
<body style="margin: 5px;">
<!--startprint-->
	<table id="dg" title="素材收藏" class="easyui-datagrid" fitColumns="true"
	 pagination="true" url="../getSpchus?yonghuId=<%=yonghuId %>" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="spchuId" width="20">编号</th>
				<th field="shangpinId" width="20" hidden="true">素材ID</th>
				<th field="shangpinName" width="40">素材</th>
				<th field="sptypeId" width="20" hidden="true">类型ID</th>
				<th field="sptypeName" width="40">类型</th>
				<th field="yonghuId" width="20" hidden="true">用户ID</th>
				<th field="yonghuName" width="40">用户</th>
				<th field="spchuDate" width="80" formatter="datetostr">时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" hidden="true">
		<div>
			<a href="javascript:deleteSpchu()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">删除</a>
		</div>
		<div>
		&nbsp;时间：&nbsp;<input class="easyui-datebox" name="s_sdate" id="s_sdate" editable="false" size="10"/>->
		<input class="easyui-datebox" name="s_edate" id="s_edate" editable="false" size="10"/>
		&nbsp;素材：&nbsp;<input class="easyui-combobox" id="s_shangpinId" name="s_shangpinId"  data-options="panelHeight:'auto',editable:false,valueField:'shangpinId',textField:'shangpinName',url:'../shangpinComboList'"/>
		<a href="javascript:searchSpchu()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
<!--endprint-->
	<div id="dlg" class="easyui-dialog" style="width: 540px;height: 360px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>名称：</td>
					<td><input type="text" name="spchuName" id="spchuName" class="easyui-validatebox" required="true"/></td>
					<td>备注：</td>
					<td><input type="text" name="spchuMark" id="spchuMark" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>备注1：</td>
					<td><input type="text" name="spchuMark1" id="spchuMark1" class="easyui-validatebox" required="true"/></td>
					<td>备注2：</td>
					<td><input type="text" name="spchuMark2" id="spchuMark2" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>备注3：</td>
					<td><input type="text" name="spchuMark3" id="spchuMark3" class="easyui-validatebox" required="true"/></td>
					<td>商品：</td>
					<td><input class="easyui-combobox" id="shangpinId" name="shangpinId"  data-options="panelHeight:'auto',editable:false,valueField:'shangpinId',textField:'shangpinName',url:'../shangpinComboList'"/></td>
				</tr>
				<tr>
					<td>总数：</td>
					<td><input type="text" name="spchuZong" id="spchuZong" class="easyui-validatebox" required="true"/></td>
					<td>单价：</td>
					<td><input type="text" name="spchuJine" id="spchuJine" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>时间1：</td>
					<td><input class="easyui-datetimebox" name="spchuDate" id="spchuDate" required="true" editable="false" /></td>
					<td>时间2：</td>
					<td><input class="easyui-datetimebox" name="spchuDate1" id="spchuDate1" required="true" editable="false" /></td>
				</tr>
				<tr>
					<td>类型1：</td>
					<td><select class="easyui-combobox" id="spchuType1" name="spchuType1" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="0">零</option>
						<option value="1">一</option>
					</select></td>
					<td>类型2：</td>
					<td><select class="easyui-combobox" id="spchuType2" name="spchuType2" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="0">0</option>
						<option value="1">1</option>
					</select></td>
				</tr>
				<tr>
					<td>users：</td>
					<td><input class="easyui-combobox" id="userId" name="userId"  data-options="panelHeight:'auto',editable:false,valueField:'userId',textField:'userName',url:'../userComboList'"/></td>
					<td>yonghus：</td>
					<td><input class="easyui-combobox" id="yonghuId" name="yonghuId"  data-options="panelHeight:'auto',editable:false,valueField:'yonghuId',textField:'yonghuName',url:'../yonghuComboList'"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveSpchu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeSpchuDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
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
		<a href="javascript:saveShangchuanSpchu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeShangchuanSpchu()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
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
		<a href="javascript:saveDaoruSpchu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeDaoruSpchu()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
</body>
</html>
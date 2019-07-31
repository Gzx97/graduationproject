<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<script type="text/javascript">
	function addSpchu(shangpinId) {
		if (yonghuId==0) {
			alert("请登录后收藏下载");
			return false;
		}
		$.messager.confirm("系统提示", "您确认要收藏下载吗？", function(r) {
			if (r) {
				$.post("addSpchu?yonghuId=" + yonghuId + "&spchuZong=1", {shangpinId : shangpinId}, function(result) {
					if (result.success) {
						$.messager.alert('系统提示',
								'您已成功收藏，请在会员中心<a target="_blank" style="color:red;" href="yonghuMain.jsp">下载' + '</a>');
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', '<font color=red>'
								+ selectedRows[result.errorIndex].spchuName
								+ '</font>' + result.errorMsg);
					}
				}, "json");
			}
		});
	}
</script>
<table width="1000" border="0" align="center" cellpadding="0"
	cellspacing="0" style="margin:10px auto;">
	<tr>
		<td width="240" valign="top" bgcolor="#FFFFFF"
			style="border:1px solid #e0e0e0;"><%@ include file="left.jsp"%>
		</td>
		<td width="10" valign="top">&nbsp;</td>
		<td valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="31" class="sort"><a href="index.jsp">首页</a>
						&gt;&gt; 素材详情</td>
				</tr>
				<tr>
					<%
						if (shangpinGetId != null) {
					%>
					<td height="" valign="top" bgcolor="#FFFFFF"
						style="border:1px solid #e0e0e0; padding:10px; line-height:25px;">
						<table width="100%" align="center" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td valign="top" width="355">
									<table width="100%" border="0" cellspacing="0" cellpadding="2">
										<tr>
											<td><table cellspacing=0 cellpadding=0 width=355
													height=180 border=0>
													<tbody>
														<tr>
															<td align=center>
																<%
																	if (shangpinGetId.getShangpinType() == 0) {
																%> <img
																src="../cgduomeiti/<%=shangpinGetId.getShangpinImg()%>"
																height="200" width="200" /> <%
 	}
 		if (shangpinGetId.getShangpinType() == 1) {
 %><img src="../cgduomeiti/<%=shangpinGetId.getShangpinImg()%>"
																	height="200" width="200" /><%
 	}
 %>
															</td>
														</tr>
													</tbody>
												</table></td>
										</tr>
									</table></td>
								<td valign="top"><table width="100%" border="0"
										cellspacing="0" cellpadding="0">
										<form name="form1" method="post">
											<tr>
												<td height="30" align="left">素材名称：<font color="#cb1c1d"
													size="3"><strong><%=shangpinGetId.getShangpinName()%></strong>
												</font></td>
											</tr>
											<tr>
												<td align="left">&nbsp;类别：<%
													if (shangpinGetId.getShangpinType() == 0) {
												%>图片<%
													} else {
												%>视频<%
													}
												%>
												</td>
											</tr>
											<tr>
												<td align="left">&nbsp;作者：<%=shangpinGetId.getShangpinMark1()%>
												</td>
											</tr>
											<tr>
												<td align="left">&nbsp;分类：<%=shangpinGetId.getSptypeName()%>
												</td>
											</tr>
											<tr>
												<td align="left">&nbsp;上传：<%=DateUtil.formatDate(shangpinGetId.getShangpinDate(),
						"yyyy-MM-dd HH:mm:ss")%>
												</td>
											</tr>
										<tr>
											<td height="50" align="left"><a
												href="javascript:addSpchu(<%=shangpinGetId.getShangpinId()%>)"><input
													type="button" class="tbutton" value="收藏下载" /> </a>
											</td>
										</tr>
										</form>
									</table></td>
							</tr>

						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="padding-top:15px;">
							<tr>
								<td height="35" class="sort">&nbsp;&nbsp;详细介绍</td>
							</tr>
							<tr>
								<td
									style="border:1px solid #e0e0e0; border-top:0px; padding:10px; line-height:25px;">
									<%=shangpinGetId.getShangpinMark()%></td>
							</tr>
						</table>
					</td>
					<%
						} else {
					%>
					<td>没有选择素材</td>
					<%
						}
					%>
				</tr>
			</table></td>
	</tr>
</table>
<%@ include file="footer.jsp"%>
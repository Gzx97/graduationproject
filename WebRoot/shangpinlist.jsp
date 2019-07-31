<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px auto;">
  <tr>
    <td width="255" valign="top" bgcolor="#FFFFFF" style="border:1px solid #e0e0e0;">
<%@ include file="left.jsp"%>
    </td>
    <td width="10" valign="top">&nbsp;</td>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="30"  class="sort"><a href="index.jsp">首页</a> &gt;&gt; <%if(StringUtil.isNotEmpty(shangpinName)){ %><%=shangpinName%><%}else if(StringUtil.isNotEmpty(sptypeName)){ %><%=sptypeName%><%}else{ %>全部素材<%} %></td>
      </tr>
      <tr>
        <td height="" valign="top" bgcolor="#FFFFFF" style="border:1px solid #e0e0e0; line-height:25px;">
							<%if(shangpinsSousuo!=null){ %>
								<%for(int i = 0; i < shangpinsSousuo.size(); i++){ %>
								<%Shangpin shangpin = shangpinsSousuo.get(i); %>
		<div class="product">
			<table width="222" border="0" cellpadding="0" cellspacing="0" style=" margin:5px 5px;;" align="center">
				<tr>
					<td align="center" valign="middle">
					<a href="wangzhangetShangpinId?shangpinId=<%=shangpin.getShangpinId()%>">
						<%if(shangpin.getShangpinImg()!=null){ %>
						<img src="../cgduomeiti/<%=shangpin.getShangpinImg() %>" width="220"  height="180"/>
					<%}else{ %>
						<img src="../cgduomeiti/wangzhan/images/cuowu.jpg" width="220"  height="180" />
					<%}%></a>
							</td>
					<tr><td height="30" align="center"><%=shangpin.getShangpinName() %></td></tr>
			</table></div>
								<%} %>
							<%} else{%>
							没有素材
							<%}%>
        </td></tr>
    </table></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px auto;">
  <tr>
    <td width="240" valign="top" bgcolor="#FFFFFF" style="border:1px solid #e0e0e0;">
	<%@ include file="left.jsp"%></td>
    </td>
    <td width="10" valign="top">&nbsp;</td>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31" class="sort"><a href="index.jsp">首页</a> &gt;&gt; 公告信息</td>
      </tr>
      <tr>
		<%if(gonggaoGetId!=null) {%>
        <td height="" valign="top" bgcolor="#FFFFFF" style="border:1px solid #e0e0e0; padding:10px; line-height:25px;">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" align="center" class="line"><%=gonggaoGetId.getGonggaoName()%></td>
                  </tr>
                  <tr>
                    <td height="30" align="center" class="line"><%=gonggaoGetId.getGonggaoDate()%> 发布者:管理员</td>
                  </tr>
                  <tr>
                    <td align="left"><div style="margin:20px; line-height:23px;"><%=gonggaoGetId.getGonggaoMark()%></div></td>
                  </tr>
			</table>
        </td>
		<%}else{ %>
		<td>没有选择公告</td>
		<%} %>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
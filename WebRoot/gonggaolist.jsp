<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px auto;">
  <tr>
    <td width="240" valign="top" bgcolor="#FFFFFF" style="border:1px solid #e0e0e0;">
<%@ include file="left.jsp"%>
    </td>
    <td width="10" valign="top">&nbsp;</td>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31"  class="sort"><a href="index.jsp">首页</a> &gt;&gt;公告信息</td>
      </tr>
      <tr>
        <td height="" valign="top" bgcolor="#FFFFFF" style="border:1px solid #e0e0e0; padding:10px; line-height:25px;">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <%if(gonggaosSousuo!=null){ %>
			<%for(int i = 0; i < gonggaosSousuo.size(); i++){ %>
				<%Gonggao gonggao = gonggaosSousuo.get(i); %>
        <tr>
          <td width="559" height="30" align="left" class="line">&nbsp;&middot;&nbsp;
		  <a href="wangzhangetGonggaoId?gonggaoId=<%=gonggao.getGonggaoId()%>"><%=gonggao.getGonggaoName() %></a></td>
          <td width="167" height="30" class="line">&nbsp;<%=DateUtil.formatDate(gonggao.getGonggaoDate(),"yyyy-MM-dd HH:mm:ss") %></td>
        </tr>
			<%} %>
		<%} else{%>
		<tr><td align="center" valign="middle">没有公告</td><tr>
		<%}%>
      </table>
        </td></tr>

    </table></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
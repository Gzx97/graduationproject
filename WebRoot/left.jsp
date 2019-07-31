<%@ page language="java" contentType="text/html; charset=utf-8"  import="com.model.*,java.util.List,java.util.ArrayList"
	pageEncoding="utf-8"%>
	<table width="255" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
          <td valign="top">
            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="tablebottom">
            <tr>
              <td align="left" class="con2">&nbsp;&nbsp;&nbsp;<b>素材分类</b></td>
              <td width="59" align="center" valign="middle" class="more"><a href="wangzhangetShangpinsSousuo">更多>></a></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr><td height="10" colspan="2"></td></tr>
			<%if(sptypes!=null){ %>
				<%for(int i = 0; i < sptypes.size(); i++){ %>
          	<tr >
             <td align="left" width="13">&nbsp;</td>
            <td align="left" class="proOne"><a href="wangzhangetShangpinsSousuo?sptypeId=<%=sptypes.get(i).getSptypeId() %>"><%=sptypes.get(i).getSptypeName() %></a></td>
           
            </tr>
				<%} %>
			<%} %>
			<tr><td height="5" colspan="2"></td></tr>
    </table></td>
        </tr>
    </table>
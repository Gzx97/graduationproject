<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
    
    <script type="text/javascript" src="wangzhan/js/jquery-1.8.0.min.js"></script>
<script src="wangzhan/js/jquery.slider.min.js"></script>
        <link rel="stylesheet" type="text/css" href="wangzhan/css/huandeng.css"/>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".slider").slideshow({
                width: 998,
                height: 330,
                transition: ['bar', 'Rain', 'square', 'squareRandom', 'explode']
                });
            });
        </script>
        <div class="slider">
        <div><img src="wangzhan/images/banner1.jpg" width="998" height="330" /></div>
        <div><img src="wangzhan/images/banner2.jpg" width="998" height="330" /></div>
        <div><img src="wangzhan/images/banner3.jpg" width="998" height="330" /></div>
        </div>
    
</td></tr></table>
<div class="height10"></div>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" style="border: #CCC 1px solid;">
  <tr>
    <td width="100%" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="nav1">
            <tr>
              <td align="left" class="con2">&nbsp;&nbsp;&nbsp;图片中心</td>
              <td width="59" align="center" valign="middle" class="more"><a href="wangzhangetShangpinsSousuo">更多>></a></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="" valign="top" bgcolor="#FFFFFF" style=" padding:10px; line-height:25px;">
        <%if(shangpins!=null){ %>
								<%for(int i = 0; i < shangpins.size(); i++){ %>
								<%Shangpin shangpin = shangpins.get(i); %>
            <div class="product"><table width="222" border="0" cellpadding="0" cellspacing="0" style=" margin:5px 5px;;" align="center">
				<tr>
					<td align="center" valign="middle">
					<a href="wangzhangetShangpinId?shangpinId=<%=shangpin.getShangpinId()%>">
											<%if(shangpin.getShangpinImg()!=null){ %>
											<img src="../cgduomeiti/<%=shangpin.getShangpinImg() %>" width="163" height="163" />
											<%}else{ %>
											<img src="../cgduomeiti/wangzhan/images/cuowu.jpg" width="163" height="163" />
											<%}%>
					</a>
							</td>
					<tr><td height="30" align="center"><%=shangpin.getShangpinName() %></td></tr>
								<tr>
									<td height="30" align="center">作者:<span
										style="color:#e60432">
											<%=shangpin.getShangpinMark1() %>
									</span></td>
								</tr>
			</table></div>
								<%} %>
							<%} else{%>
							没有素材
							<%}%>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<table width="1000" border="0" cellpadding="0" cellspacing="0" align="center" style="margin:10px auto;">
  <tr>
	<td width="255" valign="top" style="border: #CCC 1px solid;">
<%@ include file="left.jsp"%>
    </td>

    
    <td width="12" valign="top">&nbsp;</td>

    <td valign="top">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border: #CCC 1px solid;">
        <tr>
          <td valign="top">
            <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="nav1">
            <tr>
              <td align="left" class="con2">&nbsp;&nbsp;&nbsp;<b>公告信息</b></td>
              <td width="59" align="center" valign="middle" class="more"><a href="wangzhangetGonggaosSousuo">更多>></a></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr><td height="10" colspan="2"></td></tr>
        <%if(gonggaos!=null){ %>
			<%for(int i = 0; i < gonggaos.size(); i++){ %>
				<%Gonggao gonggao = gonggaos.get(i); %>
          	<tr >
            <td height="30" align="left">&nbsp;&nbsp;&middot;&nbsp;<a href="wangzhangetGonggaoId?gonggaoId=<%=gonggao.getGonggaoId()%>"><%=gonggao.getGonggaoName() %></a></td>
            <td width="150" align="left"><%=DateUtil.formatDate(gonggao.getGonggaoDate(),"yyyy-MM-dd HH:mm:ss") %></td>
            </tr>
			<%} %>
		<%} else{%>
		<tr><td align="center" valign="middle">没有公告</td><tr>
		<%}%>
		<tr><td height="5" colspan="2"></td></tr>
    </table></td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" style="border: #CCC 1px solid;">
  <tr>
    <td width="100%" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="31"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" class="nav1">
            <tr>
              <td align="left" class="con2">&nbsp;&nbsp;&nbsp;视频中心</td>
              <td width="59" align="center" valign="middle" class="more"><a href="wangzhangetShangpinsSousuo">更多>></a></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td height="" valign="top" bgcolor="#FFFFFF" style=" padding:10px; line-height:25px;">
        <%if(shangpin1s!=null){ %>
								<%for(int i = 0; i < shangpin1s.size(); i++){ %>
								<%Shangpin shangpin = shangpin1s.get(i); %>
            <div class="product"><table width="222" border="0" cellpadding="0" cellspacing="0" style=" margin:5px 5px;;" align="center">
				<tr>
					<td align="center" valign="middle">
					<a href="wangzhangetShangpinId?shangpinId=<%=shangpin.getShangpinId()%>">
											<%if(shangpin.getShangpinImg()!=null){ %>
											<img src="../cgduomeiti/<%=shangpin.getShangpinImg() %>" width="163" height="163" />
											<%}else{ %>
											<img src="../cgduomeiti/wangzhan/images/cuowu.jpg" width="163" height="163" />
											<%}%>
					</a>
							</td>
					<tr><td height="30" align="center"><%=shangpin.getShangpinName() %></td></tr>
								<tr>
									<td height="30" align="center">作者:<span
										style="color:#e60432">
											<%=shangpin.getShangpinMark1() %>
									</span></td>
								</tr>
			</table></div>
								<%} %>
							<%} else{%>
							没有素材
							<%}%>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
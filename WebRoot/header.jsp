<%@ page language="java" contentType="text/html; charset=utf-8"  import="com.model.*,com.util.*,java.util.List,java.util.ArrayList"  pageEncoding="utf-8"%>
   
<%
	// 权限验证
	Yonghu yonghu = (Yonghu)session.getAttribute("yonghu");
	int yonghuId = 0;
	if(yonghu!=null){
		yonghuId = yonghu.getYonghuId();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>多媒体素材库</title>
<link href="wangzhan/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	var yonghuId = <%=yonghuId%>;
	function wangzhangetGgtype(){
		$.post("wangzhangetGgtypes",{delIds:1},function(result){
				},"json");
	}
	function wangzhangetSptype(){
		$.post("wangzhangetSptypes",{delIds:1},function(result){
				},"json");
	}
	function wangzhangetShangpin(){
		$.post("wangzhangetShangpins",{delIds:1},function(result){
				},"json");
	}
	function wangzhangetGonggao(){
		$.post("wangzhangetGonggaos",{delIds:1},function(result){
				},"json");
	}
</script>
<%
	//首页显示全部分类
	List<Sptype> sptypes = new ArrayList<Sptype>();
	sptypes = (List) session.getAttribute("sptypes");
	if(sptypes == null){
		System.out.println("没有分类");
	}else{
		System.out.println("分类数量为:"+sptypes.size());
	}
	//首页显示全部图片
	List<Shangpin> shangpin1s = new ArrayList<Shangpin>();
	shangpin1s = (List) session.getAttribute("shangpin1s");
	//首页显示全部视频
	List<Shangpin> shangpins = new ArrayList<Shangpin>();
	shangpins = (List) session.getAttribute("shangpins");
	if(shangpins == null){
		System.out.println("没有图片");
	}else{
		System.out.println("图片数量为:"+shangpins.size());
	}
	//具体图片页
	Shangpin shangpinGetId = new Shangpin();
	shangpinGetId = (Shangpin) session.getAttribute("shangpinGetId");
	if(shangpinGetId == null){
		System.out.println("没有图片呀");
	}else{
		System.out.println("图片名称为:"+shangpinGetId.getShangpinName());
	}
	//搜索和类型显示图片
	List<Shangpin> shangpinsSousuo = new ArrayList<Shangpin>();
	shangpinsSousuo = (List) session.getAttribute("shangpinsSousuo");
	if(shangpinsSousuo == null){
		System.out.println("没有图片");
	}else{
		System.out.println("图片数量为:"+shangpinsSousuo.size());
	}
	String shangpinName = null;
	shangpinName = (String) session.getAttribute("shangpinName");
	String sptypeName = null;
	sptypeName = (String) session.getAttribute("sptypeName");
	//首页显示全部公告分类
	List<Ggtype> ggtypes = new ArrayList<Ggtype>();
	ggtypes = (List) session.getAttribute("ggtypes");
	if(ggtypes == null){
		System.out.println("没有公告分类");
	}else{
		System.out.println("公告分类数量为:"+ggtypes.size());
	}
	//具体公告页
	Gonggao gonggaoGetId = new Gonggao();
	gonggaoGetId = (Gonggao) session.getAttribute("gonggaoGetId");
	if(gonggaoGetId == null){
		System.out.println("没有公告呀");
	}else{
		System.out.println("公告名称为:"+gonggaoGetId.getGonggaoName());
	}
	//搜索和类型公告
	List<Gonggao> gonggaosSousuo = new ArrayList<Gonggao>();
	gonggaosSousuo = (List) session.getAttribute("gonggaosSousuo");
	if(gonggaosSousuo == null){
		System.out.println("没有公告");
	}else{
		System.out.println("公告数量为:"+gonggaosSousuo.size());
	}
	//首页显示全部公告
	List<Gonggao> gonggaos = new ArrayList<Gonggao>();
	gonggaos = (List) session.getAttribute("gonggaos");
	if(gonggaos == null){
		System.out.println("没有公告");
	}else{
		System.out.println("公告数量为:"+gonggaos.size());
	}
	String gonggaoName = null;
	gonggaoName = (String) session.getAttribute("gonggaoName");
	String ggtypeName = null;
	ggtypeName = (String) session.getAttribute("ggtypeName");
%>
</head>
<body onload="wangzhangetSptype();wangzhangetShangpin();wangzhangetGgtype();wangzhangetGonggao();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td bgcolor="#FFFFFF" align="center" class="nav">
  <table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
      
      <td width="15"></td>
      <td height="100" class="logo">多媒体素材库</td>
      <td></td>
    </tr>
  </table>
    </td>
    </tr>
    </table>
   <div id="topnav">
        <div class="w">
            <ul>
                <li class="hover"><a href="index.jsp">素材首页</a></li>
                <li><a href="wangzhangetGonggaosSousuo">公告信息</a>
				<%if(ggtypes!=null){ %>
					<dl>
					<%for(int i = 0; i < ggtypes.size(); i++){ %>
					<dt><a href="wangzhangetGonggaosSousuo?ggtypeId=<%=ggtypes.get(i).getGgtypeId() %>"><%=ggtypes.get(i).getGgtypeName() %></a></dt>
					<%} %>
					</dl>
				<%} %>
                </li>
                <li><a href="wangzhangetShangpinsSousuo">素材中心</a>
				<%if(sptypes!=null){ %>
					<dl>
					<%for(int i = 0; i < sptypes.size(); i++){ %>
					<dt><a href="wangzhangetShangpinsSousuo?sptypeId=<%=sptypes.get(i).getSptypeId() %>"><%=sptypes.get(i).getSptypeName() %></a></dt>
					<%} %>
					</dl>
				<%} %>
				</li>
				<%if(yonghuId==0){%>
				<li><a href="userindex.jsp">登录注册</a></li>
				<%}else{%>
                <li><a href="yonghuMain.jsp">用户中心</a></li>
				<%}%>
            </ul>
        </div>
    </div>
    <script>
	$(function(){
	var cname="";
	$("#topnav li").hover(function(){
		cname=$(this).attr("class");
		if(!cname){$(this).addClass("hover");}
		$("dl",this).show();
	},function(){
		$("dl",this).hide();
		if(!cname){$(this).removeClass("hover");}
	});
	//
	DY_scroll('.pro_width','.arrow_left','.arrow_right','.pro_width',5,true);

})
</script>
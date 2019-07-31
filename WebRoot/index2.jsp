<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>  
<title>类人机器人素材库管理系统</title>
</head>
<head>
    <title>类人机器人素材库管理系统</title><meta charset="UTF-8" />
<body>
<div title="类人机器人素材库管理系统" >
	<!-- <div align="center" style="padding-top: 10px;"><font  size="8">欢迎使用类人机器人素材库管理系统</font></div> -->
	<style>

body {
  height: 1000px;
  font-family: 'Montserrat', sans-serif;
  text-align: center;
  background: url("images/1.jpg") repeat left top;
  background-size: cover;
  overflow: hidden;
}

.hole {
  margin: -150px 0 0 -150px;
  width: 300px;
  height: 300px;
  box-shadow: 0 0 0 9999em #393D49; 
  border-radius: 50%;
  cursor: pointer;
  position: fixed;
  transition: width .5s ease-in-out, height .5s ease-in-out, margin .5s ease-in-out;
}

.hole:after {
  content: "";
  display: block;
  margin: -1% 0 0 -1%;
  width: 102%;
  height: 102%;
  box-shadow: inset 0 0 50px 50px #393D49;
  border-radius: 50%;
}

.hole:active {
  margin: -250px 0 0 -250px;
  width: 500px;
  height: 500px;
  transition: width 1s ease-in-out, height 1s ease-in-out, margin 1s ease-in-out;
}

p {
  display: inline-block;
  width: 860px;
  height: 184px;
  font-size: 100px;
  color: #FFF;
  position: absolute;
  top: 50%;
  left: 25%;
  z-index:1;
}

</style>
</head>
<body>

<div class="hole"></div>

<p>欢迎来到素材库 </p>

<script>
$(document).on("mousemove", function(event) {
  $(".hole").css({
    "top": event.pageY,
    "left": event.pageX
  });
});
</script>
	
</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<!-- Head -->
<head>

<title>登录</title>

<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- //Meta-Tags -->

<!-- Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/login.css"
	type="text/css" media="all">



</head>
<!-- //Head -->

<!-- Body -->
<body>
	<h1></h1>

	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>登 录<span style="color:red; font-size: 12px; margin-left: 3px;">${error1 }</span></h2>
			<form action="${pageContext.request.contextPath }/user/login.html"
				method="post">
				<input type="hidden" id="path" value="${pageContext.request.contextPath }"/>
				<input type="text" Name="username" placeholder="用户名" required="" value="${username }">
				<input type="password" Name="userpassword" placeholder="密码" value="${userpwd }"
					required="">

				<ul class="tick w3layouts agileits" >
					<li><input type="checkbox" id="brand1" value="remember" name="remember" > <label
						for="brand1"><span></span>记住我</label></li>
				</ul>
				<div class="send-button w3layouts agileits">

					<input type="submit" value="登 录">

				</div>
			</form>
			<a href="#">忘记密码?</a>
			<div class="social-icons w3layouts agileits">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="#"> <span
							class="icons w3layouts agileits"></span> <span
							class="text w3layouts agileits">QQ</span></a></li>
					<li class="weixin w3ls"><a href="#"> <span
							class="icons w3layouts"></span> <span
							class="text w3layouts agileits">微信</span></a></li>
					<li class="weibo aits"><a href="#"> <span
							class="icons agileits"></span> <span
							class="text w3layouts agileits">微博</span></a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="copyrights"></div>
		<div class="register w3layouts agileits">
			<h2>注 册<span style="color:red; font-size: 12px; margin-left: 3px;">${error2 } </span></h2>
			<form action="${pageContext.request.contextPath }/user/register.html" method="post">
				<input type="text" Name="username" placeholder="用户名" required="" class="username" id="username"
					pattern="^[a-z0-9_-]{3,16}$" value=""> 
				
				<input type="password" Name="userpassword" placeholder="密码" required="" class="userpassword" id="userpassword"
					pattern="^[a-z0-9_-]{6,18}$" value=""> 
				<input type="password" class="userpassword2" id="userpassword2"
					Name="userpassword2" placeholder="确认密码" required=""
					pattern="^[a-z0-9_-]{6,18}$" value=""> 
					<input type="text"
					Name="email" placeholder="邮箱" required="" class="email" id="email"
					pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$" value="">
				<input type="text" class="phone" id="phone" value=""
					Name="phone" placeholder="手机号码" required="" pattern="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$">
				<div class="send-button w3layouts agileits">
					<input type="submit" value="注册" id="register">
				</div>
			</form>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/login.js"></script>
</body>
<!-- //Body -->

</html>
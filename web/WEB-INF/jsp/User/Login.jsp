<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>登录</title>
	<link rel="stylesheet" type="text/css" href="../css/Login.css"/>
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/login.js"></script>
</head>
<body style="background-image: url('../images/login_background.jpg');background-size: cover">
<div class="mainbox">
	<div class="boxTop">
		<h1>
			<span>L</span>
			<span>O</span>
			<span>G</span>
			<span>I</span>
			<span>N</span>
		</h1>
	</div>
	<div class="boxBottom">
		<form action="../User/login" method="post" class="" name="loginForm">
			<%--用户名--%>
			<div class="content">
				<div class="together">
					<div class="front">ID</div>
					<input type="text" class="middle" name="username" id="username">
				</div>
				<div class="back" style="color: red;" id="nameNull"></div>
			</div>
			<%--密码--%>
			<div class="content">
				<div class="together">
					<div class="front">Password</div>
					<input type="password" class="middle" name="password" id="password">
				</div>
				<div class="back" style="color: red;" id="passwordNull"></div>
			</div>
			<%--验证码--%>
			<div class="content">
				<div class="together" style="border: 1px solid rgba(255,255,255,0)">
					<div>
						<input type="text"
						       style=" background-color: transparent;border:2px solid black;height:50px;width: 128%; top:0;border-radius: 10px;font-size: 20px;text-align: center;"
						       name="vCode"/>
					</div>
					<a href="#"><img border="0" width="150px" style="margin-left: 80px;" id="verificationCode"
					                 onclick="newVerification()" src="../User/verificationCode" name="checkcode"></a>
				</div>
			</div>
			<div style="color: red;margin-top: 5px;text-align: center">${requestScope.messageBox}</div>
			<input type="submit" class="button" value="Login" onclick="return check();">
		</form>
		<div style="width: 120px;height:23px"><a href="../User/showRegister">to Register</a></div>
	</div>
</div>
</body>
</html>
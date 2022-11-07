<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../css/Login.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<title>Login</title>
</head>

<body>
<div class="all">
	<div class="box">
		<div class="pre-box">
			<h1>WELCOME</h1>
			<p>JOIN US!</p>
			<div class="img-box">
				<img src="" alt="" class="img01">
			</div>
		</div>

		<%--注册--%>
		<div class="register-form">
			<div class="title-box">
				<h1>Register</h1>
			</div>
			<form action="../User/register" method="post" class="input-box">
				<input type="text" name="username" placeholder="ID">
				<input type="password" name="password" placeholder="password">
				<input type="password" placeholder="Repeat password">
				<div class="vf">
					<input type="text" name="vCode" placeholder="verificationCode"/>
					<a href="../User/verificationCode"><img border="0" src="../User/verificationCode" name="checkcode"></a>
				</div>
				<div style="color: red;text-align: right">${requestScope.messageBox}</div>
				<input type="submit" class="btn" value="Register">
			</form>

			<div class="btn-box">
				<p onclick="mySwitch()">Have an account already? TO Login!</p>
			</div>
		</div>

		<%--登录--%>
		<div class="login-form">
			<div class="title-box">
				<h1>Login</h1>
			</div>

			<form action="../User/login" method="post" class="input-box">
				<input type="text" name="username" placeholder="ID">
				<input type="password" name="password" placeholder="password">
				<div class="vf">
					<input type="text" name="vCode" placeholder="verificationCode"/>
					<a href="newUser"><img border="0" src="../User/verificationCode" name="checkcode"></a>
				</div>
				<div style="color: red;text-align: right">${requestScope.messageBox}</div>
				<input type="submit" class="btn" value="Login">
			</form>

			<div class="btn-box">
				<p onclick="mySwitch()">Need an account? Register Now!</p>
			</div>
		</div>

	</div>
</div>

<script>
    let flag = true
    const mySwitch = () =>
    {
        if (flag)
        {
            $(".pre-box").css("transform", "translateX(100%)")
            $(".pre-box").css("background-color", "rgb(205,228,238)")
            $(".img01").attr("src", "../images/login02.jpg")

        } else
        {
            $(".pre-box").css("transform", "translateX(0%)")
            $(".pre-box").css("background-color", "rgb(230,226,224)")
            $(".img01").attr("src", "../images/login01.png")
        }
        flag = !flag
    }
</script>

</body>
</html>
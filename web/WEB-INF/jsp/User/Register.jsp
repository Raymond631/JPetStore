<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/11/11
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../css/Login.css"/>
	<title>登录</title>
	<script>
        function check()
        {
            let result = true;
            var username = document.getElementById("username");
            let name = registerForm.username.value;
            if (username.value.trim() == "")
            {//没有输入用户名是显示提示
                var findNodes = document.getElementById("nameNull");
                findNodes.innerText = "用户名不能为空";
                result = false;
            } else
            {//输入了内容后清除节点内容
                document.getElementById("nameNull").textContent = "";
                if (result)
                    result = true;
            }

            var password = document.getElementById("password");
            let pass = registerForm.password.value;
            if (password.value.trim() == "")
            {
                var findNodes2 = document.getElementById("passwordNull");
                findNodes2.innerText = "密码不能为空";
                result = false;
            } else
            {
                document.getElementById("passwordNull").innerText = "";
                if (result)
                    result = true;
            }

            var confirm = document.getElementById("confirm");
            let com = registerForm.password.value;
            if (confirm.value.trim() == "")
            {
                var findNodes3 = document.getElementById("confirmNull");
                findNodes3.innerText = "确认密码不能为空";
                result = false;
            } else
            {
                document.getElementById("confirmNull").innerText = "";
                if (password.value.trim() != "" && confirm.value != password.value)
                {
                    document.getElementById("confirmNull").innerText = "两次输入不相同";
                    result = false;
                } else if (password.value.trim() != "" && confirm.value == password.value)
                {
                    if (result)
                        result = true;
                } else
                {
                    document.getElementById("confirmNull").innerText = "两次输入不相同";
                    result = false;
                }
            }

            console.log(result);
            return result;
        }

        function newVerification()
        {
            let image = document.getElementById("verificationCode");
            image.src = "../User/verificationCode?" + new Date().getMilliseconds();
        }

	</script>
</head>
<body style="background-image: url('../images/login_background.jpg');background-size: cover">

<div class="mainbox" style="height: 600px">
	<div class="boxTop">
		<h1>
			<span>R</span>
			<span>E</span>
			<span>G</span>
			<span>I</span>
			<span>S</span>
			<span>T</span>
			<span>E</span>
			<span>R</span>
		</h1>
	</div>
	<div class="boxBottom">
		<form action="../User/register" method="post" class="" name="registerForm">

			<div class="content">
				<div class="together">
					<div class="front">ID</div>
					<input type="text" class="middle" name="username" id="username">
				</div>
				<div class="back" style="color: red;" id="nameNull"></div>
			</div>

			<div class="content">
				<div class="together">
					<div class="front">Password</div>
					<input type="password" class="middle" name="password" id="password">
				</div>
				<div class="back" style="color: red;" id="passwordNull"></div>
			</div>

			<div class="content">
				<div class="together">
					<div class="front">Confirm</div>
					<input type="password" class="middle" name="confirm" id="confirm">
				</div>
				<div class="back" style="color: red;" id="confirmNull"></div>
			</div>

			<div class="content">
				<div class="together" style="border: 1px solid rgba(255,255,255,0)">
					<div>
						<input type="text" style=" background-color: transparent;border:2px solid black;height:50px;width: 128%; top:0;border-radius: 10px;" name="vCode"/>
					</div>
					<a href="#"><img border="0" width="150px" style="margin-left: 80px;" id=" verificationCode" onclick="newVerification()" src="../User/verificationCode" name="checkcode"></a>
				</div>
			</div>
			<div style="color: red;margin-top: 5px;text-align: center">${requestScope.messageBox}</div>
			<input type="submit" class="button" value="Register" onclick="return check();">
		</form>
		<div style="width: 120px;height:23px"><a href="../User/showLogin">to Login</a></div>
	</div>
</div>
</body>
</html>
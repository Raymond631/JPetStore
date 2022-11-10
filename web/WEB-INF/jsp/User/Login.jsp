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
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/Login.css">
    <title>登录界面</title>
    <script>
        function check() {
            let result = true;
            var username = document.getElementById("username");
            let name = loginForm.username.value;
            if (username.value.trim() == "") {//没有输入用户名是显示提示
                var findNodes = document.getElementById("nameNull");
                findNodes.innerText = "用户名不能为空";
                result = false;
            } else {//输入了内容后清除节点内容
                document.getElementById("nameNull").textContent = "";
                if (result)
                    result = true;
            }

            var password = document.getElementById("password");
            let pass = loginForm.password.value;
            if (password.value.trim() == "") {
                var findNodes2 = document.getElementById("passwordNull");
                findNodes2.innerText = "密码不能为空";
                result = false;
            } else {
                document.getElementById("passwordNull").innerText = "";
                if (result)
                    result = true;
            }
            console.log(result);
            // return false;
            return result;
            // if (name == "root" && pass == "123") {
            //     console.log("yeap");
            //     // window.location.href = '../User/root';
            //     return false;
            // }
        }

        function newVerification() {
            let image = document.getElementById("verificationCode");
            image.src = "../User/verificationCode";
        }

    </script>
</head>

<body>
<%@ include file="../Common/Top.jsp" %>

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

            <form action="../User/login" method="post" class="input-box" name="loginForm">
                <input type="text" name="username" placeholder="ID" id="username">
                <span style="color: red;" id="nameNull"></span>
                <input type="password" name="password" placeholder="password" id="password">
                <span style="color: red;" id="passwordNull"></span>
                <div class="vf">
                    <input type="text" name="vCode" placeholder="verificationCode"/>
                    <a href="newUser"><img border="0" src="../User/verificationCode" name="checkcode"></a>
                </div>
                <div style="color: red;text-align: right">${requestScope.messageBox}</div>
                <input type="submit" class="btn" value="Login" onclick="return check();">
            </form>

            <div class="btn-box">
                <p onclick="mySwitch()">Need an account? Register Now!</p>
            </div>
        </div>

    </div>
</div>

<script>
    let flag = true
    const mySwitch = () => {
        if (flag) {
            $(".pre-box").css("transform", "translateX(100%)")
            $(".pre-box").css("background-color", "rgb(96,96,97)")
            $(".img01").attr("src", "../images/login02.jpg")

        } else {
            $(".pre-box").css("transform", "translateX(0%)")
            $(".pre-box").css("background-color", "rgb(128,128,130)")
            $(".img01").attr("src", "../images/login01.png")
        }
        flag = !flag
    }
</script>
</body>
</html>
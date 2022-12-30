<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/12/29
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="../css/IndexBack.css">
    <script src="https://cdn.staticfile.org/Chart.js/3.9.1/chart.js"></script>
    <%-- 图片--%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>
<body>
<%@include file="../Common/LeftBack.jsp" %>
<div class="mainBox">
    <div class="topName">JPetstore Backstage</div>
    <div class="topContent">
        <div class="welcome">
            <div style="font-size:40px;padding-left: 100px;">Welcome</div>
            to JPetstore backstage management system
        </div>
        <div class="fourButton">
            <a href="">
                <li style="background-color: rgb(28,132,198);">User</li>
            </a>
            <a href="../Pet/ProductAllBack">
                <li style="background-color: rgb(35,198,200);">Product</li>
            </a>
            <a href="../User/ServiceBack">
                <li style="background-color: rgb(26,179,148);">Call center</li>
            </a>
            <a href="../User/signOut">
                <li style="background-color: rgb(237,85,101);">Logout</li>
            </a>
        </div>
    </div>
    <div class="bottomLeft">
        <div class="introduction">We have 5 species,</br>each with 5 different varieties.</div>
        <a href="../Pet/homePage" style="font-size:20px;padding-left:30px;color:black"> check there to see</a>
    </div>
    <div class="bottomRight">
        <div class="label">Tips</div>
        <div class="tip">
            <div class="advice">Prepare more
                <span style="color:red" id="most">cats</span></div>
            <div class="cause" style="background-color: rgb(26,179,148);">5220</div>
        </div>
        <div class="tip" style="border:white">
            <div class="advice">Prepare less
                <span style="color:red">reptiles</span>
            </div>
            <div class="cause" style="background-color: rgb(237,85,101);">2230</div>
        </div>
    </div>
</div>
</body>
</html>

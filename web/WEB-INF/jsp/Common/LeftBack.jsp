<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/12/28
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/LeftBarBack.css">
    <script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
    <title>Title</title>
</head>
<body>
<!--左侧侧边栏-->
<div class="side-left">
    <div class="username">
        <%--    最好在这个地方放一张图片--%>
        Name
    </div>

    <div>
        <span> <i class="fa fa-balance-scale" aria-hidden="true"></i></span>
        <div class="list_one" id="one">首页</div>
        <div class="list_two">
            <a href="../User/IndexBack" style="text-decoration: none; color:white">
                <div class="addColor" id="index">首页</div>
            </a>
        </div>
    </div>
    <div>
        <span> <i class="fa fa-balance-scale" aria-hidden="true"></i></span>
        <div class="list_one" id="two">用户信息</div>
        <div class="list_two">
            <div class="addColor" id="src1">1</div>
            <div class="addColor" id="src2">2</div>
        </div>
    </div>
    <div>
        <span><i class="fa fa-telegram" aria-hidden="true"></i></span>
        <div class="list_one" id="three">商品信息</div>
        <div class="list_two">
            <a href="../Pet/ProductAllBack" style="text-decoration: none; color:white">
                <div class="addColor" id="total">汇总</div>
            </a>
            <a href="../Pet/ProductDetailBack?Category=Fish" style="text-decoration: none; color:white">
                <div class="addColor" id="product1">Fish</div>
            </a>
            <a href="../Pet/ProductDetailBack?Category=Dogs" style="text-decoration: none; color:white">
                <div class="addColor" id="product2">Dogs</div>
            </a>
            <a href="../Pet/ProductDetailBack?Category=Reptiles" style="text-decoration: none; color:white">
                <div class="addColor" id="product3">Reptiles</div>
            </a>
            <a href="../Pet/ProductDetailBack?Category=Cats" style="text-decoration: none; color:white">
                <div class="addColor" id="product4">Cats</div>
            </a>
            <a href="../Pet/ProductDetailBack?Category=Birds" style="text-decoration: none; color:white">
                <div class="addColor" id="product5">Birds</div>
            </a>
        </div>
    </div>
    <div>
        <span> <i class="fa fa-user-circle-o" aria-hidden="true"></i></span>
        <div class="list_one" id="four">客服</div>
        <div class="list_two">
            <a href="../User/ServiceBack" style="text-decoration: none; color:white">
                <div class="addColor" id="src3">专家信息</div>
            </a>
        </div>
    </div>
</div>
<script src="../js/LeftBack.js"></script>
</body>

</html>

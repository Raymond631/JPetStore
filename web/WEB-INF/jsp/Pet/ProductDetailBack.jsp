<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/12/29
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/ProductDetailBack.css">
    <title>Title</title>
</head>
<body>
<%@include file="../Common/LeftBack.jsp" %>
<div class="mainBox">
    <div class="view">
        <div class="label">
            <span style="margin-left:10px;">Income</span>
            <span style="margin-left:130px;font-size: 12px; color: white; background-color: rgb(28,132,198); padding: 1px 8px 1px 8px  ;">
                Monthly
            </span>
        </div>
        <div class="bigWord">
            1242345
        </div>
        <div class="smallDescription">
            Total income
        </div>
    </div>
    <div class="view" style="margin-left:50px">
        <div class="label">
            <span style="margin-left:10px;">Order</span>
            <span style="margin-left:140px;font-size: 12px; color: white; background-color: rgb(35,198,200); padding: 1px 8px 1px 8px  ;">
                Annual
            </span>
        </div>
        <div class="bigWord">
            12324
        </div>
        <div class="smallDescription">
            Total orders
        </div>
    </div>
    <div class="view" style="margin-left:50px">
        <div class="label">
            <span style="margin-left:10px;">Sell</span>
            <span style="margin-left:155px;font-size: 12px; color: white; background-color: rgb(26,179,148); padding: 1px 8px 1px 8px  ;">
                Weekly
            </span>
        </div>
        <div class="bigWord">
            1242345
        </div>
        <div class="smallDescription">
            Total sold
        </div>
    </div>
    <div class="view" style="margin-left:50px">
        <div class="label">
            <span style="margin-left:10px;">Visitor</span>
            <span style="margin-left:145px;font-size: 12px; color: white; background-color: rgb(237,85,101); padding: 1px 8px 1px 8px  ;">
                Today
            </span>
        </div>
        <div class="bigWord">
            1242345
        </div>
        <div class="smallDescription">
            Total visits
        </div>
    </div>
    <div class="bottom">
        <div class="EachPrice">
            <canvas id="myChart" width="350px" height="420px"></canvas>
        </div>
        <div class="price">
            <div style="font-size:25px; border-bottom:1px solid  rgb(231,234,236);margin-top: 10px;">
                <div style="margin-left: 10px;"> Price</div>
            </div>
            <table>
                <tr>
                    <th>
                        Category
                    </th>
                    <th>
                        Purchase price
                    </th>
                    <th>
                        Sell Price
                    </th>
                </tr>
                <tr>
                    <td>
                        Cat1
                    </td>
                    <td id="">
                        1245
                    </td>
                    <td id="">
                        4233
                    </td>
                </tr>
                <tr>
                    <td>
                        Cat2
                    </td>
                    <td id="">
                        1233
                    </td>
                    <td id="">
                        2343
                    </td>
                </tr>
                <tr>
                    <td>
                        Cat3
                    </td>
                    <td id="">
                        3253
                    </td>
                    <td id="">
                        1233
                    </td>
                </tr>
                <tr>
                    <td>
                        Cat4
                    <td id="">
                        2342
                    </td>
                    <td id="">
                        1002
                    </td>
                </tr>
                <tr>
                    <td>
                        Cat5
                    </td>
                    <td id="">
                        2342
                    </td>
                    <td id="">
                        694
                    </td>
                </tr>
            </table>
        </div>
        <div class="orderDo">
            Order/Y:
            <span id="orderFinished" style="padding-left:10px;font-size:20px;">1123</span>
        </div>
        <div class="orderUndo">
            Order/N:
            <span id="orderUnfinished" style="padding-left:10px;font-size:20px;">1123</span>
        </div>
    </div>
    <div class="bottomRight">
        <div class="max" id="sellMax">
            <div class="label">
                <span style="margin-left:10px; font-size: 20px;">Max Sold</span>
            </div>
            <div class="bigWord" style="margin-top: -10px;color:black;">Cat1</div>
            <div class="maxDescription">
                <img src="../images/max.png">
                <span style="margin-left: 10px;">83</span>
            </div>
        </div>
        <div class="max" id="earnMax" style="margin-top: 30px;">
            <div class="label">
                <span style="margin-left:10px; font-size: 20px;">Max earning</span>
            </div>
            <div class="bigWord" style="margin-top: -10px;color:black;">Cat2</div>
            <div class="maxDescription">
                <img src="../images/max.png">
                <span style="margin-left: 10px;">2133</span>
            </div>
        </div>
        <div class="max" id="visitMax" style="margin-top: 30px;">
            <div class="label">
                <span style="margin-left:10px; font-size: 20px;">Max visits</span>
            </div>
            <div class="bigWord" style="margin-top: -10px;color:black;">Cat3</div>
            <div class="maxDescription" style="margin-top: 5px;">
                <img src="../images/max.png">
                <span style="margin-left: 10px;">4225</span>
            </div>
        </div>
    </div>

</div>
</body>
<script src="../js/ProductDetailBack.js"></script>
</html>

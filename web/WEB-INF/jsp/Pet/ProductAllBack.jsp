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
    <link rel="stylesheet" type="text/css" href="../css/ProductAllBack.css">
    <title>Title</title>
</head>
<body>
<%@include file="../Common/LeftBack.jsp" %>
<%--<div style="margin-left: 300px ;height:500px; width:400px;">--%>
<%--    <canvas id="myChart" width="400px" height="400px"></canvas>--%>
<%--</div>--%>
<div class="mainBox">
    <div class="topGraph">
        <div class="rank">
            <div class="rankLabel">
                Sales ranking
            </div>
            <div class="rankExplain">
                Comparison of sales in the past month
            </div>
            <table>
                <tr>
                    <td>
                        <div class="rankNumber" style="background-color:#1C84C6;">1</div>
                    </td>
                    <td id="firstCategory">
                        Cats
                    </td>
                    <td id="firstPrice">
                        4233
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="rankNumber" style="background-color: #23c6c8;">2</div>
                    </td>
                    <td id="secondCategory">
                        Dogs
                    </td>
                    <td id="secondPrice">
                        2343
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="rankNumber" style="background-color: rgb(26,179,148);">3</div>
                    </td>
                    <td id="thirdCategory">
                        Fish
                    </td>
                    <td id="thirdPrice">
                        1233
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="rankNumber" style="background-color: rgb(209,218,222);">4</div>
                    </td>
                    <td id="fourthCategory">
                        Reptiles
                    </td>
                    <td id="fourthPrice">
                        1002
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="rankNumber" style="background-color: rgb(26,179,148);">5</div>
                    </td>
                    <td id="fifthCategory">
                        Birds
                    </td>
                    <td id="fifthPrice">
                        694
                    </td>
                </tr>
            </table>
        </div>
        <div class="totalPrice">
            <canvas id="myChart" width="600px" height="300px"></canvas>
        </div>
        <div class="doughnutChart">
            <div style="text-align: center; font-size: 20px;">
                Sales
            </div>
            <canvas id="myDoughnutChart" width="250px" height="250px"></canvas>
        </div>
    </div>
    <div class="order">
        <div class="label">
            <div style="margin-left: 10px;"> Order</div>
        </div>
        <table>
            <tr>
                <th>
                    Category
                </th>
                <th>
                    Finished
                </th>
                <th>
                    Unfinished
                </th>
            </tr>
            <tr>
                <td>
                    Cats
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
                    Dogs
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
                    Fish
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
                    Reptiles
                <td id="">
                    2342
                </td>
                <td id="">
                    1002
                </td>
            </tr>
            <tr>
                <td>
                    Birds
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
    <div class="info">
        <div class="label">
            <div style="margin-left: 20px;"> Pet Information</div>
        </div>
        <table>
            <tr>
                <th>
                    Category
                </th>
                <th>
                    Category Numbner
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
                    Cats
                </td>
                <td>
                    2
                </td>
                <td id="catPurchase">
                    1245
                </td>
                <td id="catSell">
                    4233
                </td>
            </tr>
            <tr>
                <td>
                    Dogs
                </td>
                <td>
                    6
                </td>
                <td id="dogPurchase">
                    1233
                </td>
                <td id="dogSell">
                    2343
                </td>
            </tr>
            <tr>
                <td>
                    Fish
                </td>
                <td>
                    4
                </td>
                <td id="fishPurchase">
                    3253
                </td>
                <td id="fishSell">
                    1233
                </td>
            </tr>
            <tr>
                <td>
                    Reptiles
                </td>
                <td>
                    4
                </td>
                <td id="reptilePurchase">
                    2342
                </td>
                <td id="reptilrSell">
                    1002
                </td>
            </tr>
            <tr>
                <td>
                    Birds
                </td>
                <td>
                    2
                </td>
                <td id="birdPurchase">
                    50
                </td>
                <td id="birdSell">
                    230
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
<script src="../js/ProductAllBack.js"></script>
</html>

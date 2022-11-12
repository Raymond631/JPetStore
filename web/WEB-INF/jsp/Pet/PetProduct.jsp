<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/11/1
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href="../css/category.css"/>
</head>
<body>
<%@include file="../Common/Top.jsp" %>

<div class="mainBox">
	<div class="left">
		<div class="left-top">
			<div class="border">
				<div class="frame">
					<img class="picture" id="picture" src="../images/${requestScope.product.getProductID()}.jpg"/>
				</div>
			</div>
		</div>
		<div class="left-bottom">
			<div id="specificName" class="nameInfo">${requestScope.product.getProductID()}</div>
			<div id="specificPrice" class="priceInfo">${requestScope.product.getName()}</div>
			<div id="description" class="description">${requestScope.product.getIntroduce()}</div>
		</div>
	</div>

	<div class="right">
		<c:forEach items="${requestScope.product.getItemMap()}" var="item">
			<div class="box">
				<div class="boxLeft">
					<div>
							${item.value.getDescription()}
					</div>
				</div>
				<div class="boxMiddle">
					<div class="ID">${item.key}</div>
					<div class="stock">stock：${item.value.getStock()}</div>
					<span style="padding-left: -120px;padding-top: 140px">$</span>
					<span class="itemPrice">${item.value.getListPrice()}</span>
				</div>
				<div class="boxRight">
					<a class="toCart" href="../Cart/addCartItem?itemID=${item.key}"> Add to cart</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

</body>
</html>

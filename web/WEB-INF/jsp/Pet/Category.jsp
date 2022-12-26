<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/10/23
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Category</title>
	<link rel="stylesheet" type="text/css" href="../css/category.css"/>
</head>
<body>
<%@include file="../Common/Top.jsp" %>
<div class="mainBox">
	<div style="margin-left: 0;margin-right: -10px">
		<h2>${sessionScope.category}</h2>
	</div>
	<div class="center" id="centerContent">
		<c:forEach items="${sessionScope.productMap}" var="product" varStatus="line">
			<div class="smallCate"
			     id=${product.key} onclick="window.location.href='../Pet/petProduct?productID=${product.key}&search=false'">
				<div class="imgBox">
					<img src="../images/${product.key}.jpg">
				</div>
				<div class="productID">
						${product.value.getProductID()}
				</div>
				<div class="briefIntroduction">
					<div class="info">${product.value.getName()}</div>
					<div class="info" style="font-size: 18px;">${product.value.getIntroduce()}</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>

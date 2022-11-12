<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/11/1
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>

<%@include file="../Common/Top.jsp" %>
<div class="Content">
	<table style="text-align: center">
		<tr>
			<th><b>ProductID</b></th>
			<th><b>Name</b></th>
			<th><b>Introduce</b></th>
		</tr>

		<c:forEach items="${requestScope.productMap}" var="product">
			<tr>
				<td><a href="../Pet/petProduct?productID=${product.key}&search=true">${product.key}</a></td>
				<td>${product.value.getName()}</td>
				<td>${product.value.getIntroduce()}</td>
			</tr>
		</c:forEach>
	</table>
</div>


</body>
</html>

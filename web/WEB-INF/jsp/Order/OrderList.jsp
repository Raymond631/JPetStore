<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>OrderList</title>
</head>
<body>
<%@include file="../Common/Top.jsp" %>
<div class="Content">
	<div id="Catalog">
		<h3>My Orders</h3>
		<table style="text-align: center">
			<tr>
				<th>Order ID</th>
				<th>Date</th>
				<th>Total Price</th>
			</tr>
			<c:if test="${requestScope.orderList.isEmpty()}">
				<tr>
					<td colspan="3">You have no order.</td>
				</tr>
			</c:if>
			<c:if test="${!requestScope.orderList.isEmpty()}">
				<c:forEach items="${requestScope.orderList}" var="orderItem">
					<tr>
						<td>
							<a href="../Order/orderItem?orderID=${orderItem.getOrderID()}&newOrder=false">${orderItem.getOrderID()}</a>
						</td>
						<td>${orderItem.getOrderTime()}</td>
						<td>${orderItem.getTotalPrice()}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</div>
</body>
</html>

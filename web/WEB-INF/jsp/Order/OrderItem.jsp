<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>OrderView</title>
</head>
<body>

<%@include file="../Common/Top.jsp" %>

<div class="Content">

	<c:if test="${requestScope.newOrder}">
		<div id="MessageBar">
			<p>Thank you, your order has been submitted.</p>
		</div>
	</c:if>

	<div id="CenterForm">

		<h3>Order</h3>
		<table>
			<colgroup>
				<col style="width: 25%"/>
				<col/>
			</colgroup>
			<tr>
				<td>Order No.</td>
				<td>${requestScope.order.getOrderID()}</td>
			</tr>
			<tr>
				<td>Order Time</td>
				<td>${requestScope.order.getOrderTime()}</td>
			</tr>
			<tr>
				<td>Pay Tiem</td>
				<td>${requestScope.order.getPayTime()}</td>
			</tr>
			<tr>
				<td>Pay Method</td>
				<td>${requestScope.order.getPayMethod()}</td>
			</tr>
		</table>

		<h3>Shipping Address</h3>
		<table>
			<colgroup>
				<col style="width: 25%;"/>
				<col/>
			</colgroup>
			<tr>
				<td>Receiver Name:</td>
				<td>${requestScope.order.getReceiver().getReceiverName()}</td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td>${requestScope.order.getReceiver().getPhoneNumber()}</td>
			</tr>
			<tr>
				<td>Receiver Address:</td>
				<td>${requestScope.order.getReceiver().getCountry()} ${requestScope.order.getReceiver().getProvince()} ${requestScope.order.getReceiver().getCity()} ${requestScope.order.getReceiver().getDistrict()} ${requestScope.order.getReceiver().getDetailedAddress()}</td>
			</tr>
		</table>

		<h3>Ordering Products</h3>
		<table style="text-align: center">
			<tr>
				<th><b>Item ID</b></th>
				<th><b>Product ID</b></th>
				<th><b>Description</b></th>
				<th><b>Stock on OrderTime</b></th>
				<th><b>Quantity</b></th>
				<th><b>List Price</b></th>
				<th><b>Total Cost</b></th>
			</tr>
			<c:forEach items="${requestScope.order.getCartItemList()}" var="cartItem">
				<tr>
					<td>${cartItem.itemID}</td>
					<td>${cartItem.productID}</td>
					<td style="text-align: left">${cartItem.description}</td>
					<td>${cartItem.stock}</td>
					<td>${cartItem.quantity}</td>
					<td>$${cartItem.listPrice}</td>
					<td>$${(cartItem.listPrice)*(cartItem.quantity)}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"></td>
				<td><strong>Sub Total:</strong></td>
				<td><strong>$${requestScope.order.getTotalPrice()}</strong></td>
			</tr>
		</table>

		<div class="button-bar">
			<button type="button" class="button"
			        onclick="location.href='../Order/deleteOrder?orderID=${requestScope.order.getOrderID()}'">Delete
				Order
			</button>
		</div>
	</div>
</div>

</body>
</html>

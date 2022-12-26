<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>OrderForm</title>
</head>
<body>
<%@include file="../Common/Top.jsp" %>
<div class="Content">
	<div id="CenterForm">
		<form method="post" action="../Order/orderPay">
			<h3>Shipping Address</h3>
			<table>
				<colgroup>
					<col style="width: 25%"/>
					<col/>
				</colgroup>
				<tr>
					<td>Receiver Name:</td>
					<td>
						<input type="text" name="Name" value="${requestScope.receiver.receiverName}"/>
						<span class="error-msg"></span>
					</td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input type="text" name="Phone" value="${requestScope.receiver.phoneNumber}"/>
						<span class="error-msg"></span></td>
				</tr>
				<tr>
					<td>Country:</td>
					<td>
						<input type="text" name="Country" value="${requestScope.receiver.country}"/>
						<span class="error-msg"></span>
					</td>
				</tr>
				<tr>
					<td>Province:</td>
					<td>
						<input type="text" name="Province" value="${requestScope.receiver.province}"/>
						<span class="error-msg"></span>
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td>
						<input type="text" name="City" value="${requestScope.receiver.city}"/>
						<span class="error-msg"></span>
					</td>
				</tr>
				<tr>
					<td>District:</td>
					<td>
						<input type="text" name="District" value="${requestScope.receiver.district}"/>
						<span class="error-msg"></span>
					</td>
				</tr>
				<tr>
					<td>Detailed Address:</td>
					<td>
						<input type="text" name="Address" value="${requestScope.receiver.detailedAddress}"/>
						<span class="error-msg"></span>
					</td>
				</tr>
			</table>
			<h3>Ordering Products</h3>
			<table style="text-align: center">
				<tr>
					<th><b>Item ID</b></th>
					<th><b>Product ID</b></th>
					<th><b>Description</b></th>
					<th><b>Stock</b></th>
					<th><b>Quantity</b></th>
					<th><b>List Price</b></th>
					<th><b>Total Cost</b></th>
				</tr>
				<c:forEach items="${sessionScope.cartItemList}" var="cartItem">
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
					<td><strong>$${sessionScope.allCost}</strong></td>
				</tr>
			</table>
			<div class="button-bar">
				<button type="submit" class="button">Submit</button>
				<button type="button" class="button" onclick="location.href='../Cart/cartList';">Cancel</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>购物车</title>
</head>
<body>

<%@include file="../Common/Top.jsp" %>

<div class="Content">

	<div id="Catalog">
		<div id="Cart">
			<h3>Shopping Cart</h3>

			<form method="post" action="../Cart/updateCart">
				<table style="text-align: center">
					<tr>
						<th><b>Item ID</b></th>
						<th><b>Product ID</b></th>
						<th><b>Description</b></th>
						<th><b>Stock</b></th>
						<th><b>Quantity</b></th>
						<th><b>List Price</b></th>
						<th><b>Total Cost</b></th>
						<th>&nbsp;</th>
					</tr>

					<c:if test="${sessionScope.cartItemList.isEmpty()}">
						<tr>
							<td colspan="8">Your cart is empty.</td>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td></td>
							<td><strong>Sub Total:</strong></td>
							<td><strong>$0.00</strong></td>
							<td></td>
						</tr>
					</c:if>
					<c:if test="${!sessionScope.cartItemList.isEmpty()}">
						<c:forEach items="${sessionScope.cartItemList}" var="cartItem">
							<tr>
								<td>${cartItem.itemID}</td>
								<td>${cartItem.productID}</td>
								<td>${cartItem.description}</td>
								<td>${cartItem.stock}</td>
								<td><input type="number" name="${cartItem.itemID}" size="3" maxlength="3" value="${cartItem.quantity}"/></td>
								<td>$${cartItem.listPrice}</td>
								<td>$${(cartItem.listPrice)*(cartItem.quantity)}</td>
								<td><a class="button" href="../Cart/removeCartItem?itemID=${cartItem.itemID}">Remove</a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4"></td>
							<td>
								<button class="button" type="submit">Update Cart</button>
							</td>
							<td><strong>Sub Total:</strong></td>
							<td><strong>$${sessionScope.allCost}</strong></td>
							<td><a class="button" href="../Cart/removeCartItem?itemID=0">Remove All</a></td>
						</tr>
					</c:if>

				</table>
			</form>

			<c:if test="${!sessionScope.cartItemList.isEmpty()}">
				<a class="button" href="../Order/orderSubmit">Proceed to Checkout</a>
			</c:if>
		</div>

		<div id="Separator">&nbsp;</div>
	</div>
</div>

</body>
</html>
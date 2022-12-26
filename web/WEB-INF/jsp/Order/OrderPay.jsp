<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
	<title>OrderConfirm</title>
	<link rel="stylesheet" type="text/css" href="../css/pay.css">
</head>
<body>
<%@include file="../Common/Top.jsp" %>
<div class="Content">
	<div id="MessageBar">
		<p>Please confirm the information below and then press "Pay"...</p>
	</div>
	<div id="CenterForm">
		<h3>Shipping Address</h3>
		<table>
			<colgroup>
				<col style="width: 25%;"/>
				<col/>
			</colgroup>
			<tr>
				<td>Receiver Name:</td>
				<td>${sessionScope.receiver.receiverName}</td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td>${sessionScope.receiver.phoneNumber}</td>
			</tr>
			<tr>
				<td>Receiver Address:</td>
				<td>${sessionScope.receiver.country} ${sessionScope.receiver.province} ${sessionScope.receiver.city} ${sessionScope.receiver.district} ${sessionScope.receiver.detailedAddress}</td>
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
		<h3>Order Details</h3>
		<form id="PayForm" method="post" action="../Order/newOrder">
			<table>
				<colgroup>
					<col style="width: 25%"/>
					<col/>
				</colgroup>
				<tr>
					<td>Order Time</td>
					<td>
						<%
							Date date = new Date();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String OrderTime = sdf.format(date);
							out.println(OrderTime);
							session.setAttribute("OrderTime", OrderTime);
						%>
					</td>
				</tr>
				<tr>
					<td>Payment Method:</td>
					<td>
						<select id="Payment" name="payMethod">
							<option value="Alipay" selected>Alipay</option>
							<option value="WeChatPay">WeChatPay</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<div class="button-bar">
			<%--打开弹窗--%>
			<button class="button" id="pay"> Pay</button>
			<%--返回订单提交页面--%>
			<button class="button" onclick="location.href='../Order/orderSubmit'">Back</button>
		</div>
		<%--弹窗--%>
		<div class="modal">
			<div class="modal-content">
				<div class="modal-body">
					<div class="mb_revise">模拟支付</div>
					<img id="Pic" src="../images/Alipay.jpg" width="300"/>
					<div>
						<%--跳往下一个界面--%>
						<button class="determine">Success</button>
						<%--关闭弹窗--%>
						<button class="cancel">Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../js/pay.js"></script>
	</div>
</div>
</body>
</html>

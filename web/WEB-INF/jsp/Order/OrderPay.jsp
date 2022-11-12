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

		<script>
            var Pic;

            //打开弹窗
            var button = document.getElementById("pay");
            button.onclick = function ()
            {
                var modal = document.querySelector(".modal");
                modal.style.display = "block";
                WhichPay();
            }

            //支付成功
            var determine = document.querySelector(".determine");
            determine.onclick = function ()
            {
                document.getElementById("PayForm").submit();
            }

            //取消支付
            var cancel = document.querySelector(".cancel");
            cancel.onclick = function ()
            {
                var modal = document.querySelector(".modal");
                modal.style.display = "none";
            }

            function WhichPay()
            {
                var myselect = document.getElementById("Payment");
                var index = myselect.selectedIndex; // selectedIndex代表的是你所选中项的index
                var name = myselect.options[index].value;
                if (name == "Alipay")
                {
                    document.getElementById('Pic').src = "../images/Alipay.jpg";
                } else
                {
                    document.getElementById('Pic').src = "../images/WeChatPay.png";
                }
            }
		</script>

	</div>
</div>

</body>
</html>

<style>
    /* 遮罩层 */
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    /* 弹窗 */
    .modal-content {
        position: fixed;
        top: 15%;
        left: 50%;
        margin-left: -25%;
        width: 25%;
        height: 70%;
        min-width: 31.125rem;
        min-height: 18.625rem;
        border-radius: .125rem;
        background-color: white;
        z-index: 2;
    }

    .modal-body {
        position: relative;
        width: 100%;
        height: 100%;
    }

    .mb_revise {
        padding: .625rem 0 0 1.5625rem;
    }

    .mb_revise > p {
        padding-left: .25rem;
        margin-top: .125rem;
        font-family: 'FangSong', Times, serif;
        font-size: 15px;
        border-left: solid .125rem royalblue;
    }

    /* 确定和取消 */
    .determine,
    .cancel {
        position: absolute;
        width: 4.125rem;
        height: 2.1875rem;
        color: #fff;
        border: 0;
        outline: none;
        box-shadow: 0 .125rem .125rem rgb(107, 96, 96);
        cursor: pointer;
    }

    .determine {
        right: 6.5rem;
        bottom: .725rem;
        background-color: rgba(9, 139, 245, 0.788);
    }

    .cancel {
        right: 2rem;
        bottom: .725rem;
        background-color: rgba(212, 37, 37, 0.788);
    }

    .determine:hover,
    .cancel:hover {
        color: #fff;
        box-shadow: 0 .134rem .1275rem rgb(58, 57, 57);
    }

    .determine:active,
    .cancel:active {
        box-shadow: 0 .134rem .1275rem rgba(230, 227, 227, .758);
    }
</style>

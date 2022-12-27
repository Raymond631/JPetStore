<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/selfCenter.css"/>
	<link rel="stylesheet" type="text/css" href="../css/ChangePassword.css">
	<script type="text/javascript" src="../js/SelfCenter.js"></script>
</head>
<body>
<%@ include file="../Common/Top.jsp" %>
<div class="mainBox">
	<div class="left">
		<h3>User Information</h3>
		<div class="left-top">
			<div class="info">
				<div class="userName">
					<span>Name:</span>
					<span style="padding-left: 40px">${sessionScope.user.getUsername()}</span>
				</div>
			</div>
			<%--打开弹窗--%>
			<div class="changePassword">
				<button class="button" style="margin-left: -40px;margin-right: 10px" id="changePassword" onclick="Change();">change Password</button>
			</div>
		</div>
		<%--弹窗--%>
		<div class="modal">
			<div class="modal-content">
				<div class="modal-body">
					<div>
						<div class="inChange">
							Original Password:<input class="inChangeInput" type="password" name="newPassword" value="" id="origin" autocomplete="off"/><span class="error-msg" id="originFalse"></span>
						</div>
						<div class="inChange">
							New Password:<input class="inChangeInput" type="password" name="originalPassword" value="" id="newPassword" autocomplete="off"/>
						</div>
						<div class="inChange">
							Confirm New Password:<input class="inChangeInput" type="password" name="originalPassword" value="" id="confirmNewPassword" autocomplete="off"/>
						</div>
						<%--跳往下一个界面--%>
						<button class="determine" onclick="savePassword()">Save</button>
						<%--关闭弹窗--%>
						<button class="cancel" onclick="cancel()">Cancel</button>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../js/ChangePassword.js"></script>
		<h3>Profile Information</h3>
		<div class="left-bottom">
			<form action="../User/updateProfile" method="post" autocomplete="off">
				<div class="frontProfile">Language Preference:</div>
				<div class="profileInformation">
					<select class="selectBox" name="languagePreference">
						<option value="English" selected>English</option>
						<option value="German">German</option>
						<option value="French">French</option>
						<option value="Korean">Korean</option>
						<option value="Japanese">Japanese</option>
					</select>
				</div>
				<div class="frontProfile">Favourite Category:</div>
				<div class="profileInformation">
					<select class="selectBox" name="favouriteCategoryId">
						<option value="FISH">Fish</option>
						<option value="DOGS" selected>Dogs</option>
						<option value="REPTILES">Reptiles</option>
						<option value="CATS">Cats</option>
						<option value="BIRDS">Birds</option>
					</select>
				</div>
				<div class="frontProfile">Enable<br>MyList:</div>
				<div class="profileInformation">
					<input class="checkBox" type="checkbox" name="listOption" value="true"/>
				</div>
				<div class="frontProfile">Enable MyBanner:</div>
				<div class="profileInformation">
					<input class="checkBox" type="checkbox" name="bannerOption" value="true" checked/>
				</div>
				<button type="submit" class="saveProfile">Save Profile</button>
			</form>
		</div>
	</div>
	<div class="right">
		<h3>Account Information</h3>
		<form action="../User/updateReceiver" method="post" name="AccountForm" autocomplete="off">
			<div class="account">
				<div class="frontAccount">ReceiverName:</div>
				<div class="accountInformation">
					<input class="backInput" id="receiverInfo" type="text" name="receiverName"
					       value="${sessionScope.user.receiver.getReceiverName()}"/>
					<span class="error-msg" id="receiverNull"></span>
				</div>
				<div class="frontAccount">Email:</div>
				<div class="accountInformation">
					<input class="backInput" id="emailInfo" type="text" size="40" name="email"
					       value="${sessionScope.user.receiver.getEmail()}"/>
					<span class="error-msg" id="emailNull"></span>
				</div>
				<div class="frontAccount">Phone:</div>
				<div class="accountInformation">
					<input class="backInput" id="phoneInfo" type="text" name="phone"
					       value="${sessionScope.user.receiver.getPhoneNumber()}"/>
					<span class="error-msg" id="phoneNull"></span>
				</div>
				<div class="frontAccount">Country:</div>
				<div class="accountInformation">
					<input class="backInput" id="countryInfo" type="text" size="40" name="country"
					       value="${sessionScope.user.receiver.getCountry()}"/>
					<span class="error-msg" id="countryNull"></span>
				</div>
				<div class="frontAccount">Province:</div>
				<div class="accountInformation">
					<input class="backInput" id="provinceInfo" type="text" size="40" name="province"
					       value="${sessionScope.user.receiver.getProvince()}"/>
					<span class="error-msg" id="provinceNull"></span>
				</div>
				<div class="frontAccount">City:</div>
				<div class="accountInformation">
					<input class="backInput" id="cityInfo" type="text" name="city"
					       value="${sessionScope.user.receiver.getCity()}"/>
					<span class="error-msg" id="cityNull"></span>
				</div>
				<div class="frontAccount">district:</div>
				<div class="accountInformation">
					<input class="backInput" id="districtInfo" type="text" size="4" name="district"
					       value="${sessionScope.user.receiver.getDistrict()}"/>
					<span class="error-msg" id="districtNull"></span>
				</div>
				<div class="frontAccount">DetailedAddress:</div>
				<div class="accountInformation">
					<input class="backInput" id="detailedAddressInfo" type="text" size="10" name="detailedAddress"
					       value="${sessionScope.user.receiver.getDetailedAddress()}"/>
					<span class="error-msg" id="detailedAddressNull"></span>
				</div>
				<input class="saveAccount" type="submit" value="Save Account" onclick="return AccountCheck();">
			</div>
		</form>
	</div>
</div>
</body>
</html>
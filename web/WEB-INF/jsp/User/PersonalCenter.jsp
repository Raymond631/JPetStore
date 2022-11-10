<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script>
        function AccountCheck() {
            var whetherFull = true;
            var receiver = document.getElementById("receiverInfo");
            if (receiver.value.trim() == "") {//没有输入用户名是显示提示
                console.log("receiverIn");
                var findNodes = document.getElementById("receiverNull");
                findNodes.innerText = "Receiver can not be null";
                whetherFull = false;
            } else {//输入了内容后清除节点内容
                document.getElementById("receiverNull").textContent = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var email = document.getElementById("emailInfo");
            if (email.value.trim() == "") {
                var findNodes2 = document.getElementById("emailNull");
                findNodes2.innerText = "Email can not be null";
                whetherFull = false;
            } else {
                document.getElementById("emailNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var phone = document.getElementById("phoneInfo");
            if (phone.value.trim() == "") {
                var findNodes3 = document.getElementById("phoneNull");
                findNodes3.innerText = "Phone can not be null";
                whetherFull = false;
            } else {
                document.getElementById("phoneNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var country = document.getElementById("countryInfo");
            if (country.value.trim() == "") {
                var findNodes4 = document.getElementById("countryNull");
                findNodes4.innerText = "Country can not be null";
                whetherFull = false;
            } else {
                document.getElementById("countryNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var province = document.getElementById("provinceInfo");
            if (province.value.trim() == "") {
                var findNodes5 = document.getElementById("provinceNull");
                findNodes5.innerText = "Province can not be null";
                whetherFull = false;
            } else {
                document.getElementById("provinceNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var city = document.getElementById("cityInfo");
            if (city.value.trim() == "") {
                var findNodes6 = document.getElementById("cityNull");
                findNodes6.innerText = "City can not be null";
                whetherFull = false;
            } else {
                document.getElementById("cityNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var district = document.getElementById("districtInfo");
            if (district.value.trim() == "") {
                var findNodes7 = document.getElementById("districtNull");
                findNodes7.innerText = "District can not be null";
                whetherFull = false;
            } else {
                document.getElementById("districtNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            var detailedAddress = document.getElementById("detailedAddressInfo");
            if (detailedAddress.value.trim() == "") {
                var findNodes8 = document.getElementById("detailedAddressNull");
                findNodes8.innerText = "DetailedAddress can not be null";
                whetherFull = false;
            } else {
                document.getElementById("detailedAddressNull").innerText = "";
                if (whetherFull)
                    whetherFull = true;
            }

            return whetherFull;
        }

        // var button = document.getElementById("changePassword");
        function Change() {
            var modal = document.querySelector(".modal");
            modal.style.display = "block";
        }

        function savePassword() {
            let originWrite = document.getElementById("origin").value;
            let originTrue = "${sessionScope.user.getPassword()}";
            let newPassword = document.getElementById("newPassword").value;
            let confirmNewPassword = document.getElementById("confirmNewPassword").value;
            console.log(originWrite);
            console.log(originTrue);
            console.log(newPassword);
            console.log(confirmNewPassword);
            let originFalse = document.getElementById("originFalse");
            if (originWrite == originTrue) {
                originFalse.innerText = "";
                console.log("ok");
                if (newPassword == confirmNewPassword) {
                    console.log("ajax");
                    const xhr = new XMLHttpRequest();
                    //初始化，设置请求方法和url
                    xhr.open("post", "../User/changePassword", true);
                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    //发送
                    xhr.send(newPassword);
                } else {

                }
            } else {
                originFalse.innerText = "Password is wrong";
            }

        }

        function cancel() {
            var modal = document.querySelector(".modal");
            modal.style.display = "none";
        }

    </script>
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
                    <span style="padding-left: 70px">${sessionScope.user.getUsername()}</span>
                </div>

            </div>
            <%--打开弹窗--%>
            <div class="changePassword">
                <button class="button" id="changePassword" onclick="Change();">change Password</button>
            </div>
        </div>

        <%--弹窗--%>
        <div class="modal">
            <div class="modal-content">
                <div class="modal-body">
                    <div>
                        <div class="inChange">
                            Original Password:<input class="inChangeInput"
                                                     type="password"
                                                     name="newPassword"
                                                     value=""
                                                     id="origin"
                                                     autocomplete="off"/><span class="error-msg"
                                                                               id="originFalse"></span>
                        </div>
                        <div class="inChange">New Password:<input class="inChangeInput"
                                                                  type="password"
                                                                  name="originalPassword"
                                                                  value=""
                                                                  id="newPassword"
                                                                  autocomplete="off"/></div>
                        <div class="inChange">Confirm New Password:<input class="inChangeInput"
                                                                          type="password"
                                                                          name="originalPassword"
                                                                          value=""
                                                                          id="confirmNewPassword"
                                                                          autocomplete="off"/></div>
                        <%--跳往下一个界面--%>
                        <button class="determine" onclick="savePassword()">save password</button>
                        <%--关闭弹窗--%>
                        <button class="cancel" onclick="cancel()">cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <h3>Profile Information</h3>


        <div class="left-bottom">
            <form>
                <div class="frontProfile">Language Preference:</div>
                <div class="profileInformation">
                    <select class="selectBox" name="languagePreference">
                        <option value="english" selected>English</option>
                        <option value="german">German</option>
                        <option value="french">French</option>
                        <option value="korean">Korean</option>
                        <option value="japanese">Japanese</option>
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
                <div class="frontProfile">Enable MyList:</div>
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
        <form action="../User/PersonalCenter" method="post" name="AccountForm">
            <div class="account">
                <div class="frontAccount">ReceiverName:</div>
                <div class="accountInformation">
                    <input class="backInput" id="receiverInfo" type="text" name="receiverName"
                           value="${requestScope.receiver.getReceiverName()}"/>
                    <span class="error-msg" id="receiverNull"></span>
                </div>
                <div class="frontAccount">Email:</div>
                <div class="accountInformation">
                    <input class="backInput" id="emailInfo" type="text" size="40" name="email"
                           value="${requestScope.receiver.getEmail()}"/>
                    <span class="error-msg" id="emailNull"></span>
                </div>
                <div class="frontAccount">Phone:</div>
                <div class="accountInformation">
                    <input class="backInput" id="phoneInfo" type="text" name="phone"
                           value="${requestScope.receiver.getPhoneNumber()}"/>
                    <span class="error-msg" id="phoneNull"></span>
                </div>
                <div class="frontAccount">Country:</div>
                <div class="accountInformation">
                    <input class="backInput" id="countryInfo" type="text" size="40" name="country"
                           value="${requestScope.receiver.getCountry()}"/>
                    <span class="error-msg" id="countryNull"></span>
                </div>
                <div class="frontAccount">Province:</div>
                <div class="accountInformation">
                    <input class="backInput" id="provinceInfo" type="text" size="40" name="province"
                           value="${requestScope.receiver.getProvince()}"/>
                    <span class="error-msg" id="provinceNull"></span>
                </div>
                <div class="frontAccount">City:</div>
                <div class="accountInformation">
                    <input class="backInput" id="cityInfo" type="text" name="city"
                           value="${requestScope.receiver.getCity()}"/>
                    <span class="error-msg" id="cityNull"></span>
                </div>
                <div class="frontAccount">district:</div>
                <div class="accountInformation">
                    <input class="backInput" id="districtInfo" type="text" size="4" name="district"
                           value="${requestScope.receiver.getDistrict()}"/>
                    <span class="error-msg" id="districtNull"></span>
                </div>
                <div class="frontAccount">DetailedAddress:</div>
                <div class="accountInformation">
                    <input class="backInput" id="detailedAddressInfo" type="text" size="10" name="detailedAddress"
                           value="${requestScope.receiver.getDetailedAddress()}"/>
                    <span class="error-msg" id="detailedAddressNull"></span>
                </div>
                <input class="saveAccount" type="submit" value="Save Account" onclick="return AccountCheck();">
            </div>
        </form>


    </div>
</div>


<%@include file="../Common/Bottom.jsp" %>
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
        width: 14%;
        height: 40%;
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
        width: 30%;
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
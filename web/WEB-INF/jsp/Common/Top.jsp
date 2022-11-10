<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Top</title>
    <link rel="stylesheet" type="text/css" href="../css/jpetstore.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="../css/aspectran.css"/>
</head>
<body>

<div id="Header" style="background-color: whitesmoke">

    <div id="Logo">
        <div id="LogoContent">
            <a href="../Pet/homePage"><img src="../images/logo-topbar.gif"/></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="../Cart/cartList"><img align="middle" name="img_cart" src="../images/cart.gif"/></a>
            <img align="middle" src="../images/separator.gif"/>

            <c:if test="${sessionScope.user == null}">
                <a href="../User/showLogin">Sign In</a>
                <img align="middle" src="../images/separator.gif"/>
                <a href="../User/showRegister">Sign Up</a>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <a href="../Order/orderList">My Orders</a>
                <img align="middle" src="../images/separator.gif"/>
                <a href="../User/personalCenter">My Account</a>
                <img align="middle" src="../images/separator.gif"/>
                <a href="../User/signOut">Sign Out</a>
            </c:if>

            <img align="middle" src="../images/separator.gif"/>
            <a href="../help.html">?</a>
        </div>
    </div>

    <div id="Search" data-hide-for="large">
        <div id="SearchContent">

            <form action="../Pet/searchPet">
                <div class="input-group">
                    <input class="input-group-field" type="text" name="keyword" placeholder="Product Search">
                    <div class="input-group-button">
                        <button type="submit" class="button">Search</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

    <div id="QuickLinks">
        <a href="../Pet/petList?category=fish">Fish</a>
        <a href="../Pet/petList?category=dogs">Dogs</a>
        <a href="../Pet/petList?category=reptiles">Reptiles</a>
        <a href="../Pet/petList?category=cats">Cats</a>
        <a href="../Pet/petList?category=birds">Birds</a>
    </div>
</div>

</body>
</html>

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
	<link rel="stylesheet" type="text/css" href="../css/top.css"/>
	<link rel="stylesheet" type="text/css" href="../css/NavigationBar.css">
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script src="../js/Search.js"></script>
</head>
<body>
<div class="header">
	<div class="logo">
		<div class="logoName">
			<h1 class="gradient-text">Jpetstore</h1>
		</div>
	</div>
	<div class="top-cover">
		<form action="../Pet/searchPet" method="post" name="searchForm" id="searchForm" autocomplete="off">
			<div class="tb">
				<div class="td">
					<input type="text" name="keyword" id="keyword" placeholder="Product Search" required>
				</div>
				<div class="td" id="s-cover">
					<button type="submit">
						<div id="s-circle"></div>
						<span></span>
					</button>
				</div>
			</div>
		</form>
		<div id="productAutoComplete">
			<ul id="productAutoList"></ul>
		</div>
	</div>
	<div class="top-right">
		<a href="../Cart/cartList">
			<img align="middle" name="img_cart" src="../images/shopping.png"/>
		</a>
		<c:if test="${sessionScope.user == null}">
			<a href="../User/showLogin">
				<img align="middle" name="img_cart" src="../images/login.png"/>
			</a>
			<a href="../User/showRegister">
				<img align="middle" name="img_cart" src="../images/register.png"/>
			</a>
		</c:if>
		<c:if test="${sessionScope.user != null}">
			<a href="../Order/orderList">
				<img align="middle" name="img_cart" src="../images/order.png"/>
			</a>
			<a href="../User/personalCenter">
				<img align="middle" name="img_cart" src="../images/self.png"/>
			</a>
			<a href="../User/signOut">
				<img align="middle" name="img_cart" src="../images/logout.png"/>
			</a>
		</c:if>
	</div>
</div>

<nav id="navbar" style="z-index: 9999">
	<ul class="navbar-items flexbox-col">
		<li class="navbar-logo flexbox-left">
			<a class="navbar-item-inner flexbox" href="../Pet/homePage">
				<span style="font-size: 20px">Home</span>
			</a>
		</li>
		<li class="navbar-item flexbox-left">
			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=fish">
				<div class="navbar-item-inner-icon-wrapper flexbox">
					<ion-icon name="search-outline">Fish</ion-icon>
				</div>
				<span class="link-text">Saltwater, Freshwater</span>
			</a>
		</li>
		<li class="navbar-item flexbox-left">
			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=dogs">
				<div class="navbar-item-inner-icon-wrapper flexbox">
					<ion-icon name="home-outline">Dogs</ion-icon>
				</div>
				<span class="link-text">Various Breeds</span>
			</a>
		</li>
		<li class="navbar-item flexbox-left">
			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=reptiles">
				<div class="navbar-item-inner-icon-wrapper flexbox">
					<ion-icon name="folder-open-outline">Reptiles</ion-icon>
				</div>
				<span class="link-text"> Lizards, Turtles, Snakes</span>
			</a>
		</li>
		<li class="navbar-item flexbox-left">
			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=cats">
				<div class="navbar-item-inner-icon-wrapper flexbox">
					<ion-icon name="pie-chart-outline">Cats</ion-icon>
				</div>
				<span class="link-text">Various Breeds, Exotic Varieties</span>
			</a>
		</li>
		<li class="navbar-item flexbox-left">
			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=birds">
				<div class="navbar-item-inner-icon-wrapper flexbox">
					<ion-icon name="people-outline">Birds</ion-icon>
				</div>
				<span class="link-text"> Exotic Varieties</span>
			</a>
		</li>
	</ul>
</nav>
</body>
</html>

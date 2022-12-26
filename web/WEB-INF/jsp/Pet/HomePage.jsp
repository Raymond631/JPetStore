<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>主页</title>
	<link rel="stylesheet" type="text/css" href="../css/HomePage.css">
</head>
<body>
<%@ include file="../Common/Top.jsp" %>
<div class="Content" style="margin-left: 21%">
	<div class="Main">
		<div class="layout">
			<ul>
				<li><a href="../Pet/petList?category=fish">
					<img style="width: 100%;height: 100%; background-size: cover;" src="../images/fish.jpg">
				</a></li>
				<li><a href="../Pet/petList?category=dogs">
					<img style="width: 100%;height: 100%; background-size: cover;" src="../images/dogs.jpg">
				</a></li>
				<li><a href="../Pet/petList?category=reptiles">
					<img style="width: 100%;height: 100%; background-size: cover;" src="../images/reptiles.jpg">
				</a></li>
				<li><a href="../Pet/petList?category=cats">
					<img style="width: 100%;height: 100%; background-size: cover;" src="../images/cats.jpg">
				</a></li>
				<li><a href="../Pet/petList?category=birds">
					<img style="width: 100%;height: 100%; background-size: cover;" src="../images/birds.jpg">
				</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
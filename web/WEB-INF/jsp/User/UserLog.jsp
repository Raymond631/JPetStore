<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/11/5
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>用户日志</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/userLog.css"/>
</head>

<body>
<div class="mainBox">
	<div class="top">
		<div class="topLeft">
			<div>
				<span>USER LOGS</span>
				<span style="margin-left: 800px"></span>
				<span><a href="../User/signOut">Return to HomePage</a></span>
			</div>
		</div>
	</div>
	<div class="bottom">
		<div class="container" style=" overflow-y:auto; overflow-x:auto; height:625px;">
			<table id="example" class="table table-hover responsive nowrap" style="width:99%;overflow-y: scroll">
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>Time</th>
					<th>IP</th>
					<th>URL</th>
					<th>SqlType</th>
					<th>OperationContent</th>
					<th>Status</th>
				</tr>
				<%
					int id = 1;
				%>
				<c:forEach items="${requestScope.userLogList}" var="userLog">
					<tr>
						<td>
							<%
								out.println("#" + id);
								id++;
							%>
						</td>
						<td>${userLog.getUsername()}</td>
						<td>${userLog.getTime()}</td>
						<td>${userLog.getIp()}</td>
						<td>${userLog.getUrl()}</td>
						<td>${userLog.getSqlType()}</td>
						<td>${userLog.getOperationContent()}</td>
						<td>${userLog.getStatus()}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>

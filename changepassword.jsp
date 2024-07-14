<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<%@ page import="com.member.model.*"%>
<%
Member member = (Member) request.getAttribute("member");
%>
<html>
<head>
<meta charset="BIG5">
<title>更改密碼</title>
<style>
* {
	box-sizing: border-box;
}

.header {
	background-color: rgb(253, 192, 1);
	width: 100%;
	height: 100px;
	font-size: 300%;
}

.chugether {
	width: 20%;
	margin-top: 0;
	margin-bottom: 0;
	margin-left: 40%;
}

.title {
	width: 20%;
	margin-left: 40%;
}

div {
	font-style: bold;
}


</style>
</head>
<body>
<div class="header">
		<div>
			<p class="chugether">Chugether</p>
		</div>
	</div>
	<div>
		<div class="title">
			<p>首頁|會員登入|重新設定密碼</p>
			<h1>重新設定密碼</h1>
		</div>
	</div>
	<h2>帳號:${member.getAccount}</h2>
	<form method="post" action="member.do">
		<input type="text" name="account" placeholder="">
		<input type="text" name="password" placeholder="新密碼"> 
		<input type="text" name="passwordCheck" placeholder="確認密碼"> 
		<input type="hidden" name="action" value="change_password"> 
		<input type="submit" value="確認">
	</form>
	<div>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</body>
</html>
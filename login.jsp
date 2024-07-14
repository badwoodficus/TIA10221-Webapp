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
<title>會員登入</title>
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

h1 {
	color: rgb(77, 57, 0);
}

.board {
	color: rgb(77, 57, 0);
	border-color: rgb(253, 192, 1);
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
			<p>首頁|會員登入</p>
			<h1>會員登入</h1>
		</div>
	</div>
	<div class="board"
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<form method="POST" action="member.do">
			<p>Account 會員帳號</p>
			<p>規則:包含英數字混和8~16字</p>
			<input type="text" placeholder="toeat123" name="account" />
			<p>Password 會員密碼</p>
			<p>規則：包含英數字混和6~10個字</p>
			<input type="text" placeholder="請輸入密碼" name="password" />

			<div style="clear: both; text-align: center; margin-top: 20px">
				<input type="hidden" name="action" value="find_by_login"> <input
					type="submit" value="登入">
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
//見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
Member member = (Member) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>會員註冊</title>
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

div.board div.left, div.board div.right {
	display: inline-block;
}

div.board div.left {
	width: 50%;
	padding: 10px;
	height: 600px;
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
			<p>首頁|加入會員</p>
			<h1>填寫會員資料</h1>
		</div>
	</div>
	<div class="board">
		<form method="POST" action="member.do">
			<div id="left" style="float: left; width: 50%">
				<p>Account 會員帳號</p>
				<p>規則:包含英數字混和8~16字</p>
				<input type="text" placeholder="toeat123" name="account"
					value='<%=(member == null) ? "toeat123" : member.getAccount()%>' />
				<p>Password 會員密碼</p>
				<p>規則：包含英數字混和6~10個字</p>
				<input type="text" placeholder="請輸入密碼" name="password"
					value='<%=(member == null) ? "pass123" : member.getPassword()%>' />
				<p>Password 會員密碼確認</p>
				<p>請再次輸入密碼</p>
				<input type="text" placeholder="請再次輸入密碼" name="passwordCheck"
					value='<%=(member == null) ? "pass123" : member.getPassword()%>' />
			</div>

			<div id="right" style="float: right; width: 50%">
				<p>請輸入用戶名稱</p>
				<p>規則:不能空白且只能是中、英文字母, 且長度必需在2到10之間</p>
				<input type="text" placeholder="用於跟餐廳訂位" name="name"
					value='<%=(member == null) ? "老鴿" : member.getName()%>' />
				<p>
					<label for="bbnb">請選擇性別</label> <select id="gender" name="gender">
						<option value="0">男</option>
						<option value="1">女</option>
					</select>
				</p>
				<p>請輸入手機號碼</p>
				<p>請輸入正確手機格式09開頭且共十個數字</p>
				<input type="text" placeholder="請輸入十位數字" name="mobileNo"
					value='<%=(member == null) ? "" : member.getMobileNo()%>' />
				<p>E-Mail 電子信箱</p>
				<p>請輸入正確的電子信箱</p>
				<input type="text" placeholder="接收確認信件的信箱地址" name="email"
					value='<%=(member == null) ? "" : member.getEmail()%>' />
			</div>

			<div style="clear: both; text-align: center; margin-top: 20px">
				<input type="hidden" name="action" value="register"> <input
					type="submit" value="註冊會員">
			</div>
		</form>
	</div>
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
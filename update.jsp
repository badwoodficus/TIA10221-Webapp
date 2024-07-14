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
<title>更新資料</title>
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
			<p>首頁|修改資料</p>
			<h1>修改會員資料</h1>
		</div>
		<div class="board">
			<form method="POST" action="member.do">

				<div
					style="display: flex; justify-content: center; align-items: center; height: 100vh;">
					<p>Account 會員帳號</p>
					<p>規則:包含英數字混和8~16字</p>
					<input type="text" placeholder="toeat123" name="account"
						value='<%=(member == null) ? "toeat123" : member.getAccount()%>' />
					<p>請輸入用戶名稱</p>
					<p>規則:不能空白且只能是中、英文字母, 且長度必需在2到10之間</p>
					<input type="text" placeholder="用於跟餐廳訂位" name="name"
						value='<%=(member == null) ? "老鴿" : member.getName()%>' />
					<p>
						<label >請選擇性別</label> <select name="gender">
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
					<input type="hidden" name="action" value="update"> <input
						type="submit" value="註冊會員">
				</div>
			</form>
		</div>
	</div>
	<div></div>

</body>
</html>
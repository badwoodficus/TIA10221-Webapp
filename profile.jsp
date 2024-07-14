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
<title>個人檔案</title>
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
			<p>首頁|個人資料</p>
			<h1>查看個人資料</h1>
		</div>
	</div>
	<div
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<div style="border: 1px solid #000; padding: 20px; width: 400px">
		    <img src="<%=request.getContextPath()%>/DBGifReader4?account=${member.account}" width="100" height="100">
			<h2>會員資料</h2>
			<p>會員帳號:${member.getAccount()}</p>
			<p>會員密碼:${member.getPassword()}</p>
			<p>會員名稱: ${member.getName()}</p>
			<p>會員手機號碼: ${member.getMobileNo()}</p>
			<p>電子信箱: ${member.getEmail()}</p>
			<p>性別:${member.getGender()}</p>
			<p>註冊日期: ${member.getRegisDate()}</p>
			<p>帳號狀態: ${member.getStatus()}</p>
			<a href="changepassword.jsp">更新密碼</a>
			<a href="update.jsp">更新基本資料</a>
		</div>
	</div>
</body>
</html>
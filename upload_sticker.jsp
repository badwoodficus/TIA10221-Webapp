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
<title>�W�Ǥj�Y�K</title>
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
			<p>����|�W�Ǥj�Y�K</p>
			<h1>�W�Ǥj�Y�K</h1>
		</div>
	</div>
	<div
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<div style="border: 1px solid #000; padding: 20px; width: 300px">
			<FORM action="member.do" method=post
				enctype="multipart/form-data">
				<p>Account �|���b��</p>
				<p>test�ϥαb��:eat12345</p>
				<input type="text" placeholder="eat12345" name="account"
					value='<%=(member == null) ? "eat12345" : member.getAccount()%>' />
				<input type="file" name="sticker"> <br> <input
					type="hidden" name="action" value="change_sticker"> <INPUT
					type="submit" value="�W�Ǥj�Y�K">
			</FORM>

		</div>
	</div>


</body>
</html>
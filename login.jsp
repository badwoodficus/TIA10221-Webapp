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
<title>�|���n�J</title>
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
			<p>����|�|���n�J</p>
			<h1>�|���n�J</h1>
		</div>
	</div>
	<div class="board"
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<form method="POST" action="member.do">
			<p>Account �|���b��</p>
			<p>�W�h:�]�t�^�Ʀr�V�M8~16�r</p>
			<input type="text" placeholder="toeat123" name="account" />
			<p>Password �|���K�X</p>
			<p>�W�h�G�]�t�^�Ʀr�V�M6~10�Ӧr</p>
			<input type="text" placeholder="�п�J�K�X" name="password" />

			<div style="clear: both; text-align: center; margin-top: 20px">
				<input type="hidden" name="action" value="find_by_login"> <input
					type="submit" value="�n�J">
			</div>
		</form>
	</div>
</body>
</html>
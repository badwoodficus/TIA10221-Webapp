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
<title>����</title>
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
			<p>����|���ҫH�c</p>
			<h1>���ҫH�c</h1>
		</div>
		<div class="board">
			<form method="POST" action="member.do">

				<div
					style="display: flex; justify-content: center; align-items: center; height: 100vh;">
					<p>Validity ���ҽX</p>
					<br>
					<p>�W�h:�]�t�^�Ʀr�V�M6�Ӧr</p>
					<input type="text" placeholder="WHO123" name="captcha"
						value='<%=(member == null) ? "" : member.getCaptcha()%>' />
						<div style="clear: both; text-align: center; margin-top: 20px">
					<input type="hidden" name="action" value="validity"> <input
						type="submit" value="����">
				</div>
				</div>
				
				
			</form>
		</div>
	</div>
</body>
</html>
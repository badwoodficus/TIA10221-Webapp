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
<title>�ӤH�ɮ�</title>
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
			<p>����|�ӤH���</p>
			<h1>�d�ݭӤH���</h1>
		</div>
	</div>
	<div
		style="display: flex; justify-content: center; align-items: center; height: 100vh;">
		<div style="border: 1px solid #000; padding: 20px; width: 400px">
		    <img src="<%=request.getContextPath()%>/DBGifReader4?account=${member.account}" width="100" height="100">
			<h2>�|�����</h2>
			<p>�|���b��:${member.getAccount()}</p>
			<p>�|���K�X:${member.getPassword()}</p>
			<p>�|���W��: ${member.getName()}</p>
			<p>�|��������X: ${member.getMobileNo()}</p>
			<p>�q�l�H�c: ${member.getEmail()}</p>
			<p>�ʧO:${member.getGender()}</p>
			<p>���U���: ${member.getRegisDate()}</p>
			<p>�b�����A: ${member.getStatus()}</p>
			<a href="changepassword.jsp">��s�K�X</a>
			<a href="update.jsp">��s�򥻸��</a>
		</div>
	</div>
</body>
</html>
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
<title>���K�X</title>
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
			<p>����|�|���n�J|���s�]�w�K�X</p>
			<h1>���s�]�w�K�X</h1>
		</div>
	</div>
	<h2>�b��:${member.getAccount}</h2>
	<form method="post" action="member.do">
		<input type="text" name="account" placeholder="">
		<input type="text" name="password" placeholder="�s�K�X"> 
		<input type="text" name="passwordCheck" placeholder="�T�{�K�X"> 
		<input type="hidden" name="action" value="change_password"> 
		<input type="submit" value="�T�{">
	</form>
	<div>
		<%-- ���~��C --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">�Эץ��H�U���~:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<%@ page import="com.member.model.*" %>
<%
	Member member = (Member) request.getAttribute("member");
%>
<html>
<head>
<meta charset="BIG5">
<title>���U���\</title>
</head>
<body>
	<img src="images/congratulations.png">
	<h1>�w��${member.getName()}�[�JCheugether</h1>
	<br>
	<br>
	<img src="images/congratulations2.png">
	<h3>�аO�����ҽX${member.getCaptcha()}</h3>
	<h3>�ϥ����ҽX�ӱҰʱb��</h3>
	<a href="/profile">�d�ݭӤH���</a>
	<jsp:forward page="profile.jsp">
		<jsp:param name="account" value="<%= member.getAccount()%>"/>
		<jsp:param name="password" value="<%= member.getPassword()%>"/>
		<jsp:param name="name" value="<%= member.getName()%>"/>
		<jsp:param name="mobileNo" value="<%= member.getMobileNo()%>"/>
		<jsp:param name="email" value="<%= member.getEmail()%>"/>
		<jsp:param name="gender" value="<%= member.getGender()%>"/>
		<jsp:param name="regis_date" value="<%= member.getRegisDate()%>"/>
		<jsp:param name="status" value="<%= member.getStatus() %>"/>
	</jsp:forward>
</body>
</html>
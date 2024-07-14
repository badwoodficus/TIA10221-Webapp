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
<title>註冊成功</title>
</head>
<body>
	<img src="images/congratulations.png">
	<h1>歡迎${member.getName()}加入Cheugether</h1>
	<br>
	<br>
	<img src="images/congratulations2.png">
	<h3>請記住驗證碼${member.getCaptcha()}</h3>
	<h3>使用驗證碼來啟動帳號</h3>
	<a href="/profile">查看個人資料</a>
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
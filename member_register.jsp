<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
//��com.emp.controller.EmpServlet.java��238��s�Jreq��empVO���� (������J�榡�����~�ɪ�empVO����)
Member member = (Member) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�|�����U</title>
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
			<p>����|�[�J�|��</p>
			<h1>��g�|�����</h1>
		</div>
	</div>
	<div class="board">
		<form method="POST" action="member.do">
			<div id="left" style="float: left; width: 50%">
				<p>Account �|���b��</p>
				<p>�W�h:�]�t�^�Ʀr�V�M8~16�r</p>
				<input type="text" placeholder="toeat123" name="account"
					value='<%=(member == null) ? "toeat123" : member.getAccount()%>' />
				<p>Password �|���K�X</p>
				<p>�W�h�G�]�t�^�Ʀr�V�M6~10�Ӧr</p>
				<input type="text" placeholder="�п�J�K�X" name="password"
					value='<%=(member == null) ? "pass123" : member.getPassword()%>' />
				<p>Password �|���K�X�T�{</p>
				<p>�ЦA����J�K�X</p>
				<input type="text" placeholder="�ЦA����J�K�X" name="passwordCheck"
					value='<%=(member == null) ? "pass123" : member.getPassword()%>' />
			</div>

			<div id="right" style="float: right; width: 50%">
				<p>�п�J�Τ�W��</p>
				<p>�W�h:����ťեB�u��O���B�^��r��, �B���ץ��ݦb2��10����</p>
				<input type="text" placeholder="�Ω���\�U�q��" name="name"
					value='<%=(member == null) ? "���F" : member.getName()%>' />
				<p>
					<label for="bbnb">�п�ܩʧO</label> <select id="gender" name="gender">
						<option value="0">�k</option>
						<option value="1">�k</option>
					</select>
				</p>
				<p>�п�J������X</p>
				<p>�п�J���T����榡09�}�Y�B�@�Q�ӼƦr</p>
				<input type="text" placeholder="�п�J�Q��Ʀr" name="mobileNo"
					value='<%=(member == null) ? "" : member.getMobileNo()%>' />
				<p>E-Mail �q�l�H�c</p>
				<p>�п�J���T���q�l�H�c</p>
				<input type="text" placeholder="�����T�{�H�󪺫H�c�a�}" name="email"
					value='<%=(member == null) ? "" : member.getEmail()%>' />
			</div>

			<div style="clear: both; text-align: center; margin-top: 20px">
				<input type="hidden" name="action" value="register"> <input
					type="submit" value="���U�|��">
			</div>
		</form>
	</div>
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
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
<title>��s���</title>
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
			<p>����|�ק���</p>
			<h1>�ק�|�����</h1>
		</div>
		<div class="board">
			<form method="POST" action="member.do">

				<div
					style="display: flex; justify-content: center; align-items: center; height: 100vh;">
					<p>Account �|���b��</p>
					<p>�W�h:�]�t�^�Ʀr�V�M8~16�r</p>
					<input type="text" placeholder="toeat123" name="account"
						value='<%=(member == null) ? "toeat123" : member.getAccount()%>' />
					<p>�п�J�Τ�W��</p>
					<p>�W�h:����ťեB�u��O���B�^��r��, �B���ץ��ݦb2��10����</p>
					<input type="text" placeholder="�Ω���\�U�q��" name="name"
						value='<%=(member == null) ? "���F" : member.getName()%>' />
					<p>
						<label >�п�ܩʧO</label> <select name="gender">
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
					<input type="hidden" name="action" value="update"> <input
						type="submit" value="���U�|��">
				</div>
			</form>
		</div>
	</div>
	<div></div>

</body>
</html>
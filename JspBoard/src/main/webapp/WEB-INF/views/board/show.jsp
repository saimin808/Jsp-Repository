<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù�</title>
<style>
form {
	display: inline;
}

input.submitLink {
	background-color: transparent;
    text-decoration: underline;
    color: blue;
    border: none;
    cursor: pointer;
}
</style>
</head>
<body>

	<h3>�Խù� ����</h3>

	<div id="board" class="container">
			<div id="board_id">
				<b>No:</b> ${board.board_id}
			</div>
			<div id="title">
				<b>����:</b> ${board.title}
			</div>
			<div id="type">
				<b>����:</b> ${board.type}
			</div>
			<div id="writer">
				<b>�ۼ���:</b> ${board.writer}
			</div>
			<div id="content">
				<textarea cols="50" rows="10" readonly>${board.content}</textarea>
			</div>
			<div id="date">
				<b>�� ��¥:</b> ${board.write_date}
			</div>
			<div id="views">
				<b>��ȸ��:</b> ${board.view}
			</div>
			<form method="POST" name="form">
				<div id="recommend">
					<b>��õ:</b> ${board.recommand}
					<button type="submit" onclick="javascript: form.action='./recommend'">��õ</button>
				</div>
				<div id="not_recommand">
					<b>����õ:</b> ${board.not_recommand}
					<button type="submit" onclick="javascript: form.action='./not_recommend'">����õ</button>
				</div>
			</form>
		<div id="buttons">
			<button onclick="location.href='./list?page=1'">�� ���</button>
			<form action="./pw_check" method="GET" id="modify">
				<input type="hidden" form="modify" value="${board.board_id}" name="board_id" />
				<input type="hidden" form="modify" value="modify" name="msg"/>
				<input type="submit" form="modify" value="����"/>
			</form>
			<form action="./pw_check" method="GET" id="delete">
				<input type="hidden" form="delete" value="${board.board_id}" name="board_id" />
				<input type="hidden" form="delete" value="delete" name="msg"/>
				<input type="submit" form="delete" value="����"/>
			</form>
		</div>
	</div>
	
	<br>
	
	<jsp:include page="../comment/comment.jsp"/>
	
	<script>
		if("<%=request.getParameter("delete")%>" == 'complete') {
			alert("��� ���� ����");	
		} else if("<%=request.getParameter("delete")%>" == 'fail') {
			alert("��� ���� ����");
		} else if("<%=request.getParameter("modify")%>" == 'complete') {
			alert("��� ���� �Ϸ�");
		} else if ("<%=request.getParameter("modify")%>" == 'fail') {
			alert("��� ���� ����");
		}
	</script>
</body>
</html>
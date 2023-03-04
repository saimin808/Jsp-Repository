<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ Ȯ��</title>
</head>
<body>

	<h3>��й�ȣ Ȯ��</h3>

	<c:choose>
		<c:when test="${msg eq 'modify'}">	
			<div>�����ϱ� ���� ��й�ȣ�� �Է��ϼ���</div>
			<form action="./modify" method="POST">
				<div>
					<input type="hidden" name="board_id" value="${board.board_id}"/>
					<input type="password" name="pw"/>
					<input type="submit" value="�Է�"/>
				</div>
			</form>
		</c:when>
		<c:when test="${msg eq 'delete'}">
			<div>�����ϱ� ���� ��й�ȣ�� �Է��ϼ���</div>
			<form action="./delete" method="POST">
				<div>
					<input type="hidden" name="board_id" value="${board.board_id}"/>
					<input type="password" name="pw"/>
					<input type="submit" value="�Է�"/>
				</div>
			</form>
		</c:when>
	</c:choose>
	<div id="pw_check"></div>
	
	<script>
		const pw_check = document.getElementById("pw_check");
		if("<%=request.getParameter("pw_check")%>" == "fail") {
			pw_check.innerHTML += "�߸��� ��й�ȣ�Դϴ�.";
		}
	</script>
</body>
</html>
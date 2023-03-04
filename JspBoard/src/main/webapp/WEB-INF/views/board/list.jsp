<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:url value="/assets/css/button.css" var="btnCSS"/>
<meta charset="EUC-KR">
<title>Board</title>
<link rel="stylesheet" href="${btnCSS}"/>
</head>
<body>

	<h1>�Խ���</h1>

	<table id="board" border='3'>
		<tr>
			<th>No</th>
			<th>����</th>
			<th>����</th>
			<th>�۾���</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>View</th>
			<th>��õ</th>
			<th>����õ</th>
		</tr>
			<!-- c:forEach ��� -->
			<c:forEach items="${boards}" var="board">
				<tr>
					<td>
						${board.board_id}
					</td>
					<td>
						<a>${board.title}</a>
					</td>
					<td>
						${board.type}
					</td>
					<td>
						<a>${board.writer}</a>
					</td>
					<td>
						<a href="./show?board_id=${board.board_id}">${board.content}</a>
					</td>
					<td>
						${board.creationDateTime} <!-- ���ð� �ð�����.. ���� ������ ��¥�� -->
					</td>
					<td>
						${board.view}
					</td>
					<td>
						${board.recommand}
					</td>
					<td>
						${board.not_recommand}
					</td>					
				</tr>
			</c:forEach>
	</table>
	
	<div><a href="">&lt;&nbsp;</a>
		<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i">
			<a href="./list?page=${i}">${i}</a>
		</c:forEach>
	<a href="">&nbsp;&gt;</a>&nbsp;<a class="btn" href="./write">�۾���</a></div>
	
	<script>
		if("<%=request.getParameter("delete")%>" == 'complete') {
			alert("�Խñ� ���� ����");	
		} else if("<%=request.getParameter("delete")%>" == 'fail') {
			alert("�Խñ� ���� ����");
		} else if("<%=request.getParameter("modify")%>" == 'complete') {
			alert("�Խñ� ���� �Ϸ�");
		} else if ("<%=request.getParameter("modify")%>" == 'fail') {
			alert("�Խñ� ���� ����");
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>modify</title>
</head>
<body>

	<h3>�� ����</h3>
	
	<div id="container">
		<form action="./modify/modify" method="POST" id="modify">
			<div id="board_id">
				<b>�� ��ȣ: <input type="text" name="board_id" value="${board.board_id}" readonly/></b>
			</div>
			<div id="title">
				<!-- �� ����: ����ڰ� ���� -->
				<b>����:</b> <input type="text" name="title" value="${board.title}" />
			</div>
			<div id="type">
				<b>����:</b> <select name="type" onselect="${board.type}">
					<option value="������">������</option>
					<option value="��������">��������</option>
					<option value="�����λ�">�����λ�</option>
				</select>
			</div>
			<div id="writer">
				<!-- �ۼ���: ����ڰ� ���� �� ���� (�α��� �� ����ڴ� ������ ä����) -->
				<b>�ۼ���:</b> <input type="text" name="writer" value="${board.writer}"/>
			</div>
			<div id="content">
				<!-- �� ����: ����ڰ� ���� -->
				<textarea rows="30" cols="100" name="content">${board.content}</textarea>
			</div>
			<div id="pw">
				<!-- ��й�ȣ: ����ڰ� ���� �� �� ���� (�α��� �� ����ڴ� ��й�ȣ ���¶��� �Ⱥ���) -->
				<b>��й�ȣ:</b> <input type="password" name="pw"/>
			</div>
			<div id="write_date">
				<b>�ۼ���:</b> <input type="text" name="write_date" value="${board.write_date}" readonly/>
			</div>
			<input type="submit" value="�����ϱ�">
		</form>
	</div>

	<script src="<%=request.getContextPath()%>/assets/script/modify_form.js"></script>
</body>
</html>
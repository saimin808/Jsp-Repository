<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Write</title>
</head>
<body>

	<ul>
		<li>�� ��ȣ: ����ڰ� ���°� �ƴ� (�������� ����)</li>
		<li>�ۼ���: ����ڰ� ���� �� ���� (�α��� �� ����ڴ� ������ ä����)</li>
		<li>��й�ȣ: ����ڰ� ���� �� �� ���� (�α��� �� ����ڴ� ��й�ȣ ���¶��� �Ⱥ���)</li>
		<li>�� ����: ����ڰ� ����</li>
		<li>�� ����: ����ڰ� ����</li>
		<li>�� �ۼ� �ð�: ����ڰ� ���°� �ƴ� (DB�� sysdate�� �����)</li>
		<li>��ȸ �� : ��밡 ���°� �ƴ�</li>
		<li>��õ �� : x</li>
		<li>���� �� : x</li>
	</ul>

	<h3>�Խñ� �ۼ�</h3>

	<div id="container">
		<form action="./write/write" method="POST" id="write">
			<div id="board_id">
				<b>�� ��ȣ: <input type="text" name="id" value="${board_id}" readonly/></b>
			</div>
			<div id="title">
				<!-- �� ����: ����ڰ� ���� -->
				<b>����:</b> <input type="text" name="title" />
			</div>
			<div id="type">
				<b>����:</b> <select name="type">
					<option value="������">������</option>
					<option value="��������">��������</option>
					<option value="�����λ�">�����λ�</option>
				</select>
			</div>
			<div id="writer">
				<!-- �ۼ���: ����ڰ� ���� �� ���� (�α��� �� ����ڴ� ������ ä����) -->
				<b>�ۼ���:</b> <input type="text" name="writer"/>
			</div>
			<div id="content">
				<!-- �� ����: ����ڰ� ���� -->
				<textarea rows="30" cols="100" name="content"></textarea>
			</div>
			<div id="pw">
				<!-- ��й�ȣ: ����ڰ� ���� �� �� ���� (�α��� �� ����ڴ� ��й�ȣ ���¶��� �Ⱥ���) -->
				<b>��й�ȣ:</b> <input type="password" name="pw" />
			</div>
			<input type="submit" value="����">
		</form>
	</div>
	
	<script src="<%=request.getContextPath()%>/assets/script/write_form.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//Service(����Ͻ� ����)���� �Ƿ��Դٰ� ����
	request.setAttribute("address","����� �������� ���ǵ��� ...");
	pageContext.setAttribute("address", "������");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>Top.jsp���� �ۼ��� Ÿ��Ʋ</title>
</head>
<body>

	<table border="1">
		<tr>
			<th><a href="./main.jsp">Ȩ</a></th>
			<th><a href="./menu.jsp">�޴�</a></th>
			<th><a href="./navi.jsp">ã�ƿ��� ��</a></th>
			<th><a href="./chains.jsp">ü����</a></th>
			<th><a href="./sitemap.jsp">����Ʈ��</a></th>
		</tr>
		<tr>
			<th>
				<ul>
					<li>side menu1</li>
					<li>side menu2</li>
					<li>side menu3</li>
					<li>side menu4</li>
					<li>side menu5</li>
				</ul>
			</th>
			<th  colspan="4">
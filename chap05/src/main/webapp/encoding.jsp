<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ڵ� ����</title>
</head>
<body>

	<h3># JSP�� �������� charset ����</h3>
	
	<dl>
		<dt>1. meta �±��� charset</dt> <!-- 4 -->
		<dd>Ŭ���̾�Ʈ�� �� �������� �ش� �������� �ؼ��� �� ����� charset</dd>
		<dt>2. contentType�� charset</dt> <!-- 3 -->
		<dd>�� �������� ������ ���� ������� charset</dd>
		<dt>3. pageEncoding�� charset</dt> <!-- 2 -->
		<dd>.jsp�� .java�� 1�� ������ ���� charset</dd>
		<dt>4. ���� �� ���������� Eclipse�� ����ϰ� �ִ� charset</dt> <!-- 1 -->
		<dd>
			�츮�� �ϵ� ��ũ�� ������ ��(Ctrl + S�� ���� ��) ����� ���ڵ� Ÿ�� <br>
			�� ���� ��Ŭ�� �� Properties > Resource > Text file Encoding���� Ȯ�� ����
		</dd>
	</dl>
	
	<h3>#�������� �ѱ� ������ ������ (GET ���)</h3>
	
	<p>
		GET��� �Ķ���� ���� URI���� �ؼ��Ǳ� ������ ���� ������ �ٲ���� ��
	</p>
	
	<form action="/chap05/encodingTest" method="GET">
		<input type="hidden" value="��ġ����" name="samgim"/>
		<input type="hidden" value="��纣��������" name="smoothie"/>
		<input type="submit" value="������"/>
	</form>
	
	<h3># �������� �ѱ� ������ ������ (POST ���)</h3>
	
	<p>
		POST��� �Ķ���� ���� ��û ��ü ���ο� �Ƿ����Ƿ�
		��û ��ü�� ���ڵ� Ÿ���� �����ؾ� �Ѵ�.
	</p>
	
	<form action="/chap05/encodingTest" method="POST">
		<input type="hidden" value="������Ұ��" name="samgim"/>
		<input type="hidden" value="���⽺����" name="smoothie"/>
		<input type="submit" value="������"/>
	</form>
	
	<!-- web.xml�� ������ ���� /encodingTest�� ������ ��û�� ���
		EncodingServlet���� ���ν��Ѻ����� -->

</body>
</html>
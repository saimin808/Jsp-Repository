<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>What if forward?</title>
</head>
<body>

	<h3># Forward</h3>
	
	<ul>
		<li>
			����ڰ� ���� ��û�� �ش� �������� ó���ϴٰ�
			�ٸ� �������� �����Ͽ� �߰��� ó���� �̾���� ��
		</li>
		<li>
			����ڰ� ���� ��û ��ü�� �״�� �����ϱ� ������
			��û�� �Ƿ��ִ� ������(�Ķ���͵�)�� �Բ� �״�� ���޵ȴ�.
		</li>
	</ul>
	
	<h3># Redirect</h3>
	
	<ul>
		<li>
			��û�� ���� ����ڰ� �ٸ� �ּҷ� �ٽ� ��û�ϵ��� ����� ��
		</li>
		<li>
			�����̷�Ʈ ������ ���� Ŭ���̾�Ʈ�� �� ����������
			���ο� ��û�� ����� ������ ������
			���� ��û�� �Ƿ��ִ� ������ �������� �ʴ�
		</li>
	</ul>
	
	<hr>
	
	<a href="/chap03/forward?hobby=eat&favorite=icecream">Forward</a> <br>
	
	<a href="/chap03/redirect?hobby=eat&favorite=icecream">Redirect</a> <br>

	<hr>
	
	<h3># forward�� �뵵</h3>
	
	<ul>
		<li>
			������ �ڹ� �ڵ带 �ۼ��ϱ⿡ ���ϰ�
			JSP�� html �ڵ带 �ۼ��ϱ⿡ ���ϴ�
		</li>
		<li>
			1���� �������� �ڹٷ� ó���� ��� ��ģ ��
			forward�� ���� 2���� html �ڵ带 �����ϴ� ����� ������ ���� ����Ѵ�.
		</li>
		<li>
			�̰��� view(.jsp)�� control(.java)�� �и���� �θ���.
		</li>
	</ul>
	
	<h3># redirect�� �뵵</h3>
	
	<ul>
		<li>����ڰ� ��û�� �Բ� �Ǿ�� �������� ���ΰ�ħ���� ������� ���ϵ��� ���� �뵵</li>
		<li>	ex> ����ڰ� ���� �� �Ŀ� ���ΰ�ħ���� ���� ���� ��� ��ϵǴ� ���� ����</li>
	</ul>
</body>
</html>
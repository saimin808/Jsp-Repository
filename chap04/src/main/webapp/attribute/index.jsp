<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Attribute Index</title>
</head>
<body>

	<h3># Attribute</h3>
	
	<ul>
		<li>
			Parameter�� Ŭ���̾�Ʈ���� form���� �Բ� �Ѿ���� �����Ϳ��ٸ�
			Attribute�� �������� Ȱ���ϱ� ���� �����ڰ� ����س��� ���̴�
		</li>
		<li>
			�� ��Ʈ����Ʈ �������� ��ȿ�� ����(Scope)�� �ٸ��� �뵵�� �°� Ȱ���ؾ� �Ѵ�.
			(application, session, request, page)
		</li>
	</ul>
	
	<h3># Attribute Scopes</h3>
	
	<dl>
		<dt>page scope</dt>
		<dd>
			�ش� JSP������ ���ο����� ����� �� �ִ� ��Ʈ����Ʈ.
			page scope�� ����� attribute��
			�ٸ� ������ forward�� �ص� ������� �ȴ�.
		</dd>
		<dt>request scope</dt>
		<dd>
			�ϳ��� ��û�� ����� ������ �����Ǵ� ��Ʈ����Ʈ.
			forward �Ǵ� include������ �����ȴ�.
		</dd>
		<dt>session scope</dt>
		<dd>
			������ ����� ������ ������ �����Ǵ� ��Ʈ����Ʈ.
			����ڰ� ������ ó�� �����ϸ� �����κ��� ���� ���̵� �ο��޴´�.
			�� ����ID�� ������ ��(Unique)�̸� Ŭ���̾�Ʈ ������ ������ �� �ִ� ������ ������ �ȴ�.
			������ ������ �ð��� �����ų� (���� ����Ʈ) �� �������� �����ϸ� ����ȴ�.
		</dd>
		<dt>application scope</dt>
		<dd>
			�� ���ø����̼� ������ �����س��� attribute.
			������ ���� ����Ǹ� ������ ����� ������ �����ȴ�.
			Session ��ü�� ������ �� ��ŭ ���������� ������ 1���̹Ƿ� ���� ������� �� �� �ִ�.
		</dd>
	</dl>
	
	<hr>

	<h3>Attribute Test</h3>
	
	<button id="test1">JSP���� ��Ʈ����Ʈ ����ϰ� �������ϱ�</button>
	<button id="test2">�������� ��Ʈ����Ʈ ����ϰ� �������ϱ�</button>
	
	<script>
		const test1 = document.getElementById("test1");
		const test2 = document.getElementById("test2");
		
		test1.addEventListener('click', () => {
			location.href = '/chap04/attribute/process.jsp';
		});
		
		test2.addEventListener('click', () => {
			location.href = '/chap04/test2';
		});
	</script>

</body>
</html>
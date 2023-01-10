<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Form</title>
</head>
<body>

	<h3># form �±�</h3>
	
	<ul>
		<li>������ ��û�� ������ �����͸� �Բ� ������ ���� �±�</li>
		<li>
			form �±� ������ input �±׵��� ����
			����ڰ� ������ ���� ������ ���� �� �ִ�.
		</li>
		<li>�����͸� key-value ������� �Ǿ� ������.</li>
		<li>input �±��� name �Ӽ��� key ������ �Ѵ�.</li>
		<li>input �±��� value �Ӽ��� value ������ �Ѵ�.</li>
		<li>GET��İ� POST��� �� ���ϴ� ����� ������ �� �ִ�.</li>
	</ul>
	
	<ul>
		<li>�ּҰ� �ڿ� �����͸� �Բ� �Ǿ� ������.</li>
		<li>�ּ�?key=value&key=value ...</li>
		<li>�ּ�â�� URL�� ���� �Է��ϰų�,
			��ũ�� Ŭ���ϴ� ����� �⺻������ GET����̴�.</li>
	</ul>
	
	<a href="http://localhost:9000/chap02/test1?hobby=sleeping&coffee=latte">
		��ũ�� ������ ���� ������
	</a>
	
	<!--
		action: � �ּҷ� ��û�� ���� ���ΰ�
		method: � ������� ��û�� ���ΰ�
	-->
	<form action="http://localhost:9000/chap02/test1" method="GET">
		���: <input type="text" name="hobby" value="movie"/> <br>
		����Ƽ: <input type="text" name="boba" value="taro"/> <br>
		Ŀ��: <input type="text" name="coffee" value="latte"/> <br>
		<input type="submit" value="OK!!"/>
	</form>
	
	<h3># Post ��� ��û</h3>
	
	<ul>
		<li>URL�� ���� �Է��ϰų� ��ũ�� ���� ������ �� ����. (form �Ǵ� javascript)</li>
		<li>
			�ּ� �ڿ� �Բ� �Ƿ����� ����� �ƴ϶� ������ ������ �ʴ� ���·� ���޵ȴ�.
			(��Ŷ�� ����� ��� ������ �� ���� �ִ�.)
		</li>
		<li>request ��ü�� body��� �ʵ忡 �Ƿ��� ���۵ȴ�.</li>
		<li>��й�ȣ ���� �͵��� GET ������� ������ �� ���̱� ������
			POST ����� �̿��ؾ� �Ѵ�.</li>
	</ul>
	
	<!--
		�� �󿡼� ����θ� �� ���� ���� URL�� ���������� �ľ��ؾ� �Ѵ�.
		
		���� URL�� /chap02/form/index.jsp �� ��
		
		./�� /chap02/form/ �� �ǹ��Ѵ�.
		../�� /chap02/ �� �ǹ��Ѵ�.
	-->
	<form action="../test1" method="POST">
		<input type="hidden" name="hobby" value="drink">
		<input type="hidden" name="boba" value="pearl">
		<input type="hidden" name="coffee" value="espresso">
		<input type="submit" value="Send!">
	</form> 
	
	<form action="./ReceiveFormDataJsp.jsp" method="POST">
		<input type="hidden" name="hobby" value="games">
		<input type="hidden" name="boba" value="pearl">
		<input type="hidden" name="coffee" value="espresso">
		<input type="submit" value="Send!">
	</form>
	
	<hr>
	
	<h3># ��ĺ��� �ٸ��� ó���ϱ� (Servlet)</h3>
	
	<ul>
		<li>���������� ��û ��ĺ��� �ٸ��� ó���� �� �ִ� ����� �����Ѵ�.</li>
		<li>service(): ��� ��û�� ó���Ѵ�.</li>
		<li>doGet(): Get��� ��û�� ó���Ѵ�.</li>
		<li>doPost(): Post��� ��û�� ó���Ѵ�.</li>
	</ul>
	
	<a href="/chap02/test2?name=john">GET��� ��û ������ (TEST2)</a>
	
	<form id="myform" action="/chap02/test2" method="POST"></form>
	
	<!-- form �ٱ��� �ִ� input�� form�Ӽ��� �����ϸ� �Ҽ����� ���� �� �ִ�. -->
	<input type="text" form="myform" name="name" value="mike">
	<input type="submit" form="myform" value="Submit(Test2)">

</body>
</html>
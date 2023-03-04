<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	public String getCookieValue(Cookie[] cookies, String cookieName) { 
    	for (Cookie cookie : cookies) { 
         if(cookie.getName().equals(cookieName)){ 
              return cookie.getValue(); 
         	}
    	}
    	return ""; 
	}
%>

<%
	Cookie[] cookies = request.getCookies();
	String user_id = getCookieValue(cookies, "user_id"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login == null}">
			<form action="./submit" method="POST">
				���̵� <input type="text" name="id" value="<%=user_id%>"/> <br>
				��й�ȣ <input type="password" name="pw"/> <br>
				<input type="submit" value="�α���"/>
				���̵� ����ϱ� <input type="checkbox" name="remember" value="rem"/>
			</form>
		</c:when>
		<c:otherwise>
			<h3>�̹� �α��� �Ǿ����ϴ�.</h3>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<ul>
		<li>�α����� �õ��ϸ� �α��� ��� �������� �Ѿ��.</li>
		<li>
			�α��ο� ������ ���,
			������ ���� �������� �α��� �������� �̹� �α��� �Ǿ����ϴ�. ��� ������ �Ѵ�.
		</li>
		<li>
			���̵� ����ϱ⸦ üũ�� ���·�
			�ش� ���̵�� �α����� ������ ���
			���� ���� �� ������ �α��� �������� �ٽ� ���͵� 30�ϰ���
			���̵� ������ �Է� �Ǿ��ֵ��� ��������
		</li>
		<li>DB ����� �� (ȸ�������� insert�� �� ��)</li>
	</ul>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ���</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login == 'yes'}">
			<h1>�α��� ����~!</h1>
		</c:when>
		<c:otherwise>
			<h1>�α��� �����Դϴ�.</h1>
		</c:otherwise>
	</c:choose>
	
	3�ʵ� ���ư��ϴ�
	<script>
		setTimeout("location.href='<%=request.getContextPath()%>/login/login.jsp'", 3000);
	</script>
</body>
</html>
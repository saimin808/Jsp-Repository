<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 결과</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.login == 'yes'}">
			<h1>로그인 성공~!</h1>
		</c:when>
		<c:otherwise>
			<h1>로그인 실패입니다.</h1>
		</c:otherwise>
	</c:choose>
	
	3초뒤 돌아갑니다
	<script>
		setTimeout("location.href='<%=request.getContextPath()%>/login/login.jsp'", 3000);
	</script>
</body>
</html>
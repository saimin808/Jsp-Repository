<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//request에는 항상 현재 경로에서 사용할 수 있는 쿠키값이 포함되어있다.
	
	// 사용할 수 있는 모든 쿠키를 열어보기
	Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쿠키 사용해보기</title>
</head>
<body>

	<h3>현재 이 경로에서 사용할 수 있는 모든 쿠키 목록</h3>

	<% for (Cookie cookie : cookies) { %>
		<div><%=cookie.getName() %>=<%=cookie.getValue() %></div>	
	<%	} %>

</body>
</html>
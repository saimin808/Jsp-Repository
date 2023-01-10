<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// JSP도 서블릿이기 때문에 데이터를 받을 수 있다.
	String hobby = request.getParameter("hobby");
	String boba = request.getParameter("boba");
	String coffee = request.getParameter("coffee");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Form Data</title>
</head>
<body>

	<h1>Success!</h1>
	
	<div>hobby: <%=hobby %></div>
	<div>boba: <%=boba %></div>
	<div>coffee: <%=coffee %></div>

</body>
</html>
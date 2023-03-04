<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%
	List<String> employees = (List<String>)request.getAttribute("employees");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hello.jsp</title>
</head>
<body>

	<h1>Hello~! ${name}</h1>
	
	<table border="1">
		<%
			for (String row : employees) {
				out.print(row);
			}
		%>
	</table>

</body>
</html>
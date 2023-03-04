<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터 받아서 출력해보기</title>
</head>
<body>

	<h3>결과!</h3>

	삼각김밥 : <%=request.getParameter("samgim") %> <br>
	스무디 : <%= request.getParameter("smoothie") %>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//Service(비즈니스 로직)에서 실려왔다고 가정
	request.setAttribute("address","서울시 영등포구 여의도동 ...");
	pageContext.setAttribute("address", "도봉구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>Top.jsp에서 작성한 타이틀</title>
</head>
<body>

	<table border="1">
		<tr>
			<th><a href="./main.jsp">홈</a></th>
			<th><a href="./menu.jsp">메뉴</a></th>
			<th><a href="./navi.jsp">찾아오는 길</a></th>
			<th><a href="./chains.jsp">체인점</a></th>
			<th><a href="./sitemap.jsp">사이트맵</a></th>
		</tr>
		<tr>
			<th>
				<ul>
					<li>side menu1</li>
					<li>side menu2</li>
					<li>side menu3</li>
					<li>side menu4</li>
					<li>side menu5</li>
				</ul>
			</th>
			<th  colspan="4">
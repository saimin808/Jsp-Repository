<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("address", "종로구");
	pageContext.setAttribute("address","도봉구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>this is main...</title>
<%@ include file="/file_include/header.jspf" %>
</head>
<body>

<%@ include file="/file_include/top.jspf" %>
	
<h1 style="font-family: 'Lobster', cursive; font-size: 3rem;">main.jsp</h1>

<div class="fa-3x">
  <i class="fa-brands fa-discord fa-spin"></i>

  <i class="fa-brands fa-discord fa-flip"></i>

  <i class="fa-brands fa-discord fa-bounce"></i>

  <i class="fa-brands fa-discord fa-bounce"></i>

  <i class="fa-brands fa-discord fa-flip fa-flip-reverse"></i>

  <i class="fa-brands fa-solid fa-discord fa-spin fa-spin-reverse"></i>

</div>


<%@ include file="/file_include/bottom.jspf" %>
</body>
</html>
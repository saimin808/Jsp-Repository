<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모든 주문 내역 보기</title>
</head>
<body>

	<h3># 모든 주문 내역</h3>
	
	<table border="2">
		<c:forEach items="${pastOrders}" var="pastOrder">
			<tr>
				<td>${pastOrder.name}</td>
				<td>${pastOrder.address}</td>
				<td>${pastOrder.crust}</td>
				<td>${pastOrder.size}</td>
				<td>${pastOrder.toppings}</td>
				<td>${pastOrder.instructions}</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="/chap07/pizza">return to index</a>

</body>
</html>
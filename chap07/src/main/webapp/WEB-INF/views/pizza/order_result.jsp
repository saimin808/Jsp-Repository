<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="chap07.dto.PizzaOrder" %>
<%
	Object o1 = request.getAttribute("pastOrders");
	List<String> pastOrders = null;
	if(o1 instanceof List) {
		pastOrders = (List)o1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Pizza Order List</title>
</head>
<body>

	<h3>주문한 사람: ${customerName}</h3>
	
	<table>
	<%
		if (pastOrders != null && pastOrders.size() != 0) {
			for(String pastOrder : pastOrders) {
				out.print(pastOrder);
			}
		} else {
			out.print("<tr><th>주문 내역이 없습니다.</th></tr>");
		}
	%>
	</table>
	
	<a href="/chap07/pizza">return to index</a>
	
	<p>POST방식으로 파라미터를 전송하고 난 후 새로고침을 막아야 한다...(리다이렉트 필요)</p>
	
	<p>뒤로가기도 막아야 하는데 뒤로가기를 막기 위해서는 자바스크립트의 history 객체를 조작해야 한다.</p>

	<%-- <div id="order_summary">
		<div class="header">
			<h1>Order Summary</h1>
		</div>
<% for(int i = 0; i < pizza_orders.size(); i++) { %>
		<div id="deliver_to">
			<h3>Deliver to</h3>
			<div id="address">
				<div><%= pizza_orders.get(i).getName() %></div>
				<div><%= pizza_orders.get(i).getStreet_address()%></div>
			</div>
		</div>
		<div id="order">
			<h3>Order</h3>
			<div id="order_information">
				<div><b>Crust</b>: <%= pizza_orders.get(i).getCrust()%></div>
				<div><b>Size</b>: <%= pizza_orders.get(i).getSize()%></div>
				<div><b>Topping(1)</b>: <%= pizza_orders.get(i).getTopping1()%></div>
				<div><b>Instructions</b>: <%= pizza_orders.get(i).getInstructions()%></div>
			</div>
		</div>
<%} %>
	</div> --%>
</body>
</html>
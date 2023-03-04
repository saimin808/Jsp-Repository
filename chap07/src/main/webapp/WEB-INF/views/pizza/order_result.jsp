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

	<h3>�ֹ��� ���: ${customerName}</h3>
	
	<table>
	<%
		if (pastOrders != null && pastOrders.size() != 0) {
			for(String pastOrder : pastOrders) {
				out.print(pastOrder);
			}
		} else {
			out.print("<tr><th>�ֹ� ������ �����ϴ�.</th></tr>");
		}
	%>
	</table>
	
	<a href="/chap07/pizza">return to index</a>
	
	<p>POST������� �Ķ���͸� �����ϰ� �� �� ���ΰ�ħ�� ���ƾ� �Ѵ�...(�����̷�Ʈ �ʿ�)</p>
	
	<p>�ڷΰ��⵵ ���ƾ� �ϴµ� �ڷΰ��⸦ ���� ���ؼ��� �ڹٽ�ũ��Ʈ�� history ��ü�� �����ؾ� �Ѵ�.</p>

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
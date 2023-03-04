<%@page import="chap02.GetOrderSummary"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Pizza Order Form</title>
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: RGB(255, 255, 240);
	width: 40%;
}

h1 {
	text-align: center;
}

.container {
	background-color: RGB(237, 201, 175);
	width: 100%;
}

.information {
	height: 165px;
	padding-top: 0.05px;
}

.order {
	height: 380px;
	padding-top: 0.05px;
}

h3 {
	margin: 10px;
}

.information > dd {
	margin-left: 20px;
	line-height: 15px;
}

#name {
	margin-left: 80px;
}

#name, #street, #email {
	width: 300px;
}

#street {
	margin-left: 18px;
}

#city {
	margin-left: 95px;
}

#email {
	margin-left: 84px;
}

#phone {
	margin-left: 76px;
}

#crust > h4 {
	margin-top: 1px;
	margin-left: 5px;
}

</style>
</head>
<body>
	<form id="summary" action="../summary" method="POST">
			<h1>Pizza Order Form</h1>
				<dl class="container information">
					<dt><h3>Delivery Information</h3></dt>
					<dd>
						Name <input id="name" type="text" name="name">
					</dd>
					<dd>
						Street Address <input id="street" type="text" name="street_address">
					</dd>
					<dd>
						City <input id="city" type="text" name="city">
					</dd>
					<dd>
						Email <input id="email" type="text" name="email">
					</dd>
					<dd>
						Phone <input id="phone" type="text" name="phone">
					</dd>
				</dl>
			<dl class="container order">
				<dt><h3>Order</h3></dt>
				<dd id="crust">
					<h4>Crust</h4>
					<input type="radio" name="crust" value="thin_crust">Thin Crust
					<input type="radio" name="crust" value="deep_dish">Deep Dish
				</dd>
				<dd id="size">
					<h4>Size</h4>
					<select name="size" size="1">
						<option value="small">Small</option>
						<option value="medium">Medium</option>
						<option value="large">Large</option>
					</select>
				</dd>
				<dd id="topping">
					<h4>Topping(s)</h4>
					<input type="checkbox" name="toppings" value="pepperoni">Pepperoni
					<input type="checkbox" name="toppings" value="sausage">Sausage
					<input type="checkbox" name="toppings" value="green_peppers">Green
					Peppers <input type="checkbox" name="toppings" value="onions">Onions
					<input type="checkbox" name="toppings" value="extra_cheese">Extra
					Cheese
				</dd>
				<dd id="instructions">
					<h5>Special Instructions</h5>
					<textarea name="instructions">Don't drop it!!</textarea>
				</dd>
			</dl>
			
			<input type="submit" value="Preview Order">
	</form>
</body>
</html>
			<!-- <div id="order_summary">
				<div class="header">
					<h1>Order Summary</h1>
				</div>
				<div class="body">
					<div id="deliver_to">
						<h3>Deliver to</h3>
						<div id="address">
						</div>
					</div>
					<div id="order">
						<h3>Order</h3>
						<div id="order_information"></div>
					</div>
				</div>
			</div> -->
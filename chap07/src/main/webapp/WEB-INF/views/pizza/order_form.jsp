<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>Pizza Order Form</h1>
	
	<div>
		<h3>Delivery Information</h3>
		Name: <input type="text" name="name" form="pizza-form" value="Mike"> <br>
		Street Address: <input type="text" name="address" form="pizza-form" value="Guri"><br>
	</div>
	
	<div>
		<h3>Order</h3>
		<h4>Crust</h4>
		<input type="radio" value="Thin Crust" name="crust" form="pizza-form" checked> Thin Crust
		<input type="radio" value="Deep Dish" name="crust" form="pizza-form"> Deep Dish <br>
		<h4>Size</h4>
		<select name="size" form="pizza-form">
			<option value="R">Regular</option>
			<option value="M">Medium</option>
			<option value="L" selected>Large</option>
			<option value="F">Family</option>
		</select>
		<h4>Topping(s)</h4>
		<input type="checkbox" value="Pepperoni" name="toppings" form="pizza-form" checked> Pepperoni
		<input type="checkbox" value="Sausage" name="toppings" form="pizza-form"> Sausage
		<input type="checkbox" value="Green Peppers" name="toppings" form="pizza-form" checked> Green Peppers
		<input type="checkbox" value="Onions" name="toppings" form="pizza-form"> Onions <br>
		<input type="checkbox" value="Extra Cheese" name="toppings" form="pizza-form"> Extra Cheese
		<h4>Special Instructions</h4>
		<textarea name="instructions" cols="30" rows="10" form="pizza-form">Don't drop it!!</textarea>
	</div>
	
	<!-- 상대 경로를 사용할 때는 context path를 사용할 필요가 없다. -->
	<form id="pizza-form" action="./insert" method="POST">
		<input type="submit" value="Preview Order">
	</form>

</body>
</html>
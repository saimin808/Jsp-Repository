<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>

	<h3>Register Form</h3>
	
	<form action="/chap04/memo/register" method="POST">
		Name : <input type="text" name="name"><br>
		ID : <input type="text" name="id"><br>
		Password : <input type="text" name="pw"><br>
		Password Confirm : <input type="text"> (Javascript)<br>
		Birthday : <input type="date" name="birthday"><br>
		<input type="submit" value="Register">
	</form>
	
	<script>
	</script>

</body>
</html>
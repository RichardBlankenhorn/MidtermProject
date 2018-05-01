<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>BREWERY CREATED</h1>

</body>
</html>


	<!--  This is where functionality to add brewery begins -->
						<form action="addBrewery.do" method="POST">
						name:
						<input type ="text" name="name">
						description:
						<input type="text" name="description">
						rating:
						<input type="text" name="rating">
						street
						<input type="text" name="street">
						street2
						<input type="text" name="street2">
						city
						<input type="text" name="city">
						state
						<input type="text" name="state">
						zip
						<input type="text" name="zip">
						phone
						<input type="text" name="phone">
						<button type="submit" class="btn btn-primary"> Create Brewery</button>
						</form>
						<!--  This is where add brewery ends -->
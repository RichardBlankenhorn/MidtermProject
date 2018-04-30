<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="editBreweryForm.do" method="POST">
<input type="hidden" name="id" value="${brewery.id }"/>
						Name:
						<input type ="text" name="name">
						Description:
						<input type="text" name="description">
						Rating:
						<input type="text" name="rating">
						Street:
						<input type="text" name="street">
						Street 2:
						<input type="text" name="street2">
						City:
						<input type="text" name="city">
						State:
						<input type="text" name="state">
						Zip:
						<input type="text" name="zip">
						Phone:
						<input type="text" name="phone">
						<input type="submit" value="Update Brewery">
						</form>

</body>
</html>
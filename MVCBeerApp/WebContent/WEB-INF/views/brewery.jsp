<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${brewery.name }</title>
</head>
<body>
	<h3>${brewery.name }</h3>
	<p>${brewery.description }</p>
	<p>${brewery.address.street }</p>
	<p>${brewery.address.street2 }</p>
	<p>${brewery.address.city }</p>
	<p>${brewery.address.state }</p>
	<p>${brewery.address.zip }</p>
	<p>${brewery.address.phone }</p>
	
	
<form action="editBrewery.do" method="GET">
<input type="hidden" name="id" value="${brewery.id }"/>
    <input type="submit" value="Update"></input>
</form>
	
	
	
</body>
</html>
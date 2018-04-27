<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>What's On Tap?</h1>
	<br>
	<h2>Breweries</h2>
		<form action="listBreweries.do" method="GET">
			<input type="hidden" value="" name="keyword">
			<input type="submit" value="View Full List" />
		</form>
	<h4>Search for brewery by name/keyword</h4>
	<form action="listBreweries.do" method="GET">
		<input type="text" name="keyword" />
		<input type="submit" value="Search" />
	</form>
	<form action="listBreweries.do" method="GET">
	</form>
	<br>
	<h2>Beer</h2>
		<form action="listBeers.do" method="GET">
			<input type="hidden" value="" name="keyword">
			<input type="submit" value="View Full List" />
		</form>
	<h4>Search for beer by name/keyword</h4>
	<form action="listBeers.do" method="GET">
		<input type="text" name="keyword" /> 
		<input type="submit" value="Search" />
	</form>
	<h4>Search for beer by category</h4>
	<form action="listBeersByCategory.do" method="GET">
		<select name="category" size="5">
			<c:forEach var="category" items="${categoryList }">
				<option value="${category.id }">${category.name }</option>
			</c:forEach>
		</select> <input type="submit" value="Search" />
	</form>
</body>
</html>
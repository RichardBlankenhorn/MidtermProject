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
	<h3>Search for brewery by name/keyword</h3>
	<form action="listBreweries.do" method="GET">
		<input type="text" name="keyword" /> <input type="submit"
			value="Search" />
	</form>
	<h3>Search for beer by name/keyword</h3>
	<form action="listBeers.do" method="GET">
		<input type="text" name="keyword" /> <input type="submit"
			value="Search" />
	</form>
	<h3>Search for beer by category</h3>
	<form action="listBeersByCategory.do" method="GET">
		<select name="category" size="5">
			<c:forEach var="category" items=${categoryList }>
				<option value="${category.id }">${category.name }</option>
			</c:forEach>
		</select> <input type="submit" value="Search" />
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brewery Search</title>
</head>
<body>
	<h4>Search for brewery by name/keyword</h4>
	<form action="listBreweries.do" method="GET">
		<input type="text" name="keyword" />
		<input type="submit" value="Search" />
	</form>
</body>
</html>
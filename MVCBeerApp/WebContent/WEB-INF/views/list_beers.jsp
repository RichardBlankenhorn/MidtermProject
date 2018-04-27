<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Beer List</title>
</head>
<body>
	<c:forEach var="beer" items="${listBeer }">
		<form action="beer.do" method="GET">
			<input type="hidden" name="id" value="${beer.id }"> <a
				href="beer.do?id=${beer.id }">
				<h3>${beer.name }</h3>
			</a> <br>
		</form>
	</c:forEach>
</body>
</html>
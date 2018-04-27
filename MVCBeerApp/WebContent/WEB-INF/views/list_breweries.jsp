<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brewery List</title>
</head>
<body>
	
	<c:forEach var="brewery" items="${brewList }">
		<form action="brewery.do" method="GET">
                            <input type="hidden" name="id" value="${brewery.id }"> 
                            <a href="brewery.do?id=${brewery.id }">
                                <h3>${brewery.name }</h3></a>
                            <br>
                        </form>
	</c:forEach>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<form action="editBreweryComment.do" method="POST">
<input type="hidden" name = "id" value="${breweryComment.id }">
<input type="hidden" name = "breweryId" value="${breweryComment.brewery.id }">
<input type="text" name = "description" value="${breweryComment.description }">
<input type="submit" value = "Update Comment">



</form>

</body>
</html>
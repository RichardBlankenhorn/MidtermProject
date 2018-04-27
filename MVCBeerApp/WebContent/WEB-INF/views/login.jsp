<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>

<form action="loginUser.do" method="GET">
  Username:<br>
  <input type="text" name="username" value="Username"><br>
  Password:<br>
  <input type="text" name="password" value="Password"><br><br>
  <input type="submit" value="Login">
</form>

</body>
</html>
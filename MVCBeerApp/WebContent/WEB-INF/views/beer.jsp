<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${beer.name }</title>
</head>
<body>
	<h3>${beer.name }</h3>
	<p>${beer.cost }</p>
	<p>${beer.abv }</p>
	<p>${beer.description }</p>
	<p>${beer.brewery.name }</p>
	<p>${beer.category.name }</p>
	<p>${beer.ibu }</p>

	<form>
	<c:if test="${sessionScope.admin != null}">
		<div class="my-2 my-lg-0">
			<ul class="list-inline main-nav-right">
				<li class="list-inline-item"><a class="btn btn-link btn-sm"
				
					href="updateBeer.do?id=${beer.id }">Update Beer</a></li>
			</ul>
		</div>
		</c:if>
	</form>
	
	<%-- <form>
	<c:if test="${sessionScope.user != null}">
		<div class="my-2 my-lg-0">
			<ul class="list-inline main-nav-right">
				<li class="list-inline-item"><a class="btn btn-success btn-sm"
					href="addBeerButton.do">Add Beer</a></li>
			</ul>
		</div>
	</c:if>
	</form> --%>


	<form action="addBeerComment.do" method="POST">
	<c:if test="${sessionScope.user != null}">
		<input type="hidden" name="beerId" value="${beer.id }">  
		<input type="text" name="beerComment"> <input type="submit"
			value="Add Comment">
			</c:if>
	</form>

	<form action="deleteBeer.do" method="POST">
	<c:if test="${sessionScope.admin != null}">
		<input type="hidden" name="id" value="${beer.id }"> <input
			type="submit" value="Delete Beer">
			</c:if>
	</form>



	<c:forEach var="beerComment" items="${listComments }">
				<h3>${beerComment.description }</h3>
				<h3>${beerComment.dateTime }</h3>
				<h3>${beerComment.user } left comment</h3>
				
		
		<form action="editBeerCommentForm.do" action="GET">
		<c:if test="${user.id == beerComment.user.id || sessionScope.admin != null}">
			<input type="hidden" name="beerCommentId" value="${beerComment.id }">
			<input type="submit" value="Update Comment">
			</c:if>
		</form>
		<form action="deleteBeerComment.do" action="GET">
		<c:if test="${user.id == beerComment.user.id || sessionScope.admin != null}">
			<input type="hidden" name="id" value="${beerComment.id }">
			<input type="hidden" name="beerId" value="${beer.id }">
			<input type="submit" value="Delete Comment">
			</c:if>
		</form>
	</c:forEach>

</body>
</html>
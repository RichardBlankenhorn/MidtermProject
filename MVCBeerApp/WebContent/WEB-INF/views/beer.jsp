<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="my-2 my-lg-0">
						<ul class="list-inline main-nav-right">
							<li class="list-inline-item"><a class="btn btn-link btn-sm"
								href="updateBeer.do?id=${beer.id }">Update Beer</a></li>
							<li class="list-inline-item"><a
								class="btn btn-success btn-sm" href="createAccount.do">Delete Beer</a>
							</li>
						</ul>
					</div>
	
	</form>
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<title>What's On Tap - Beer</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="images/favicon.png">
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Icons -->
<link href="vendor/icons/css/materialdesignicons.min.css" media="all"
	rel="stylesheet" type="text/css" />
<!-- Select2 CSS -->
<link href="vendor/select2/css/select2-bootstrap.css" />
<link href="vendor/select2/css/select2.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/osahan.css" rel="stylesheet">
</head>
<body>
	<!-- Navbar -->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand text-success logo" href="index.do"><i
					class="mdi mdi-home-map-marker"></i> <strong>What's On Tap</strong></a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0 margin-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="index.do"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> HOME </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="index.do">Home Page</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Search </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="searchBeerByKeyword.do">Search
									Beer by Keyword</a> <a class="dropdown-item"
									href="searchBreweriesByKeyword.do">Search Brewery by
									Keyword</a>
							</div></li>
						<c:if test="${sessionScope.user != null}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> My Account </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="profile.do">User Profile</a> <a
										class="dropdown-item" href="updateProfile.do">Update
										Profile</a> <a class="dropdown-item" href="changePassword.do">Change
										Password</a> <a class="dropdown-item" href="viewComments.do">My
										Comments & Ratings</a> <a class="dropdown-item"
										href="viewAllComments.do">View All Comments</a>
								</div></li>
						</c:if>
						<c:if test="${sessionScope.admin != null}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> My Account </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="profile.do">User Profile</a> <a
										class="dropdown-item" href="updateProfile.do">Update
										Profile</a> <a class="dropdown-item" href="changePassword.do">Change
										Password</a> <a class="dropdown-item" href="viewComments.do">My
										Comments</a> <a class="dropdown-item" href="viewAllComments.do">All
										Comments</a>
								</div></li>
						</c:if>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Pages </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="about.do">About Us</a>
							</div></li>
					</ul>
					<div class="my-2 my-lg-0">
						<ul class="list-inline main-nav-right">
							<c:if test="${sessionScope.user == null}">
								<c:if test="${sessionScope.admin == null }">
									<li class="list-inline-item"><a
										class="btn btn-link btn-sm" href="login.do">Sign In</a></li>
								</c:if>
							</c:if>
							<c:if test="${sessionScope.user != null }">
								<li class="list-inline-item"><a class="btn btn-link btn-sm"
									href="logout.do">Logout</a></li>
							</c:if>
							<c:if test="${sessionScope.admin != null }">
								<li class="list-inline-item"><a class="btn btn-link btn-sm"
									href="logout.do">Logout</a></li>
							</c:if>
							<c:if test="${sessionScope.user == null }">
								<c:if test="${sessionScope.admin == null }">
									<li class="list-inline-item"><a
										class="btn btn-success btn-sm" href="createAccount.do">Sign
											Up</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- End Navbar -->

	<!-- Main Slider With Form -->
	<section class="osahan-slider">
		<div id="osahanslider" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active"
					style="background-image: url('img/beermug.jpeg')">
					<div class="overlay"></div>
				</div>
				<div class="carousel-item"
					style="background-image: url('img/cheers.jpeg')">
					<div class="overlay"></div>
				</div>
				<div class="carousel-item"
					style="background-image: url('img/beeronkeg.jpeg')">
					<div class="overlay"></div>
				</div>
			</div>
		</div>
		<div class="slider-form">
			<div class="container">
				<h1 class="text-center text-success mb-5">${beer.name }</h1>
				<h4 class="text-center text-white">From ${beer.brewery.name }</h4>
				<br>
			</div>
		</div>
	</section>
	<!-- End Main Slider With Form -->

	<!-- Beer Info -->
	<section>
		<div class="container" style="padding-top: 25px;">
			<div class="row">
				<div class="col-lg-12 col-md-12 mx-auto">
					<form>
						<div class="card">
							<div class="card-body text-center">
								<h2 class="text-center text-success">${beer.name }</h2>
								<p class="text-center">${beer.description }</p>
								<h5 class="card-title mb-4 text-center">Brewery:
									${beer.brewery.name }</h5>
								<div class="form-group">
									<label>ABV: <span class="text-success">
											${beer.abv }% </span></label>
								</div>
								<div class="form-group">
									<label>IBU's: <span class="text-success">${beer.ibu }</span></label>
								</div>
								<div class="form-group">
									<label>Category: <span class="text-success">${beer.category.name }</span></label>
								</div>
								<div class="form-group">
									<label>Cost: <span class="text-success">$${beer.cost
											}</span></label>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- End Beer Info -->

	<!-- User Comments -->
	<section>
		<h4 class="text-center text-success">${beer.name }Comments</h4>
		<br>
		<c:if test="${listComments.isEmpty() }">
			<h6 class="text-center">No Comments At This Time</h6>
		</c:if>
		<c:if test="${!listComments.isEmpty() }">
			<div class="container">
				<div class="row">
					<c:forEach var="comment" items="${listComments }">
						<div class="col-lg-4 col-md-4 d-flex align-items-stretch">
							<div class="card card-list" style="min-width: 350px">
								<div class="card-body">
									<h5 class="card-title">Comment for ${comment.beer.name }</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi"></i>Brewery: ${comment.beer.brewery.name}
									</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi"></i>Comment By: ${comment.user.username}
									</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi"></i>Comment Made On: ${comment.dateTime}
									</h5>
									<form action="updateBeerComment.do" method="GET">
										<input type="hidden" value="${comment.id }" name="id">
										<input type="hidden" value="${beer.id }" name="beerId">
										<label>(click in comment to edit)</label>
										<h6>
											<c:if test="${user.id == comment.user.id }">
												<textarea style="border: none" cols="30" rows="5"
													name="comment">${comment.description }</textarea>
											</c:if>
											<c:if test="${user.id != comment.user.id }">
												<textarea style="border: none" cols="30" rows="5"
													name="comment" disabled>${comment.description }</textarea>
											</c:if>
										</h6>
										<c:if
											test="${user.id == comment.user.id || sessionScope.admin != null}">
											<h6>
												<button type="submit" class="btn btn-success align-self-end"
													style="height: 30px; text-align: center; display: inline-block;">Edit</button>
											</h6>
										</c:if>
									</form>
								</div>
								<div class="card-footer">
									<span><i class="mdi "></i> <c:if
											test="${user.id == comment.user.id || sessionScope.admin != null}">
											<a href="removeBeerComment.do?id=${comment.id }&beerId=${beer.id}">Delete
												Comment</a>
										</c:if></span>


								</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</section>
	
	<!-- Join Team -->
	<section class="section-padding bg-dark text-center">
		<h2 class="text-white mt-0">
			Learn more about our development team<br>by visiting our About
			page
		</h2>
		<p class="text-white mb-4">Cheers!</p>
		<form action="about.do" method="GET">
			<button type="submit" class="btn btn-success">About Us</button>
		</form>
	</section>
	<!-- End Join Team -->


	<!-- Copyright -->
	<section class="pt-4 pb-4 text-center">
		<p class="mt-0 mb-0">© Copyright 2018 What's On Tap. All Rights
			Reserved</p>
		<small class="mt-0 mb-0"> Made with <i
			class="mdi mdi-heart text-danger"></i> by <a class="text-dark"
			target="_blank" href="https://askbootstrap.com/">Megan, Mark,
				Alan and Richard</a>
		</small>
	</section>
	<!-- End Copyright -->
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Contact form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>
	<!-- select2 Js -->
	<script src="vendor/select2/js/select2.min.js"></script>
	<!-- Custom -->
	<script src="js/custom.js"></script>
</body>
</html>
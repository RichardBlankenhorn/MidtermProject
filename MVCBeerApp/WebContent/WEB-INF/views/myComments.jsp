<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<title>What's On Tap - My Comments</title>
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
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> HOME </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="index1.html">Home With Search</a>
								<a class="dropdown-item" href="index2.html">Home With Map</a> <a
									class="dropdown-item" href="index3.html">Home With Property
									Info</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Search </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="properties-grid.html">Search
									Beer by Keyword</a> <a class="dropdown-item"
									href="properties-list.html">Search Brewery by Keyword</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Beer & Brewery </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="agency-list.html">Add Beer</a> <a
									class="dropdown-item" href="agency-profile.html">Add
									Brewery</a>
								<c:if test="${sessionScope.admin != null }">
									<a class="dropdown-item" href="agents.html">Update Beer</a>
									<a class="dropdown-item" href="agent-profile.html">Update
										Brewery</a>
								</c:if>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> My Account </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="user-profile.html">User
									Profile</a> <a class="dropdown-item" href="social-profiles.html">Social
									Profiles</a> <a class="dropdown-item" href="my-properties.html">My
									Properties</a> <a class="dropdown-item"
									href="favorite-properties.html">Favorite Properties</a> <a
									class="dropdown-item" href="add-property.html">Add Property</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Pages </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="about.html">About Us</a>
							</div></li>
					</ul>
					<div class="my-2 my-lg-0">
						<ul class="list-inline main-nav-right">
							<li class="list-inline-item"><a class="btn btn-link btn-sm"
								href="logout.do">Logout</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- End Navbar -->

	<!-- Inner Header -->
	<section class="section-padding bg-dark inner-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h1 class="mt-0 mb-3 text-white">Hello ${profile.firstName }!</h1>
					<div class="breadcrumbs">
						<p class="mb-0 text-white">
							<a class="text-white" href="home.do">Home</a> / <span
								class="text-success">${profile.firstName }'s Profile</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Inner Header -->

	<section class="tab-view">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link" href="profile.do">User
								Profile</a></li>
						<li class="nav-item"><a class="nav-link"
							href="updateProfile.do">Update Profile</a></li>
						<li class="nav-item"><a class="nav-link"
							href="changePassword.do">Change Password</a></li>
						<li class="nav-item"><a class="nav-link active text-success"
							href="myComments.do">My Comments & Ratings</a></li>
						<li class="nav-item"><a class="nav-link"
							href="viewAllComments.do">View All Comments</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- User Comments -->
	<section class="section-padding">
	<h4 class="text-center">My Comments</h4>
	<br>
		<div class="container">
			<div class="row">
				<c:forEach var="comment" items="${beercomments }">
					<div class="col-lg-4 col-md-4 d-flex align-items-stretch">
						<div class="card card-list" style="min-width: 350px">
							<div class="card-body">
								<h5 class="card-title">Comment for ${comment.beer.name }</h5>
								<h5 class="card-subtitle mb-2 text-muted">
									<i class="mdi mdi-home-map-marker"></i>Brewery:
									${comment.beer.brewery.name}
								</h5>
								<h6>${comment.description }</h6>
								<h2 class="text-success mb-0 mt-3">
									<small></small>
								</h2>
							</div>
							<div class="card-footer">
								<span><i class="mdi "></i> Date <strong>${comment.dateTime }</strong></span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- End User Comments -->

	<!-- Copyright -->
	<section class="pt-4 pb-4 text-center">
		<p class="mt-0 mb-0">© Copyright 2018 What's On Tap. All Rights
			Reserved</p>
		<small class="mt-0 mb-0"> Made with <i
			class="mdi mdi-heart text-danger"></i> by <a class="text-dark"
			target="_blank" href="https://askbootstrap.com/">Megan, Mark, Alen and Richard</a>
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
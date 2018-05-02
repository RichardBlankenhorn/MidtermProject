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
<title>What's On Tap</title>
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
						<c:if test="${sessionScope.user != null}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> My Account </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="profile.do">User Profile</a> 
									<a class="dropdown-item" href="updateProfile.do">Update Profile</a> 
									<a class="dropdown-item" href="changePassword.do">Change Password</a> 
									<a class="dropdown-item" href="viewComments.do">My Comments & Ratings</a> 
									<a class="dropdown-item" href="viewAllComments.do">View All Comments</a>
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
										class="dropdown-item" href="social-profiles.html">Social
										Profiles</a> <a class="dropdown-item" href="my-properties.html">My
										Properties</a> <a class="dropdown-item"
										href="favorite-properties.html">Favorite Properties</a> <a
										class="dropdown-item" href="add-property.html">Add
										Property</a>
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
								<li class="list-inline-item"><a class="btn btn-link btn-sm"
									href="login.do">Sign In</a></li>
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
			<ol class="carousel-indicators">
				<li data-target="#osahanslider" data-slide-to="0" class="active"></li>
				<li data-target="#osahanslider" data-slide-to="1"></li>
				<li data-target="#osahanslider" data-slide-to="2"></li>
			</ol>
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
			<a class="carousel-control-prev" href="#osahanslider" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#osahanslider" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<div class="slider-form">
			<div class="container">
				<h1 class="text-center text-white mb-5">Find Your Favorite
					Beer!</h1>
				<form action="index.do" method="GET">
					<div class="row no-gutters">
						<div class="col-md-5">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="mdi mdi-google-maps"></i>
								</div>
								<select class="form-control select2 no-radius" name="brewery">
									<option value="">All Breweries</option>
									<c:forEach var="brewery" items="${breweries }">
										<option value="${brewery.name }">${brewery.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-5">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="mdi mdi-security-home"></i>
								</div>
								<select class="form-control select2 no-radius" name="category">
									<option value="">All Beer Type</option>
									<c:forEach var="cat" items="${categories }">
										<option value="${cat.name }">${cat.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-2">
							<button type="submit"
								class="btn btn-success btn-block no-radius font-weight-bold">SEARCH</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- End Main Slider With Form -->

	<!-- Properties List -->
	<section class="section-padding">

		<div class="section-title text-center mb-5">
			<c:if test="${category == null && brewery == null}">
				<h2>Available Beers</h2>
			</c:if>
			<c:if test="${category != null && brewery == null}">
				<h2>List of ${category} Beers</h2>
			</c:if>
			<c:if test="${category != null && brewery != null}">
				<h2>List of ${category} Beers for ${brewery}</h2>
			</c:if>
			<c:if test="${category == null && brewery != null }">
				<h2>
					Beers from <a class="company-link"
						href="brewery.do?id=${breweryId} ">${brewery }</a>
				</h2>
			</c:if>
			<p>- “Whoever drinks beer, he is quick to sleep; whoever sleeps
				long, does not sin; whoever does not sin, enters Heaven! Thus, let
				us drink beer!”</p>
		</div>

		<div class="container">
			<div class="row">
				<c:forEach var="beer" items="${beers }">
					<div class="col-lg-4 col-md-4 d-flex align-items-stretch">
						<div class="card card-list" style="min-width: 350px">
							<a href="beer.do?id=${beer.id }"> <img class="card-img-top"
								src="img/porter.jpeg" alt="Card image cap" id="image-fit">
								<div class="card-body">
									<h5 class="card-title">${beer.name }</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi mdi-home-map-marker"></i>Brewery:
										${beer.brewery.name}
									</h5>
									<h6>${beer.description }</h6>
									<h2 class="text-success mb-0 mt-3">
										$6.99 <small></small>
									</h2>
								</div>
								<div class="card-footer">
									<span><i class="mdi "></i> IBU : <strong>${beer.ibu }</strong></span>
									<span><i class="mdi "></i> ABV : <strong>${beer.abv }%</strong></span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- End Properties List -->

	<!-- Properties by City -->
	<section class="section-padding bg-white">
		<div class="section-title text-center mb-5">
			<h2>Breweries By City</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="card bg-dark text-white card-overlay">
						<a href="#"> <img class="card-img"
							src="img/overlay/denver_skyline.jpg" alt="Card image">
							<div class="card-img-overlay">
								<h3 class="card-title text-white">Denver</h3>
								<p class="card-text text-white">16 Properties</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="card bg-dark text-white card-overlay">
						<a href="#"> <img class="card-img" src="img/overlay/2.png"
							alt="Card image">
							<div class="card-img-overlay">
								<h3 class="card-title text-white">Los Angeles</h3>
								<p class="card-text text-white">265 Properties</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="card bg-dark text-white card-overlay">
						<a href="#"> <img class="card-img" src="img/overlay/3.png"
							alt="Card image">
							<div class="card-img-overlay">
								<h3 class="card-title text-white">Chicago</h3>
								<p class="card-text text-white">620 Properties</p>
							</div>
						</a> .
					</div>
				</div>
				<div class="col-lg-8 col-md-8">
					<div class="card bg-dark text-white card-overlay">
						<a href="#"> <img class="card-img" src="img/overlay/4.png"
							alt="Card image">
							<div class="card-img-overlay">
								<h3 class="card-title text-white">Philadelphia</h3>
								<p class="card-text text-white">28 Properties</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Properties by City -->

	<!-- Trusted Agents -->
	<section class="section-padding">
		<div class="section-title text-center mb-5">
			<h2>Trusted Agents</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/user/1.jpg" alt="">
						<p class="mb-4">Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been.</p>
						<h6 class="mb-0 text-success">- Stave Martin</h6>
						<small>Buying Agent</small>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/user/2.jpg" alt="">
						<p class="mb-4">Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been.</p>
						<h6 class="mb-0 text-success">- Mark Smith</h6>
						<small>Selling Agent</small>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/user/3.jpg" alt="">
						<p class="mb-4">Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been.</p>
						<h6 class="mb-0 text-success">- Ryan Printz</h6>
						<small>Real Estate Broker</small>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Trusted Agents -->

	<!-- Join Team -->
	<section class="section-padding bg-dark text-center">
		<h2 class="text-white mt-0">
			Join our professional team & agents<br>to start selling your
			house
		</h2>
		<p class="text-white mb-4">Lorem ipsum dolor sit amet, consectetur
			adipisicing elit.</p>
		<button type="button" class="btn btn-success">Contact Us</button>
		<button type="button" class="btn btn-outline-success">Read
			More</button>
	</section>
	<!-- End Join Team -->

	<!-- Copyright -->
	<section class="pt-4 pb-4 text-center">
		<p class="mt-0 mb-0">© Copyright 2018 What's On Tap. All Rights
			Reserved</p>
		<small class="mt-0 mb-0"> Made with <i
			class="mdi mdi-heart text-danger"></i> by <a class="text-dark"
			target="_blank" href="https://askbootstrap.com/">Megan, Mark, Alan and Richard</a>
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

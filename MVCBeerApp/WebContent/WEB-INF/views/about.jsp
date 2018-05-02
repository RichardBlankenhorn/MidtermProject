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
<title>What's On Tap - About</title>
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
								aria-haspopup="true" aria-expanded="false"> Beer & Brewery </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="addBeerButton.do">Add Beer</a> <a
										class="dropdown-item" href="addBrewery.do">Add Brewery</a>
								</div></li>
						</c:if>
						<c:if test="${sessionScope.admin != null}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> Beer & Brewery </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="addBeerButton.do">Add Beer</a> <a
										class="dropdown-item" href="addBrewery.do">Add Brewery</a>
								</div></li>
						</c:if>
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
										Comments</a> <a class="dropdown-item" href="viewAllComments.do">All
										Comments</a>
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

	<!-- Inner Header -->
	<section class="section-padding bg-dark inner-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h1 class="mt-0 mb-3 text-white">About Us</h1>
					<div class="breadcrumbs">
						<p class="mb-0 text-white">
							<a class="text-white" href="index.do">Home</a> / <span
								class="text-success">About Us</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Inner Header -->

	<!-- About -->
	<section class="section-padding bg-white">
		<div class="container">
			<div class="row">
				<div class="pl-4 col-lg-4 col-md-4 pr-4">
					<img class="rounded img-fluid"
						style="min-width: 375px; min-height: 475px" src="img/boot.jpeg"
						alt="Card image cap">
				</div>
				<div class="col-lg-6 col-md-6 pl-5 pr-5">
					<h2 class="mt-5 mb-5">We Help Unite Beer Lovers</h2>
					<h5 class="mt-2">Our Vision</h5>
					<p>It is well-known that there are too many craft breweries and
						beers for one person to keep up with. We help beer lovers share
						favorite locations and beers and provide this data to those
						searching for a new beer or brewery, or trying to remember an old
						favorite.</p>
					<!-- 
					<h5 class="mt-4">Our Goal</h5>
					<p>When looking at its layout. The point of using Lorem Ipsum
						is that it has a more-or-less normal distribution of letters, as
						opposed to using 'Content here,</p> -->
				</div>
			</div>
		</div>
	</section>
	<!-- End About -->

	<!-- What We Provide -->
	<section class="section-padding">
		<div class="section-title text-center mb-5">
			<h2>What We Provide</h2>
			<p></p>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="mt-4 mb-4">
						<i class="text-success mdi mdi-account-multiple-outline mdi-48px"></i>
						<!-- user image <i class="text-success mdi mdi-account-box-outline mdi-48px"></i>-->
					</div>
					<h5 class="mt-3 mb-3">Crowd-sourced Data</h5>
					<p>We know there are many variations of beers and many
						breweries to try. By empowering our users to provide new beers and
						breweries as they explore, we are able to draw on the knowledge
						and passion of the beer community to increase our library.</p>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="mt-4 mb-4">
						<i class="text-success mdi mdi-clock mdi-48px"></i>
						<!-- checkbox image <i class="text-success mdi mdi-check-circle-outline mdi-48px"></i>-->
					</div>
					<h5 class="mb-3">Real-Time Feedback</h5>
					<p>With our comments feature for beers and breweries, users are
						able to provide feedback on their experience to the community.</p>
				</div>

				<div class="col-lg-4 col-md-4">
					<div class="mt-4 mb-4">
						<i class="text-success mdi mdi-sticker-emoji mdi-48px"></i>
					</div>
					<h5 class="mt-3 mb-3">Brewery Locator</h5>
					<p>Don't remember the location of a brewery? Our map
						functionality will display the location of the brewery with a link
						to directions.</p>
				</div>
			</div>
			<!--  
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="mt-4 mb-4">
						<i class="text-success mdi mdi-clock mdi-48px"></i>
					</div>
					<h5 class="mb-3">Buying a Property</h5>
					<p>Contrary to popular belief, Lorem Ipsum is not simply random
						text. It has roots in a piece of classical Latin literature from
						45 BC, making it over 2000 years old. Richard McClintock, a Latin
						professor at Hampden-Sydney College in Virginia, looked.</p>
				</div>
				
				<div class="col-lg-4 col-md-4">
					<div class="mt-4 mb-4">
						<i class="text-success mdi mdi-comment-alert-outline mdi-48px"></i>
					</div>
					<h5 class="mt-3 mb-3">Presenting Your Property</h5>
					<p>It is a long established fact that a reader will be
						distracted by the readable content of a page when looking at its
						layout. The point of using Lorem Ipsum is that it has a
						more-or-less normal distribution of letters, as opposed to using
						'Content here,</p>
				</div>
				
				<div class="col-lg-4 col-md-4">
					<div class="mt-4 mb-4">
						<i class="text-success mdi mdi-account-multiple-outline mdi-48px"></i>
					</div>
					<h5 class="mt-3 mb-3">Property Exchange</h5>
					<p>It is a long established fact that a reader will be
						distracted by the readable content of a page when looking at its
						layout. The point of using Lorem Ipsum is that it has a
						more-or-less normal distribution of letters, as opposed to using
						'Content here,</p>
				</div>
			</div> -->
		</div>
	</section>
	<!-- End What We Provide -->

	<!-- Trusted Agents -->
	<section class="section-padding bg-white">
		<div class="section-title text-center mb-5">
			<h2>Development Team</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/richard.jpeg" alt="">
						<p class="mb-4">Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been.</p>
						<h6 class="mb-0 text-success">- Richard Blankenhorn</h6>
						<small>Lead Front End Developer/Middleware Developer</small>
					</div>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/alan.jpeg" alt="">
						<p class="mb-4">In dog beers, I've only had one.</p>
						<h6 class="mb-0 text-success">- Alan Frederick</h6>
						<small>Middleware Developer/Associate Front End Developer</small>
					</div>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/mark.jpeg" alt="">
						<p class="mb-4">Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been.</p>
						<h6 class="mb-0 text-success">- Mark Coleman</h6>
						<small>Database Administrator/Middleware Developer</small>
					</div>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="agents-card text-center">
						<img class="img-fluid mb-4" src="img/megan.jpeg" alt="">
						<p class="mb-4">Dilly dilly!</p>
						<h6 class="mb-0 text-success">- Megan Arnold</h6>
						<small>Middleware Developer/Associate Front End Developer</small>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Trusted Agents -->

	<!-- Copyright -->
	<section class="pt-4 pb-4 text-center">
		<p class="mt-0 mb-0">© Copyright 2018 What's On Tap. All Rights
			Reserved</p>
		<small class="mt-0 mb-0"> Made with <i
			class="mdi mdi-heart text-danger"></i> by <a class="text-dark"
			target="_blank" href="https://skilldistillery.com/">Megan, Mark,
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

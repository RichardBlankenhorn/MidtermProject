<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Askbootstrap">
<meta name="author" content="Askbootstrap">
<title>What's On Tap - Create Account</title>
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
				<a class="navbar-brand text-success logo" href="home.do"><i
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
							aria-haspopup="true" aria-expanded="false"> Properties </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="properties-grid.html">Properties
									Grid</a> <a class="dropdown-item" href="properties-list.html">Properties
									List</a> <a class="dropdown-item"
									href="property-single-slider.html">Property Single Slider</a> <a
									class="dropdown-item" href="property-single-gallery.html">Property
									Single Gallery</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Agency </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="agency-list.html">Agency List</a>
								<a class="dropdown-item" href="agency-profile.html">Agency
									Profile</a> <a class="dropdown-item" href="agents.html">Agents</a>
								<a class="dropdown-item" href="agent-profile.html">Agent
									Profile</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Blog </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="blog.html">Blog</a> <a
									class="dropdown-item" href="blog-single.html">Blog Single</a>
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
								<a class="dropdown-item" href="about.html">About Us</a> <a
									class="dropdown-item" href="faq.html">FAQ</a> <a
									class="dropdown-item" href="contact.html">Contact</a> <a
									class="dropdown-item" href="not-found.html">404 Page</a>
							</div></li>
					</ul>
					<div class="my-2 my-lg-0">
						<ul class="list-inline main-nav-right">
							<li class="list-inline-item"><a class="btn btn-link btn-sm"
								href="login.do">Sign In</a></li>
							<li class="list-inline-item"><a
								class="btn btn-success btn-sm" href="createAccount.do">Sign Up</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<!-- End Navbar -->

	<!-- Register -->
	<section class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 mx-auto">
					<div class="card padding-card">
						<div class="card-body">
							<h5 class="card-title mb-4">Create Account</h5>
							<form>
								<div class="form-group">
									<label>First Name <span class="text-danger">*</span></label> <input
										type="text" class="form-control"
										placeholder="Enter First Name" name="firstName">
								</div>
								<div class="form-group">
									<label>Last Name <span class="text-danger">*</span></label> <input
										type="text" class="form-control" placeholder="Enter Last Name"
										name="lastName">
								</div>

								<div class="form-group">
									<label>Email Address <span class="text-danger">*</span></label>
									<input type="email" class="form-control"
										placeholder="Enter Email Address" name="email">
								</div>
								<div class="form-group">
									<label>User Name <span class="text-danger">*</span></label> <input
										type="text" class="form-control" placeholder="Enter User Name"
										name="userName">
								</div>
								<div class="form-group">
									<label>Password <span class="text-danger">*</span></label> <input
										type="email" class="form-control" placeholder="Enter Password"
										name="password">
								</div>
								<button type="submit" class="btn btn-success btn-block">REGISTER</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Register -->

	<!-- Copyright -->
	<section class="pt-4 pb-4 text-center">
		<p class="mt-0 mb-0">© Copyright 2018 What's On Tap. All Rights
			Reserved</p>
		<small class="mt-0 mb-0"> Made with <i
			class="mdi mdi-heart text-danger"></i> by <a class="text-dark"
			target="_blank" href="https://askbootstrap.com/">Ask Bootstrap</a>
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
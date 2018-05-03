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
<title>What's On Tap - Update Brewery</title>
<!-- Favicon Icon -->
<link rel="icon" type="image/png" href="img/static1.squarespace.png">
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
									href="searchBreweriesByKeyword.do">Search Brewery by Keyword</a>
							</div></li>
							<c:if test="${sessionScope.user != null}">
							<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Beer & Brewery </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownPortfolio">
								<a class="dropdown-item" href="addBeerButton.do">Add Beer</a> <a
									class="dropdown-item" href="addBrewery.do">Add
									Brewery</a>
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
									class="dropdown-item" href="addBrewery.do">Add
									Brewery</a>
							</div></li>	
							</c:if>
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
									<a class="dropdown-item" href="viewComments.do">My Comments</a> 
									<a class="dropdown-item" href="viewAllComments.do">All Comments</a>
								</div></li>
						</c:if>
						<c:if test="${sessionScope.admin != null}">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> My Account </a>
								<div class="dropdown-menu"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="profile.do">User Profile</a> 
									<a class="dropdown-item" href="updateProfile.do">Update Profile</a> 
									<a class="dropdown-item" href="changePassword.do">Change Password</a> 
									<a class="dropdown-item" href="viewComments.do">My Comments</a> 
									<a class="dropdown-item" href="viewAllComments.do">All Comments</a>
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

	<!-- Register -->
	<section class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 mx-auto">
					<div class="card padding-card">
						<div class="card-body">
							<h5 class="card-title mb-4">Update Brewery</h5>
							<form action="editBreweryForm.do" method="POST">
								<input type="hidden" value="${brewery.id }" name="id">
								<div class="form-group">
									<label>Name <span class="text-danger">*</span></label> <input
										type="text" class="form-control" value="${brewery.name }"
										name="name" required>
								</div>
								<div class="form-group">
									<label>Description <span class="text-danger">*</span></label>
									<textarea cols="50" rows="4" class="form-control"
										name="description" placeholder="${brewery.description }"></textarea>
								</div>
								<div class="form-group">
									<label>Address Line 1 <span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.street }"
										name="street">
								</div>
								<div class="form-group">
									<label>Address Line 2 <span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.street2 }"
										name="street2">
								</div>
								<div class="form-group">
									<label>City <span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.city }"
										name="city">
								</div>
								<div class="form-group">
									<label>State <span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.state }"
										name="state">
								</div>
								<div class="form-group">
									<label>Zip Code<span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.zip }"
										name="zip">
								</div>
								<div class="form-group">
									<label>Phone<span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.phone }"
										name="phone">
								</div>
								<div class="form-group">
									<label>Latitude<span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.latitude }"
										name="latitude" required pattern="^(0|[1-9]\d*)(\.\d+)?$">
								</div>
								<div class="form-group">
									<label>Longitude<span class="text-danger">*</span></label> <input
										type="text"  step=".01" class="form-control" value="${brewery.address.longitude }"
										name="longitude" required pattern="^[+-]?[0-9]{1,9}(?:\.[0-9]{1,9})?$">
								</div>

								<button type="submit" class="btn btn-success btn-block" value="Update Brewery">UPDATE</button>
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
			target="_blank" href="https://skilldistillery.com/">Megan, Mark, Alan and Richard</a>
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



<!--  
<form action="editBreweryForm.do" method="POST">
<input type="hidden" name="id" value="${brewery.id }"/>
						Name:
						<input type ="text" name="name">
						Description:
						<input type="text" name="description">
						Street:
						<input type="text" name="street">
						Street 2:
						<input type="text" name="street2">
						City:
						<input type="text" name="city">
						State:
						<input type="text" name="state">
						Zip:
						<input type="text" name="zip">
						Phone:
						<input type="text" name="phone">
						<input type="submit" value="Update Brewery">
						</form> -->


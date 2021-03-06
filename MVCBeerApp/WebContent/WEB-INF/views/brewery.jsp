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
<title>What's On Tap - Brewery</title>
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

	<!-- Main Slider With Form -->
	<section class="osahan-slider">
		<div id="osahanslider" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active"
					style="background-image: url('${brewery.imageUrl}')">
					<div class="overlay"></div>
				</div>
			</div>
		</div>
		<div class="slider-form">
			<div class="container">
				<h1 class="text-center text-success mb-5">${brewery.name }</h1>
				<br>
			</div>
		</div>
	</section>
	<!-- End Main Slider With Form -->

	<!-- Brewery Info -->
	<section>
		<div class="container" style="padding-top: 25px;">
			<div class="row">
				<div class="col-lg-12 col-md-12 mx-auto">
					<form>
						<div class="card">
							<div class="card-body text-center">
								<h2 class="text-center text-success">${brewery.name }
									Information</h2>
								<h5 class="card-title mb-4 text-center">Street:
									${brewery.address.street }</h5>
								<div class="form-group">
									<label>City: <span class="text-success">
											${brewery.address.city } </span></label>
								</div>
								<div class="form-group">
									<label>State: <span class="text-success">${brewery.address.state }</span></label>
								</div>
								<div class="form-group">
									<label>Zip: <span class="text-success">${brewery.address.zip }</span></label>
								</div>
								<div class="form-group">
									<label>Phone: <span class="text-success">${brewery.address.phone}</span></label>
								</div>
								<div class="form-group">
									<label>Website: <span class="text-success"></span></label> <a
										href="${brewery.webUrl}" target="_blank">${brewery.name}'s
										Website</a>
								</div>
								<div class="form-group">
									<label><span class="text-success"></span></label> <a
										href="https://www.google.com/maps/dir//${brewery.address.street },+${brewery.address.city },+${brewery.address.state }+${brewery.address.zip }/@${brewery.address.latitude },${brewery.address.longitude },15z"
										target="_blank">Need Directions?</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</section>
	<!-- End Brewery Info -->
	
	<div class="col-lg-12 text-center">
	<form action="editBrewery.do" method="GET">
	<c:if test="${sessionScope.admin != null }">
	<input type="hidden" name="id" value="${brewery.id }">
	<input type="hidden" name="breweryName" value="${brewery.name }">
	<button type="submit" class="btn btn-success">Update Brewery</button>
	</c:if>
	</form>
	</div>
	<br>
	<div class="col-lg-12 text-center">
	<form action="deleteBrewery.do" method="POST">
	<c:if test="${sessionScope.admin != null }">
	<input type="hidden" name="id" value="${brewery.id }">
	<button type="submit" class="btn btn-success">Delete Brewery</button>
	</c:if>
	</form>
	</div>
	<br>
	
	
	
	<section>
		<div class="container">
			<h4 class="text-center text-success">${brewery.name } Beers</h4>
			<br>
			<div class="container text-center">
				<div class="row">
					<c:forEach var="beer" items="${beers }">
						<div class="col-sm-3 col-md-3">
							<div class="thumbnail">
								<div class="caption">
									<h6>${beer.name }</h6>
									<p>ABV: ${beer.abv }</p>
									<p>IBU: ${beer.ibu }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<br>
			<form action="addBeerButton.do" method="GET">
			<c:if test="${sessionScope.admin != null || sessionScope.user != null }">
				<div class="col-md-12 text-center">
					<button type="submit" id="singlebutton" name="singlebutton"
						class="btn btn-success">Don't See Your Beer? Add it Here!</button>
				</div>
				</c:if>
			</form>
		</div>
	</section>
	<br>

	<br>
	<!-- User Comments -->
	<section>
		<div class="container" style="padding-top: 25px;">
			<div class="row">
				<div class="col-lg-12 col-md-12 mx-auto">
	<div class="card">
	<div class="card-body text-center">
		<h4 class="text-center text-success">${brewery.name } Comments</h4>
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
									<h5 class="card-title">Comment for ${comment.brewery.name }</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi"></i>Brewery: ${comment.brewery.name}
									</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi"></i>Comment By: ${comment.user.username}
									</h5>
									<h5 class="card-subtitle mb-2 text-muted">
										<i class="mdi"></i>Comment Made On: ${comment.dateTime}
									</h5>
									<form action="updateMyBreweryComment.do" method="GET">
										<input type="hidden" value="${comment.id }" name="id">
										<input type="hidden" value="${brewery.id }" name="breweryId">
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
												<button type="submit" class="btn btn-success">Edit</button>
											</h6>
										</c:if>
									</form>
								</div>
								<div class="card-footer">
									<span><i class="mdi "></i> <c:if
											test="${user.id == comment.user.id || sessionScope.admin != null}">
											<a
												href="deleteBreweryComment.do?id=${comment.id }&breweryId=${brewery.id}">Delete
												Comment</a>
										</c:if></span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		</div>
		</div>
		</div>
		</div>
		</div>
	</section>
	

	<c:if test="${sessionScope.user != null || sessionScope.admin != null }"> 
	<!-- User Profile -->
	<section class="section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8 mx-auto">
					<form action="addBreweryComment.do" method="POST">
						<div class="card padding-card">
							<div class="card-body">
								<h5 class="card-title mb-4 text-center">Add Comment for ${brewery.name }</h5>
								<div class="form-group">
									<input type="hidden" value="${brewery.id }" name="breweryId">
									<label for="comment">Comment<span class="text-danger">*</span></label>
    								<textarea class="form-control" id="comment" rows="3" name="breweryComment"></textarea>
								</div>
								<div class= "col lg-4 col-md-4 mx-auto">
								<br>
									<button type="submit" class="btn btn-success text-center">Add Comment</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- End User Profile -->
	<br>
	<br>
	</c:if>

	<!-- Map -->
	<div id="map"></div>
	<script>

      // The following example creates a marker in Stockholm, Sweden using a DROP
      // animation. Clicking on the marker will toggle the animation between a BOUNCE
      // animation and no animation.

      var marker;

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: {lat: ${brewery.address.latitude}, lng: ${brewery.address.longitude}}
});

        marker = new google.maps.Marker({
          map: map,
          draggable: true,
          animation: google.maps.Animation.DROP,
          position: {lat: ${brewery.address.latitude}, lng: ${brewery.address.longitude}}
        });
        marker.addListener('click', toggleBounce);
      }

      function toggleBounce() {
        if (marker.getAnimation() !== null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }
    </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy2OOdj95mTCpsjHWkL7bjb-vPKiwQlKg&callback=initMap">
    </script>

	<!-- End Map -->

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
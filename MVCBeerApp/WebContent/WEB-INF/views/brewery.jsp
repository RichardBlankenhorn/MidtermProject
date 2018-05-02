<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${brewery.name }</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 66%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
</head>
<body>
	<h3>${brewery.name }</h3>
	<p>${brewery.description }</p>
	<p>${brewery.address.street }</p>
	<p>${brewery.address.street2 }</p>
	<p>${brewery.address.city }</p>
	<p>${brewery.address.state }</p>
	<p>${brewery.address.zip }</p>
	<p>${brewery.address.phone }</p>


	<form action="editBrewery.do" method="GET">
		<input type="hidden" name="id" value="${brewery.id }" /> <input
			type="submit" value="Update"></input>
	</form>

	<form action="deleteBrewery.do" method="POST">
		<input type="hidden" name="id" value="${brewery.id }" /> <input
			type="submit" value="Delete Brewery">
	</form>



	<form action="addBreweryComment.do" method="POST">
		<input type="hidden" name="breweryId" value="${brewery.id }"> <input
			type="text" name="breweryComment"> <input type="submit"
			value="Add Comment">
	</form>
	

	
	<a href="https://www.google.com/maps/dir//${brewery.address.street },+${brewery.address.city },+${brewery.address.state }+${brewery.address.zip }/@${brewery.address.latitude },${brewery.address.longitude },15z" 
	target="_blank">Need Directions?</a>


	<c:forEach var="breweryComment" items="${listComments }">
		<h3>${breweryComment.description }</h3>
		<h3>${breweryComment.dateTime }</h3>
		<h3>${breweryComment.user }</h3>

			<%-- <c:if test="${user.id } == ${breweryComment.user.id }"> --%>

		<form action="editBreweryCommentForm.do" action="GET">
		<c:if test="${user.id == breweryComment.user.id }">
			<input type="hidden" name="breweryCommentId" value="${breweryComment.id }">
			<input type="submit" value="Update Comment">
			</c:if>
		</form>
		<form action="deleteBreweryComment.do" action="GET">
		<c:if test="${user.id == breweryComment.user.id }">
			<input type="hidden" name="id" value="${breweryComment.id }"> <input
				type="hidden" name="breweryId" value="${brewery.id }"> <input
				type="submit" value="Delete Comment">
				</c:if>
		</form>
	</c:forEach>
	<br>
	<br>
<%-- <iframe
        src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d12294.412555788791!2d${brewery.address.longitude}!3d${brewery.address.latitude}!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sus!4v1524343863196"
        width="100%" height="400" frameborder="0" style="border: 0"
        allowfullscreen></iframe> --%>

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

</body>
</html>
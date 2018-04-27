package com.skilldistillery.jpabeer.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Brewery {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	private String name;

	private String description;

	private int rating;

	@Column(name = "web_url")
	private String webUrl;

	@Column(name = "img_url")
	private String imageUrl;
	
	@OneToMany(mappedBy="beer")
	private List<BeerComments> beerComments;
	
	@OneToMany(mappedBy="beer")
	private List<BeerRating> beerRatings;

	// end of fields

	public Brewery() {
	}

	public Brewery(int id, Address address, String name, String description, int rating, String webUrl, String imageUrl,
			List<BeerComments> beerComments, List<BeerRating> beerRatings) {
		super();
		this.id = id;
		this.address = address;
		this.name = name;
		this.description = description;
		this.rating = rating;
		this.webUrl = webUrl;
		this.imageUrl = imageUrl;
		this.beerComments = beerComments;
		this.beerRatings = beerRatings;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getWebUrl() {
		return webUrl;
	}

	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public List<BeerComments> getBeerComments() {
		return beerComments;
	}

	public void setBeerComments(List<BeerComments> beerComments) {
		this.beerComments = beerComments;
	}

	public List<BeerRating> getBeerRatings() {
		return beerRatings;
	}

	public void setBeerRatings(List<BeerRating> beerRatings) {
		this.beerRatings = beerRatings;
	}

	public int getId() {
		return id;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Brewery [id=").append(id).append(", address=").append(address).append(", name=").append(name)
				.append(", description=").append(description).append(", rating=").append(rating).append(", webUrl=")
				.append(webUrl).append(", imageUrl=").append(imageUrl).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((beerComments == null) ? 0 : beerComments.hashCode());
		result = prime * result + ((beerRatings == null) ? 0 : beerRatings.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((imageUrl == null) ? 0 : imageUrl.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + rating;
		result = prime * result + ((webUrl == null) ? 0 : webUrl.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Brewery other = (Brewery) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (beerComments == null) {
			if (other.beerComments != null)
				return false;
		} else if (!beerComments.equals(other.beerComments))
			return false;
		if (beerRatings == null) {
			if (other.beerRatings != null)
				return false;
		} else if (!beerRatings.equals(other.beerRatings))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (imageUrl == null) {
			if (other.imageUrl != null)
				return false;
		} else if (!imageUrl.equals(other.imageUrl))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (rating != other.rating)
			return false;
		if (webUrl == null) {
			if (other.webUrl != null)
				return false;
		} else if (!webUrl.equals(other.webUrl))
			return false;
		return true;
	}

	
	
	
}



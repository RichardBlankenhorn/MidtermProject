package com.skilldistillery.jpabeer.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Beer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private double cost;

	private double abv;

	private String description;

	@ManyToOne
	@JoinColumn(name = "brewery_id")
	private Brewery brewery;

	@Column(name = "img_url")
	private String imageUrl;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	private double ibu;

	private int rating;

	@OneToMany(mappedBy = "beer")
	private List<BeerComments> beerComments;

	@OneToMany(mappedBy = "beer")
	private List<BeerRating> beerRatings;

	// end of fields

	public Beer() {
	}

	public Beer(int id, String name, double cost, double abv, String description, Brewery brewery, String imageUrl,
			Category category, double ibu, int rating, List<BeerComments> beerComments, List<BeerRating> beerRatings) {
		super();
		this.id = id;
		this.name = name;
		this.cost = cost;
		this.abv = abv;
		this.description = description;
		this.brewery = brewery;
		this.imageUrl = imageUrl;
		this.category = category;
		this.ibu = ibu;
		this.rating = rating;
		this.beerComments = beerComments;
		this.beerRatings = beerRatings;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public double getAbv() {
		return abv;
	}

	public void setAbv(double abv) {
		this.abv = abv;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Brewery getBrewery() {
		return brewery;
	}

	public void setBrewery(Brewery brewery) {
		this.brewery = brewery;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public double getIbu() {
		return ibu;
	}

	public void setIbu(double ibu) {
		this.ibu = ibu;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
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
		builder.append("Beer [id=").append(id).append(", name=").append(name).append(", cost=").append(cost)
				.append(", abv=").append(abv).append(", description=").append(description).append(", brewery=")
				.append(brewery).append(", imageUrl=").append(imageUrl).append(", category=").append(category)
				.append(", ibu=").append(ibu).append(", rating=").append(rating).append(", beerComments=")
				.append(beerComments).append(", beerRatings=").append(beerRatings).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(abv);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((beerComments == null) ? 0 : beerComments.hashCode());
		result = prime * result + ((beerRatings == null) ? 0 : beerRatings.hashCode());
		result = prime * result + ((brewery == null) ? 0 : brewery.hashCode());
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		temp = Double.doubleToLongBits(cost);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		temp = Double.doubleToLongBits(ibu);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + id;
		result = prime * result + ((imageUrl == null) ? 0 : imageUrl.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + rating;
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
		Beer other = (Beer) obj;
		if (Double.doubleToLongBits(abv) != Double.doubleToLongBits(other.abv))
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
		if (brewery == null) {
			if (other.brewery != null)
				return false;
		} else if (!brewery.equals(other.brewery))
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (Double.doubleToLongBits(cost) != Double.doubleToLongBits(other.cost))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (Double.doubleToLongBits(ibu) != Double.doubleToLongBits(other.ibu))
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
		return true;
	}

}

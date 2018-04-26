package com.skilldistillery.jpabeer.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="beer_rating")
public class BeerRating {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private int rating;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="beer_id")
	private Beer beer;
	
	//end of fields
	
	public BeerRating() {
	}

	public BeerRating(int id, int rating, User user, Beer beer) {
		super();
		this.id = id;
		this.rating = rating;
		this.user = user;
		this.beer = beer;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Beer getBeer() {
		return beer;
	}

	public void setBeer(Beer beer) {
		this.beer = beer;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BeerRating [id=").append(id).append(", rating=").append(rating).append(", user=").append(user)
				.append(", beer=").append(beer).append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((beer == null) ? 0 : beer.hashCode());
		result = prime * result + id;
		result = prime * result + rating;
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		BeerRating other = (BeerRating) obj;
		if (beer == null) {
			if (other.beer != null)
				return false;
		} else if (!beer.equals(other.beer))
			return false;
		if (id != other.id)
			return false;
		if (rating != other.rating)
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
	
	
	
}

package com.skilldistillery.jpabeer.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private boolean admin;
	
	@OneToMany(mappedBy="user")
	private List<BeerComments> beerComments;
	
	@OneToMany(mappedBy="user")
	private List<BeerRating> beerRatings;
	
	//end of fields
	
	public User() {
	}

	public User(int id, String username, String password, boolean admin, List<BeerComments> beerComments,
			List<BeerRating> beerRatings) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.admin = admin;
		this.beerComments = beerComments;
		this.beerRatings = beerRatings;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
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

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("User [id=").append(id).append(", username=").append(username).append(", password=")
//				.append(password).append(", admin=").append(admin).append(", beerComments=").append(beerComments)
//				.append(", beerRatings=").append(beerRatings).append("]");
//		return builder.toString();
//	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=").append(id).append(", username=").append(username).append(", password=")
		.append(password).append(", admin=").append(admin).append("]");
		return builder.toString();
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (admin ? 1231 : 1237);
		result = prime * result + ((beerComments == null) ? 0 : beerComments.hashCode());
		result = prime * result + ((beerRatings == null) ? 0 : beerRatings.hashCode());
		result = prime * result + id;
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		User other = (User) obj;
		if (admin != other.admin)
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
		if (id != other.id)
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	

	
}

package com.skilldistillery.jpabeer.entities;



public class BeerDTO {
	
	private String beerName;

	private double cost;

	private double abv;

	private String beerDescription;

	private String imageUrl;

	private double ibu;

	private int beerRating;

	private String breweryName; 
	
	private String breweryDescription;
	
	private int breweryRating;
	
	private String categoryName; 

	// end of fields
	
	public BeerDTO() {	}

	public String getBeerName() {
		return beerName;
	}

	public void setBeerName(String beerName) {
		this.beerName = beerName;
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

	public String getBeerDescription() {
		return beerDescription;
	}

	public void setBeerDescription(String beerDescription) {
		this.beerDescription = beerDescription;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public double getIbu() {
		return ibu;
	}

	public void setIbu(double ibu) {
		this.ibu = ibu;
	}

	public int getBeerRating() {
		return beerRating;
	}

	public void setBeerRating(int beerRating) {
		this.beerRating = beerRating;
	}

	public String getBreweryName() {
		return breweryName;
	}

	public void setBreweryName(String breweryName) {
		this.breweryName = breweryName;
	}

	public String getBreweryDescription() {
		return breweryDescription;
	}

	public void setBreweryDescription(String breweryDescription) {
		this.breweryDescription = breweryDescription;
	}

	public int getBreweryRating() {
		return breweryRating;
	}

	public void setBreweryRating(int breweryRating) {
		this.breweryRating = breweryRating;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "BeerDTO [beerName=" + beerName + ", cost=" + cost + ", abv=" + abv + ", beerDescription="
				+ beerDescription + ", imageUrl=" + imageUrl + ", ibu=" + ibu + ", beerRating=" + beerRating
				+ ", breweryName=" + breweryName + ", breweryDescription=" + breweryDescription + ", breweryRating="
				+ breweryRating + ", categoryName=" + categoryName + "]";
	}
	
	
}

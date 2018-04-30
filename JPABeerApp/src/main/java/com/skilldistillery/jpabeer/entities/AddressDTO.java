package com.skilldistillery.jpabeer.entities;

public class AddressDTO {

	private double latitude;
	
	private double longitude;
	
	private String street;
	
	private String street2;
	
	private String city;
	
	private String state;
	
	private String zip;
	
	private String phone;
	
	private String name;
	
	private String description;
	
	private int rating;
	
	public AddressDTO() {
		
	}

	public AddressDTO(double latitude, double longitude, String street, String street2, String city, String state,
			String zip, String phone, String name, String description, int rating) {
		super();
		this.latitude = latitude;
		this.longitude = longitude;
		this.street = street;
		this.street2 = street2;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.phone = phone;
		this.name = name;
		this.description = description;
		this.rating = rating;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStreet2() {
		return street2;
	}

	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
	
	
}

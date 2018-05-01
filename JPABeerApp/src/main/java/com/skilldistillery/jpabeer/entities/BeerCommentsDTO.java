package com.skilldistillery.jpabeer.entities;

import java.util.Date;

public class BeerCommentsDTO {
	
	private String commentDescription;
	
	private Date dateTime;
	
	private String username;
	
	private String password;
	
	private String beerName;
	
	private String beerCost;
	
	private double beerABV;
	
	private String beerDescription;
	
	private double beerIBU;
	
	private int beerRating;

	public String getCommentDescription() {
		return commentDescription;
	}

	public void setCommentDescription(String commentDescription) {
		this.commentDescription = commentDescription;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
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

	public String getBeerName() {
		return beerName;
	}

	public void setBeerName(String beerName) {
		this.beerName = beerName;
	}

	public String getBeerCost() {
		return beerCost;
	}

	public void setBeerCost(String beerCost) {
		this.beerCost = beerCost;
	}

	public double getBeerABV() {
		return beerABV;
	}

	public void setBeerABV(double beerABV) {
		this.beerABV = beerABV;
	}

	public String getBeerDescription() {
		return beerDescription;
	}

	public void setBeerDescription(String beerDescription) {
		this.beerDescription = beerDescription;
	}

	public double getBeerIBU() {
		return beerIBU;
	}

	public void setBeerIBU(double beerIBU) {
		this.beerIBU = beerIBU;
	}

	public int getBeerRating() {
		return beerRating;
	}

	public void setBeerRating(int beerRating) {
		this.beerRating = beerRating;
	}

	public BeerCommentsDTO(String commentDescription, Date dateTime, String username, String password, String beerName,
			String beerCost, double beerABV, String beerDescription, double beerIBU, int beerRating) {
		super();
		this.commentDescription = commentDescription;
		this.dateTime = dateTime;
		this.username = username;
		this.password = password;
		this.beerName = beerName;
		this.beerCost = beerCost;
		this.beerABV = beerABV;
		this.beerDescription = beerDescription;
		this.beerIBU = beerIBU;
		this.beerRating = beerRating;
	}
	
	public BeerCommentsDTO() {
	}
	

}

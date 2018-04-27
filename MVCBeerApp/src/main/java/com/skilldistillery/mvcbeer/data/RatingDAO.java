package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.BeerRating;
import com.skilldistillery.jpabeer.entities.BreweryRating;

public interface RatingDAO {

public BeerRating createBeerRating(BeerRating beerRating);
	
	//beers
	public List<BeerRating> retrieveAllBeerRatings();
	
	public BeerRating updateBeerRating(int id, BeerRating beerRating);
	
	public boolean deleteBeerRating(int id);
	
	//breweries
	public BreweryRating create(BreweryRating breweryRating);
	
	public List<BreweryRating> retrieveAllBreweryRatings();
	
	public BreweryRating updateBreweryRating(int id, BreweryRating breweryRating);
	
	public boolean deleteBreweryRating(int id);
	
	
}

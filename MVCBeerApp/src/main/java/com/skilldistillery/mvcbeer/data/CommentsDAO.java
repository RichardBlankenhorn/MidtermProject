package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.jpabeer.entities.BreweryComments;


public interface CommentsDAO {
	
	//beer
	public BeerComments createBeerComments(BeerComments beerComment);
	
	public List<BeerComments> retrieveAllBeerComments();
	
	public BeerComments updateBeerComments(int id, BeerComments beerComment);
	
	public boolean deleteBeerComment(int id);
	
	//breweries
	public BreweryComments create(BreweryComments breweryComment);
	
	public List<BreweryComments> retrieveAllBreweryComments();
	
	public BreweryComments updateBreweryComments(int id, BreweryComments breweryComment);
	
	public boolean deleteBreweryComment(int id);
	
	
}

package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.BeerDTO;
import com.skilldistillery.jpabeer.entities.Brewery;

public interface BeerDAO {

	public Beer retrieveById(int id);

	public Beer create(Beer beer);

	public List<Beer> retrieveAllBeer();

	public Beer updateBeer(int id, BeerDTO dto);

	public Beer createBeer(BeerDTO dto);
	
	public boolean deleteBeer(int id);

	public List<Beer> searchBeerByKeyword(String keyword);

	public List<Beer> searchBeerByCategeory(String keyword);

	public List<Beer> searchBeerByBrewery(String brewery);

	public List<Beer> searchBeerByBreweryAndCategory(String category, String brewery);
	
	public Brewery getBreweryByName(String breweryName);

}

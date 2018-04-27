package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.Beer;

public interface BeerDAO {
	
	public Beer retrieveById(int id); 
	
	public Beer create(Beer beer);
	
	public List<Beer> retrieveAllBeer();
	
	public Beer updateBeer(int id, Beer beer);
	
	public boolean deleteBeer(int id);
	
}

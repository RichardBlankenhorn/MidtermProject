package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.Category;


public interface CategoryDAO {
	
	public Category retrieveById(int id);

	public Category create(Category category);

	public List<Category> retrieveAllCategories();

	public Category updateCategory(int id,Category category);

	public boolean deleteBrewery(int id);
	
	public List<Category> getBreweryByKeyword(String keyword);

}

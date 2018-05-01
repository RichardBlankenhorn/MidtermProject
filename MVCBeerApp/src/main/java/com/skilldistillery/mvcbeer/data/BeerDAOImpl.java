package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.BeerDTO;
import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.jpabeer.entities.Category;

@Transactional
@Component
public class BeerDAOImpl implements BeerDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	private CategoryDAO cDAO;

	@Override
	public Beer retrieveById(int id) {
		return em.find(Beer.class, id);
	}

	@Override
	public Beer create(Beer beer) {
		em.persist(beer);
		em.flush();
		return beer;
	}

	@Override
	public List<Beer> retrieveAllBeer() {
		String query = "SELECT b from Beer b";
		List<Beer> allBeer = em.createQuery(query, Beer.class).getResultList();
		return allBeer;
	}

	@Override
	public boolean deleteBeer(int id) {
		boolean deleted = false;
		Beer b = em.find(Beer.class, id);
		String query = "DELETE FROM BeerRating br where br.beer.id = :id";
		String query2 = "DELETE FROM BeerComments bc where bc.beer.id = :id";
				
		em.createQuery(query).setParameter("id", id).executeUpdate();
		em.createQuery(query2).setParameter("id", id).executeUpdate();
		try {
			em.remove(b);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Beer not found.");
		}
		return deleted;
	}

	@Override
	public List<Beer> searchBeerByKeyword(String keyword) {
		String query = "SELECT b from Beer b WHERE b.name LIKE :keyword OR b.description LIKE :keyword";
		List<Beer> results = em.createQuery(query, Beer.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();
		return results;
	}

	@Override
	public List<Beer> searchBeerByCategeory(String keyword) {
		String query = "SELECT b from Beer b WHERE b.category.name LIKE :keyword";
		List<Beer> results = em.createQuery(query, Beer.class).setParameter("keyword", "%" + keyword + "%")
				.getResultList();
		return results;
	}

	@Override
	public List<Beer> searchBeerByBrewery(String brewery) {
		String query = "SELECT b from Beer b WHERE b.brewery.name = :brewery";
		List<Beer> results = em.createQuery(query, Beer.class).setParameter("brewery", brewery).getResultList();
		return results;
	}

	@Override
	public List<Beer> searchBeerByBreweryAndCategory(String category, String brewery) {
		String query = "SELECT b FROM Beer b WHERE b.brewery.name = :brewery AND b.category.name = :category";
		List<Beer> results = em.createQuery(query, Beer.class).setParameter("brewery", brewery)
				.setParameter("category", category).getResultList();
		return results;
	}

	@Override
	public Beer updateBeer(int id, BeerDTO dto) {
		Beer b = em.find(Beer.class, id); 
		Category c = b.getCategory(); 
		Brewery brew = b.getBrewery();
		
		c.setName(dto.getCategoryName());
		
		brew.setName(dto.getBreweryName());
		brew.setDescription(dto.getBreweryDescription());
		brew.setRating(dto.getBreweryRating());
		
		b.setName(dto.getBeerName());
		b.setCost(dto.getCost());
		b.setAbv(dto.getAbv());
		b.setDescription(dto.getBeerDescription());
		b.setImageUrl(dto.getImageUrl());
		b.setIbu(dto.getIbu());
		
		b.setCategory(c);
		b.setBrewery(brew);
		
		em.persist(b);
		em.flush();
		
		return b;
	}
	
	@Override
	public Brewery getBreweryByName(String breweryName) {
		String query = "SELECT b from Brewery b WHERE b.name = :keyword";
		Brewery result = em.createQuery(query, Brewery.class).setParameter("keyword", breweryName).getResultList().get(0);
		return result;
	}

	@Override
	public Beer createBeer(BeerDTO dto) {
		System.out.println(dto);
//		Category c = new Category();
//		c.setName(dto.getCategoryName());
		
//		Brewery brew = new Brewery();
//		brew.setName(dto.getBreweryName());
//		brew.setDescription(dto.getBreweryDescription());
//		brew.setRating(dto.getBreweryRating());
//		
		Beer b = new Beer();		
		b.setBrewery(getBreweryByName(dto.getBreweryName()));
		b.setName(dto.getBeerName());
		b.setCost(dto.getCost());
		b.setAbv(dto.getAbv());
		b.setDescription(dto.getBeerDescription());
		b.setImageUrl(dto.getImageUrl());
		b.setIbu(dto.getIbu());
		System.out.println(cDAO.getCategoryByName(dto.getCategoryName()));
		b.setCategory(cDAO.getCategoryByName(dto.getCategoryName()));
//		b.setCategory(c);
//		b.setBrewery(brew);
		
		em.persist(b);
		em.flush();
		
		return b;
	}

}

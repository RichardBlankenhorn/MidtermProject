package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.BeerRating;
import com.skilldistillery.jpabeer.entities.BreweryRating;

@Transactional
@Component
public class RatingDAOImpl implements RatingDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public BeerRating createBeerRating(BeerRating beerRating) {
		em.persist(beerRating);
		em.flush();
		return beerRating;
	}

	@Override
	public List<BeerRating> retrieveAllBeerRatings() {
		String query = "Select br from BeerRating br";
		List<BeerRating> allBeerRatings = em.createQuery(query, BeerRating.class).getResultList();
		return allBeerRatings;
	}

	@Override
	public BeerRating updateBeerRating(int id, BeerRating beerRating) {
		BeerRating br = em.find(BeerRating.class, id);
		br.setRating(beerRating.getRating());
		br.setUser(beerRating.getUser());
		br.setBeer(beerRating.getBeer());
		
		em.persist(br);
		em.flush();
		
		return br;
	}

	@Override
	public boolean deleteBeerRating(int id) {
		boolean deleted = false;
		BeerRating br = em.find(BeerRating.class, id);
		try {
			em.remove(br);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Beer Rating not found.");
		}
		return deleted;
	}

	@Override
	public BreweryRating create(BreweryRating breweryRating) {
		em.persist(breweryRating);
		em.flush();
		return breweryRating;
	}

	@Override
	public List<BreweryRating> retrieveAllBreweryRatings() {
		String query = "Select br from BreweryRating br";
		List<BreweryRating> allBreweryRatings = em.createQuery(query, BreweryRating.class).getResultList();
		return allBreweryRatings;
	}

	@Override
	public BreweryRating updateBreweryRating(int id, BreweryRating breweryRating) {
		BreweryRating br = em.find(BreweryRating.class, id);
		br.setUser(breweryRating.getUser());
		br.setBrewery(breweryRating.getBrewery());
		br.setRating(breweryRating.getRating());
		
		em.persist(br);
		em.flush();
		
		return br;
	}

	@Override
	public boolean deleteBreweryRating(int id) {
		boolean deleted = false;
		BreweryRating br = em.find(BreweryRating.class, id);
		try {
			em.remove(br);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Brewery rating not found.");
		}
		return deleted;
	}

}

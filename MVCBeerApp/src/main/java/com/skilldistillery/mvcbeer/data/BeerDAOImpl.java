package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Beer;

@Transactional
@Component
public class BeerDAOImpl implements BeerDAO {

	@PersistenceContext
	private EntityManager em;

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
	public Beer updateBeer(int id, Beer beer) {
		Beer b = em.find(Beer.class, id);
		b.setName(beer.getName());
		b.setCost(beer.getCost());
		b.setAbv(beer.getAbv());
		b.setDescription(beer.getDescription());
		b.setBrewery(beer.getBrewery());
		b.setImageUrl(beer.getImageUrl());
		b.setCategory(beer.getCategory());
		b.setIbu(beer.getIbu());
		b.setRating(beer.getRating());

		em.persist(b);
		em.flush();

		return b;
	}

	@Override
	public boolean deleteBeer(int id) {
		boolean deleted = false;
		Beer b = em.find(Beer.class, id);
		try {
			em.remove(b);
			deleted = true;
		}
		catch(IllegalArgumentException iae){
			System.out.println("Beer not found");
		}
		return deleted;
	}

}

package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Brewery;

@Transactional
@Component
public class BreweryDAOImpl implements BreweryDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Brewery retrieveById(int id) {
		return em.find(Brewery.class, id);
	}

	@Override
	public Brewery create(Brewery brewery) {
		em.persist(brewery);
		em.flush();
		return brewery;
	}

	@Override
	public List<Brewery> retrieveAllBreweries() {
		String query = "SELECT b FROM Brewery b";
		List<Brewery> allBreweries = em.createQuery(query, Brewery.class).getResultList();
		return allBreweries;
	}

	@Override
	public Brewery updateBrewery(int id, Brewery brewery) {
		Brewery b = em.find(Brewery.class, id);
		b.setWebUrl(brewery.getWebUrl());
		b.setAddress(brewery.getAddress());
		b.setName(brewery.getName());
		b.setDescription(brewery.getDescription());
		b.setRating(brewery.getRating());
		b.setImageUrl(brewery.getImageUrl());

		em.persist(b);
		em.flush();

		return b;
	}

	@Override
	public boolean deleteBrewery(int id) {
		boolean deleted = false;
		Brewery b = em.find(Brewery.class, id);
		try {
			em.remove(b);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Brewery not found.");
		}
		return deleted;
	}

}

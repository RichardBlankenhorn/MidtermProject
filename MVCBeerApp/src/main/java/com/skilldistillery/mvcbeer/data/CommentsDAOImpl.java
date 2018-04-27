package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.jpabeer.entities.BreweryComments;

@Transactional
@Component
public class CommentsDAOImpl implements CommentsDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public BeerComments createBeerComments(BeerComments beerComment) {
		em.persist(beerComment);
		em.flush();
		return beerComment;
	}

	@Override
	public List<BeerComments> retrieveAllBeerComments() {
		String query = "SELECT bc FROM BeerComments bc";
		List<BeerComments> allBeerComments = em.createQuery(query, BeerComments.class).getResultList();
		return allBeerComments;
	}

	@Override
	public BeerComments updateBeerComments(int id, BeerComments beerComment) {
		BeerComments bc = em.find(BeerComments.class, id);
		bc.setUser(beerComment.getUser());
		bc.setBeer(beerComment.getBeer());
		bc.setDescription(beerComment.getDescription());
		bc.setDateTime(beerComment.getDateTime());

		em.persist(bc);
		em.flush();

		return bc;
	}

	@Override
	public boolean deleteBeerComment(int id) {
		boolean deleted = false;
		BeerComments bc = em.find(BeerComments.class, id);
		try {
			em.remove(bc);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Beer Comment not found.");
		}
		return deleted;
	}

	@Override
	public BreweryComments create(BreweryComments breweryComment) {
		em.persist(breweryComment);
		em.flush();
		return breweryComment;
	}

	@Override
	public List<BreweryComments> retrieveAllBreweryComments() {
		String query = "SELECT bc FROM BreweryComments bc";
		List<BreweryComments> allBreweryComments = em.createQuery(query, BreweryComments.class).getResultList();
		return allBreweryComments;
	}

	@Override
	public BreweryComments updateBreweryComments(int id, BreweryComments breweryComment) {
		BreweryComments bc = em.find(BreweryComments.class, id);
		bc.setUser(breweryComment.getUser());
		bc.setBrewery(breweryComment.getBrewery());
		bc.setDescription(breweryComment.getDescription());
		bc.setDateTime(breweryComment.getDateTime());
		
		em.persist(bc);
		em.flush();
		
		return bc;
	}

	@Override
	public boolean deleteBreweryComment(int id) {
		boolean deleted = false;
		BreweryComments bc = em.find(BreweryComments.class, id);
		try {
			em.remove(bc);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Brewery Comment not found.");
		}
		return deleted;

	}
}

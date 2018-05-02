package com.skilldistillery.mvcbeer.data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.jpabeer.entities.BreweryComments;
import com.skilldistillery.jpabeer.entities.User;

@Transactional
@Component
public class CommentsDAOImpl implements CommentsDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public BeerComments createBeerComments(int id, int beerId, String beerComment) {
		User u = em.find(User.class, id);
		Beer b = em.find(Beer.class, beerId);
		BeerComments bc = new BeerComments();

		bc.setUser(u);
		bc.setBeer(b);
		bc.setDescription(beerComment);
		bc.setDateTime(new Date());

		em.persist(bc);
		em.flush();

		return bc;
	}

	@Override
	public List<BeerComments> retrieveAllBeerComments(int beerId) {
		String query = "SELECT bc FROM BeerComments bc WHERE bc.beer.id = :id ORDER BY bc.dateTime DESC";
		List<BeerComments> allBeerComments = em.createQuery(query, BeerComments.class).setParameter("id", beerId)
				.getResultList();
		return allBeerComments;
	}

	@Override
	public BeerComments updateBeerComments(int id, BeerComments beerComment) {
		BeerComments bc = em.find(BeerComments.class, id);
		bc.setDescription(beerComment.getDescription());
		bc.setDateTime(new Date());

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
	public List<BreweryComments> retrieveAllBreweryComments(int breweryId) {
		String query = "SELECT bc FROM BreweryComments bc WHERE bc.brewery.id = :id ORDER BY bc.dateTime DESC";
		List<BreweryComments> allBreweryComments = em.createQuery(query, BreweryComments.class).setParameter("id", breweryId).getResultList();
		return allBreweryComments;
	}

	@Override
	public BreweryComments updateBreweryComments(int id, BreweryComments breweryComment) {
		BreweryComments bc = em.find(BreweryComments.class, id);
		bc.setDescription(breweryComment.getDescription());
		bc.setDateTime(new Date());

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

	@Override
	public BreweryComments createBreweryComments(int id, int breweryId, String breweryComment) {
		User u = em.find(User.class, id);
		Brewery b = em.find(Brewery.class, breweryId);
		BreweryComments bc = new BreweryComments();
		
		bc.setUser(u);
		bc.setBrewery(b);
		bc.setDescription(breweryComment);
		bc.setDateTime(new Date());
		
		em.persist(bc);
		em.flush();
		
		return bc;
	}

	@Override
	public BeerComments retrieveBeerCommentById(int id) {
		return em.find(BeerComments.class, id);
	}



	@Override
	public BreweryComments retrieveBreweryCommentById(int id) {
		return em.find(BreweryComments.class, id);
	}
}

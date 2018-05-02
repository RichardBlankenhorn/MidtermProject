package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Address;
import com.skilldistillery.jpabeer.entities.AddressDTO;
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
	public Brewery updateBrewery(int id, AddressDTO dto) {
		Brewery b = em.find(Brewery.class, id);
		Address a = b.getAddress();
		
		a.setStreet(dto.getStreet());
		a.setStreet2(dto.getStreet2());
		a.setCity(dto.getCity());
		a.setState(dto.getState());
		a.setZip(dto.getZip());
		a.setPhone(dto.getPhone());
		a.setLatitude(dto.getLatitude());
		a.setLongitude(dto.getLongitude());
		
		b.setName(dto.getName());
		b.setDescription(dto.getDescription());
		b.setRating(dto.getRating());
		b.setAddress(a);

		em.persist(b);
		em.flush();
		return b;
	}

	@Override
	public boolean deleteBrewery(int id) {
		boolean deleted = false;
		Brewery b = em.find(Brewery.class, id);
		String query = "DELETE FROM Beer b where b.brewery.id = :id";
		String query2 = "DELETE FROM BreweryRating br where br.brewery.id = :id";
		String query3 = "DELETE FROM BreweryComments bc where bc.brewery.id = :id";
		em.createQuery(query).setParameter("id", id).executeUpdate();
		em.createQuery(query2).setParameter("id", id).executeUpdate();
		em.createQuery(query3).setParameter("id", id).executeUpdate();
		try {
			em.remove(b);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Brewery not found.");
		}
		return deleted;
	}

	@Override
	public List<Brewery> getBreweryByKeyword(String keyword) {
		String query = "SELECT b from Brewery b WHERE b.name LIKE :keyword OR b.description LIKE :keyword";
		List<Brewery> results = em.createQuery(query, Brewery.class).setParameter("keyword", "%"+keyword+"%").getResultList();
		return results;
	}

	@Override
	public Brewery createAddressAndBrewery(AddressDTO dto) {
		Address a = new Address();
		a.setStreet(dto.getStreet());
		a.setStreet2(dto.getStreet2());
		a.setCity(dto.getCity());
		a.setState(dto.getState());
		a.setZip(dto.getZip());
		a.setPhone(dto.getPhone());
		a.setLatitude(dto.getLatitude());
		a.setLongitude(dto.getLongitude());
		
		Brewery b = new Brewery();
		b.setName(dto.getName());
		b.setDescription(dto.getDescription());
		b.setRating(dto.getRating());
		b.setAddress(a);
		
		em.persist(b);
		em.flush();
		
		return b;
	}

}

package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Profile;

@Transactional
@Component
public class ProfileDAOImpl implements ProfileDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Profile retrieveById(int id) {
		return em.find(Profile.class, id);
	}

	@Override
	public Profile create(Profile profile) {
		em.persist(profile);
		em.flush();
		return profile;
	}

	@Override
	public List<Profile> retrieveAllProfiles() {
		String query = "SELECT p FROM Profile p";
		List<Profile> allProfiles = em.createQuery(query, Profile.class).getResultList();
		return allProfiles;
	}

	@Override
	public Profile updateProfile(int id, Profile profile) {
		Profile p = em.find(Profile.class, id);
		p.setEmail(p.getEmail());
		p.setUser(profile.getUser());
		p.setFirstName(profile.getFirstName());
		p.setLastName(profile.getLastName());
		
		em.persist(p);
		em.flush();
		
		return p;
	}

	@Override
	public boolean deleteProfile(int id) {
		boolean deleted = false;
		Profile p = em.find(Profile.class, id);
		try {
			em.remove(p);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Beer not found.");
		}
		return deleted;
	}

}

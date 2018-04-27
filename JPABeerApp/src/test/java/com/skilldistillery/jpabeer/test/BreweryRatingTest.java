package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.BreweryRating;


class BreweryRatingTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	@Test
	@DisplayName("Test brewery rating to user and brewery mappings")
	void test_brewery_rating_to_user_and_brewery_mappings() {
		
		BreweryRating br = em.find(BreweryRating.class, 1);
		int i = br.getRating();
		assertEquals(4, i);
		
		int j = br.getUser().getId();
		assertEquals(2, j);
		
		int k = br.getBrewery().getId();
		assertEquals(1, k);

	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

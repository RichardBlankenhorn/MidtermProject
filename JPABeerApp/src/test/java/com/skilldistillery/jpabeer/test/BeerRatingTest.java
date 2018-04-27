package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.BeerRating;

class BeerRatingTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	@Test
	@DisplayName("Test beer rating to user and beer mappings")
	void test_beer_rating_to_user_and_beer_mappings() {
		BeerRating br = em.find(BeerRating.class, 1);
		int i = br.getRating();
		assertEquals(5, i);
		
		int j = br.getUser().getId();
		assertEquals(2, j);
		
		int k = br.getBeer().getId();
		assertEquals(15, k);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

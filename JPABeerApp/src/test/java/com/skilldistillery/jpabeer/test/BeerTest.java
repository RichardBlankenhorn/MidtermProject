package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.Brewery;

class BeerTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	@Test
	@DisplayName("Test beer/brewery mappings")
	void test_beer_brewery_mappings() {
		Beer beer = em.find(Beer.class, 1);
		Brewery b = beer.getBrewery();
		assertEquals("Dry Dock", b.getName());
	}

	@Test
	@DisplayName("Test category mapping for beer")
	void test_category_mapping_for_beer() {
		Beer beer = em.find(Beer.class, 5);
		String c = beer.getCategory().getName();
		assertEquals("Double IPA", c);
		int i = beer.getCategory().getId();
		assertEquals(2, i);
		
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

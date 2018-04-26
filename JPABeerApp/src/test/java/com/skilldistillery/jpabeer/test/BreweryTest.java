package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Brewery;

public class BreweryTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	
	@Test
	@DisplayName("Test address mapping for a brewery")
	void test_brewery_address() {
		Brewery brewery = em.find(Brewery.class, 1);
		String a = brewery.getAddress().getCity();
		assertEquals("Aurora", a);
		String s = brewery.getAddress().getStreet();
		assertEquals("15120 E Hampden Ave", s);
		String z = brewery.getAddress().getZip();
		assertEquals("80014", z);
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.BreweryComments;

class BreweryCommentsTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	@Test
	@DisplayName("Test brewery comment mappings")
	void test_brewery_comment_mappings() {
		BreweryComments bc = em.find(BreweryComments.class, 1);
		int i = bc.getUser().getId();
		assertEquals(2, i);

		String s = bc.getDescription();
		assertEquals("would hit it again", s);

		int j = bc.getBrewery().getId();
		assertEquals(1, j);

	}
	
	
	@Test
	@DisplayName("Test timestamp for comment")
	void test_timestamp_for_comment() {
		
		BreweryComments bc = em.find(BreweryComments.class, 1);
		Date d = bc.getDateTime();
		assertEquals("2018-04-27 10:10:02.0", d.toString());
		
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

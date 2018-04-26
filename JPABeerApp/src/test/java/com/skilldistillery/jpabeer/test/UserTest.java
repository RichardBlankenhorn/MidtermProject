package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.jpabeer.entities.User;

class UserTest {


	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	
	@Test
	@DisplayName("Test user mapping")
	void test_user_mappings() {
		User u = em.find(User.class, 2);
		assertEquals("user", u.getUsername());
		
	}
	
	@Test
	@DisplayName("Test user to beer comments mapping")
	void test_user_to_beer_comments_mappings() {
		User u = em.find(User.class, 1);
		int b = u.getBeerComments().get(0).getId();
		assertEquals(1, b);
		String bc = u.getBeerComments().get(0).getDescription();
		assertEquals("hell yeah", bc);
	}
	

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

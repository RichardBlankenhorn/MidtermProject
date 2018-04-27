package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Profile;

class ProfileTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	@Test
	@DisplayName("Test profile user mappings")
	void test_profile_user_mappings() {
		Profile p = em.find(Profile.class, 1);
		String s = p.getFirstName();
		assertEquals("Admin", s);
		int i = p.getUser().getId();
		assertEquals(1, i);

	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}


}

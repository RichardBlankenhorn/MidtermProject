package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Category;


class CategoryTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	
	@Test
	@DisplayName("Test category mapping")
	void test_category_mappings() {

		Category c = em.find(Category.class, 21);
		assertEquals("Imperial IPA", c.getName());
		Category cat = em.find(Category.class, 24);
		assertEquals("Helles", cat.getName());
		
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}
}

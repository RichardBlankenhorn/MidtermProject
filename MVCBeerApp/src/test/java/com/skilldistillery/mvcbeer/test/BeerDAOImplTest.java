package com.skilldistillery.mvcbeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.mvcbeer.data.BeerDAOImpl;


class BeerDAOImplTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private BeerDAOImpl dao;
	
	@BeforeEach
	void setUp() throws Exception {
		dao = new BeerDAOImpl();
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	
	@Test
	@DisplayName("Test retrieve by id method")
	void test_retrieve_by_id_method() {
		Beer b = dao.retrieveById(4);
		assertEquals(6.5, b.getAbv());
		
	}
	
	
	@Test
	@DisplayName("Test retrieve by id method")
	void test_create() {
		Beer b = new Beer();
		b.setName("taco");
		dao.create(b);
		assertEquals("taco", b.getName());
		
	}
	
	

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}

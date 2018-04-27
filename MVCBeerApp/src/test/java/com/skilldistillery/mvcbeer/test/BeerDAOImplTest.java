package com.skilldistillery.mvcbeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.mvcbeer.data.BeerDAOImpl;
import com.skilldistillery.mvcbeer.data.BreweryDAOImpl;


class BeerDAOImplTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private BeerDAOImpl dao;
	private BreweryDAOImpl daob;
	
	@BeforeEach
	void setUp() throws Exception {
		dao = new BeerDAOImpl();
		daob = new BreweryDAOImpl();
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

//	
//	@Test
//	@DisplayName("Test retrieve by id method")
//	void test_retrieve_by_id_method() {
//		Beer b = dao.retrieveById(4);
//		assertEquals(6.5, b.getAbv());
//		
//	}
//	
	
//	@Test
//	@DisplayName("Test retrieve by id method")
//	void test_create() {
//		Beer b = new Beer();
//		b.setName("taco");
//		dao.create(b);
//		assertEquals("taco", b.getName());
//		
//	}
	
	
//	@Test
//	void testy() {
//		List<Beer> result = dao.searchBeerByKeyword("Apricot");
//		assertEquals("Apricot Blonde", result.get(0).getName());
//		
//		List<Brewery> results = daob.getBreweryByKeyword("Renegade");
//		assertEquals("Renegade", results.get(0).getName());
//		
//	}
	
	

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}

package com.skilldistillery.jpabeer.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpabeer.entities.Address;

public class AddressTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("BeerApp");
		em = emf.createEntityManager();
	}

	
	@Test
	@DisplayName("Test address mapping")
	void test_address_mappings() {
		Address a = em.find(Address.class, 3);
		assertEquals("CO", a.getState());
		assertEquals("null", a.getStreet2());
		assertEquals("303-007-8288", a.getPhone());
		
	}

	@AfterEach
	void tearDown() throws Exception {

		em.close();
		emf.close();
	}

}

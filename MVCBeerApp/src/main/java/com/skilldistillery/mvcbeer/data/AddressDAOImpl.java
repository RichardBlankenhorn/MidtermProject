package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Address;

@Transactional
@Component
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Address create(Address address) {
		em.persist(address);
		em.flush();
		return address;
	}

	@Override
	public List<Address> retrieveAllAddresses() {
		String query = "SELECT a From Address a";
		List<Address> allAddresses = em.createQuery(query, Address.class).getResultList();
		return allAddresses;
	}

	@Override
	public Address updateAddress(int id, Address address) {
		Address a = em.find(Address.class, id);
		a.setLatitude(address.getLatitude());
		a.setLongitude(address.getLongitude());
		a.setStreet(address.getStreet());
		a.setStreet2(address.getStreet2());
		a.setCity(address.getCity());
		a.setState(address.getState());
		a.setZip(address.getZip());
		a.setPhone(address.getPhone());

		em.persist(a);
		em.flush();

		return a;
	}

	@Override
	public boolean deleteAddress(int id) {
		boolean deleted = false;
		Address a = em.find(Address.class, id);
		try {
			em.remove(a);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Beer not found.");
		}
		return deleted;

	}
}

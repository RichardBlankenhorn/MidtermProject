package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.Address;


public interface AddressDAO {
	
	
	public Address create(Address address);
	
	public List<Address> retrieveAllAddresses();
	
	public Address updateAddress(int id, Address address);
	
	public boolean deleteAddress(int id);
	

}

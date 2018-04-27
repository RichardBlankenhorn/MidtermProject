package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.Profile;


public interface ProfileDAO {
	
	public Profile retrieveById(int id); 
	
	public Profile create(Profile profile);
	
	public List<Profile> retrieveAllProfiles();
	
	public Profile updateProfile(int id, Profile profile);
	
	public boolean deleteProfile(int id);

}

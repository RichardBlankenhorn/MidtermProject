package com.skilldistillery.mvcbeer.data;

import java.util.List;

import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.jpabeer.entities.Profile;
import com.skilldistillery.jpabeer.entities.User;
import com.skilldistillery.jpabeer.entities.UserDTO;


public interface UserDAO {
	
	public User retrieveById(int id); 
	
	public User create(User user);
	
	public List<User> retrieveAllUsers();
	
	public User updateUser(int id, User user);
	
	public boolean deleteUser(int id);
	
	public User retrieveByUsername(String username);
	
	public List<Profile> retrieveProfileByUsername(String username);
	
	public Profile createUser(UserDTO dto);
	
	public boolean updatePassword(int id, String password);
	
	public List<Object> updateProfile(int userId, int profileId, String firstName, String lastName, String email, String username);
	
	public List<BeerComments> retrieveBeerCommentsByUser(int userId);
	
	public List<BeerComments> retrieveAllBeerComments();

}

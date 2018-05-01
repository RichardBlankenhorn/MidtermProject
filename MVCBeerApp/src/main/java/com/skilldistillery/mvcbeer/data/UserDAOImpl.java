package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Profile;
import com.skilldistillery.jpabeer.entities.User;
import com.skilldistillery.jpabeer.entities.UserDTO;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User retrieveById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public User create(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public List<User> retrieveAllUsers() {
		String query = "SELECT username FROM User";
		List<User> allUsers = em.createQuery(query, User.class).getResultList();
		return allUsers;
	}

	@Override
	public User updateUser(int id, User user) {
		User u = em.find(User.class, id);
		u.setUsername(user.getUsername());
		u.setPassword(user.getPassword());

		em.persist(u);
		em.flush();

		return u;
	}

	@Override
	public boolean deleteUser(int id) {
		boolean deleted = false;
		User u = em.find(User.class, id);
		try {
			em.remove(u);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("User not found.");
		}
		return deleted;
	}

	@Override
	public User retrieveByUsername(String username) {
		String query = "Select u from User u where u.username = :username";
		User u = null;
		if (em.createQuery(query, User.class).setParameter("username", username).getResultList().size() != 0) {
			u = em.createQuery(query, User.class).setParameter("username", username).getResultList().get(0);
		}

		return u;
	}

	@Override
	public List<Profile> retrieveProfileByUsername(String username) {
		String query = "SELECT p FROM Profile p WHERE p.user.username = :username";
		List<Profile> profile = em.createQuery(query, Profile.class).setParameter("username", username).getResultList();
		return profile;
	}

	@Override
	public Profile createUser(UserDTO dto) {
		User u = new User();
		u.setUsername(dto.getUsername());
		u.setPassword(dto.getPassword());

		Profile p = new Profile();
		p.setFirstName(dto.getFirstName());
		p.setLastName(dto.getLastName());
		p.setEmail(dto.getEmail());
		p.setUser(u);

		em.persist(p);
		em.flush();
		return p;
	}

	@Override
	public boolean updatePassword(int id, String password) {
		try {
			User u = em.find(User.class, id);
			u.setPassword(password);
			em.flush();
			em.persist(u);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}

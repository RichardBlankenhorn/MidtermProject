package com.skilldistillery.mvcbeer.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpabeer.entities.Category;

@Transactional
@Component
public class CategoryDAOImpl implements CategoryDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Category retrieveById(int id) {
		return em.find(Category.class, id);
	}

	@Override
	public Category create(Category category) {
		em.persist(category);
		em.flush();
		return category;
	}

	@Override
	public List<Category> retrieveAllCategories() {
		String query = "SELECT c FROM Category c";
		List<Category> allCategories = em.createQuery(query, Category.class).getResultList();
		return allCategories;
	}

	@Override
	public Category updateCategory(int id, Category category) {
		Category c = em.find(Category.class, id);
		c.setName(category.getName());
		
		em.persist(c);
		em.flush();
		return c;
	}

	@Override
	public boolean deleteCategory(int id) {
		boolean deleted = false;
		Category c = em.find(Category.class, id);
		try {
			em.remove(c);
			deleted = true;
		} catch (IllegalArgumentException iae) {
			System.out.println("Category not found.");
		}
		return deleted;
	}

	@Override
	public List<Category> getCategoryByKeyword(String keyword) {
		String query = "SELECT c FROM Category c WHERE c.name like :keyword";
		List<Category> results = em.createQuery(query, Category.class).setParameter("keyword", "%"+keyword+"%").getResultList();
		return results;
	}

}

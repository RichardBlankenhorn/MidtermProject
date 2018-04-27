package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.Category;
import com.skilldistillery.mvcbeer.data.BeerDAO;
import com.skilldistillery.mvcbeer.data.CategoryDAO;

@Controller
public class BeerController {
	 @Autowired
	 private BeerDAO beerDao;
	 @Autowired
	 private CategoryDAO catDao;

	public BeerDAO getDao() {
		return beerDao;
	}


	public void setDao(BeerDAO dao) {
		this.beerDao = dao;
	}


	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<Category> categoryList = catDao.retrieveAllCategories(); 
		mv.addObject("categoryList", categoryList);
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;
	}

	
	@RequestMapping(path = "listBeers.do", params="keyword", method = RequestMethod.GET) 
	public ModelAndView listBeers(@RequestParam(name="keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		if (keyword != "") {
			List<Beer> listBeer = beerDao.searchBeerByKeyword(keyword); 
			if (listBeer != null) {
				mv.addObject("listBeer", listBeer); 
				mv.setViewName("WEB-INF/views/list_beers.jsp");
			}
			else {
				mv.setViewName("WEB-INF/views/index.jsp");
				//figure out how to send error messages
			}
		}
		else {
			List<Beer> listBeer = beerDao.retrieveAllBeer(); 
			if (listBeer != null) {
				mv.addObject("listBeer", listBeer); 
				mv.setViewName("WEB-INF/views/list_beers.jsp");
			}
			else {
				mv.setViewName("WEB-INF/views/index.jsp");
				//figure out how to send error message 
			}
		}
		return mv;
	}
	
	@RequestMapping(path = "listBeersByCategory.do", params="category", method= RequestMethod.GET)
	public ModelAndView listCategories(@RequestParam(name="category") String category) {
		ModelAndView mv = new ModelAndView();
		List<Beer> listBeer = beerDao.searchBeerByCategeory(category); 
		mv.addObject("listBeer", listBeer); 
		mv.setViewName("WEB-INF/views/list_beers.jsp");
		return mv;
	}
	@RequestMapping(path="beer.do", params= "id", method=RequestMethod.GET)
	public ModelAndView beer(@RequestParam(name="id") int id) {
		ModelAndView mv = new ModelAndView();
		Beer beer = beerDao.retrieveById(id); 
		if (beer != null) {
			mv.addObject("beer", beer); 
			mv.setViewName("WEB-INF/views/beer.jsp");
		}
		else {
			mv.setViewName("WEB-INF/views/list_beers.jsp");
			//figure out how to send error messages
		}
		
		return mv;
	}
}

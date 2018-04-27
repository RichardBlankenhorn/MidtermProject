package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.mvcbeer.data.BeerDAO;

@Controller
public class BeerController {
	 @Autowired
	 private BeerDAO dao;

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		//call dao method that returns list of categories
		//mv.addObject(list of categories)
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;
	}

	
	@RequestMapping(path = "listBeers.do", params="keyword", method = RequestMethod.GET) 
	public ModelAndView listBeers(@RequestParam(name="keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		if (keyword != "") {
			//call dao method to retrieve list of beers by name/keyword
			// add list to model (call it listBeer)
			mv.setViewName("WEB-INF/views/list_beers.jsp");
		}
		else {
			List<Beer> listBeer = dao.retrieveAllBeer(); 
			if (listBeer != null) {
				mv.addObject(listBeer); 
				mv.setViewName("WEB-INF/views/list_beers.jsp");
			}
			else {
				mv.setViewName("WEB-INF/views/index.jsp");
				//figure out how to send error message 
			}
		}
		return mv;
	}
	
	@RequestMapping(path = "listBeersByCategory.do", method= RequestMethod.GET)
	public ModelAndView listCategories() {
		ModelAndView mv = new ModelAndView();
		//call dao method to return list of beers for a selected category
		//add list object to model (call it listBeer)
		mv.setViewName("WEB-INF/views/list_beers.jsp");
		return mv;
	}
}

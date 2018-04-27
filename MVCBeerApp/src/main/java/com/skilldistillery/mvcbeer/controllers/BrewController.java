package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.mvcbeer.data.BreweryDAO;

@Controller
public class BrewController {
	@Autowired
	private BreweryDAO dao;
	
	public BreweryDAO getDao() {
		return dao;
	}

	public void setDao(BreweryDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(path = "listBreweries.do", params= "keyword", method = RequestMethod.GET)
	public ModelAndView listBrew(@RequestParam(name="keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		if (keyword != "") {
			//call dao method to retrieve list of breweries by name/keyword
			//add list to model (call it brewList)
			mv.setViewName("WEB-INF/views/list_breweries.jsp");
		} 
		else {
			List<Brewery> brewList = dao.retrieveAllBreweries(); 
			if (brewList != null) {
				mv.addObject(brewList); 
				mv.setViewName("WEB-INF/views/list_breweries.jsp");
			}
			else {
				mv.setViewName("WEB-INF/views/index.jsp");
				// figure out how to send error message
			}
		}
		return mv;
	}
}

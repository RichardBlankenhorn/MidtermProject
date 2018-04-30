package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Address;
import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.mvcbeer.data.AddressDAO;
import com.skilldistillery.mvcbeer.data.BreweryDAO;

@Controller
public class BrewController {
	@Autowired
	private BreweryDAO dao;
	
	@Autowired
	private AddressDAO adao;
	
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
			List<Brewery> brewList = dao.getBreweryByKeyword(keyword); 
			if (brewList != null) {
				mv.addObject("brewList", brewList); 
				mv.setViewName("WEB-INF/views/list_breweries.jsp");
			}
			else {
				mv.setViewName("WEB-INF/views/index.jsp");
				//figure out how to send error message
			}
		} 
		else {
			List<Brewery> brewList = dao.retrieveAllBreweries(); 
			if (brewList != null) {
				mv.addObject("brewList", brewList); 
				mv.setViewName("WEB-INF/views/list_breweries.jsp");
			}
			else {
				mv.setViewName("WEB-INF/views/index.jsp");
				// figure out how to send error message
			}
		}
		return mv;
	}
	@RequestMapping(path="brewery.do", params= "id", method=RequestMethod.GET)
	public ModelAndView brewery(@RequestParam(name="id") int id) {
		ModelAndView mv = new ModelAndView();
		Brewery brewery = dao.retrieveById(id); 
		if (brewery != null) {
			mv.addObject("brewery", brewery); 
			mv.setViewName("WEB-INF/views/brewery.jsp");
		}
		else {
			mv.setViewName("WEB-INF/views/list_breweries.jsp");
			//figure out how to send error message
		}
		return mv;
	}
	
	
	@RequestMapping(path="addBrewery.do", method=RequestMethod.POST)
	public ModelAndView addBrewery(Brewery brewery, Address address) {
		ModelAndView mv = new ModelAndView();
		Brewery b = dao.create(brewery);
		Address a = adao.create(address);
		
		mv.addObject("brewery", brewery);
		mv.addObject("address", address);
		
		mv.setViewName("WEB-INF/views/add_brewery.jsp");
		
		return mv;
	}
}

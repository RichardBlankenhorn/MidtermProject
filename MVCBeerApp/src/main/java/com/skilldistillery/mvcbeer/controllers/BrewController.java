package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Address;
import com.skilldistillery.jpabeer.entities.AddressDTO;
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

	@RequestMapping(path = "listBreweries.do", params = "keyword", method = RequestMethod.GET)
	public ModelAndView listBrew(@RequestParam(name = "keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		if (keyword != "") {
			List<Brewery> brewList = dao.getBreweryByKeyword(keyword);
			if (brewList != null) {
				mv.addObject("brewList", brewList);
				mv.setViewName("WEB-INF/views/list_breweries.jsp");
			} else {
				mv.setViewName("WEB-INF/views/index.jsp");
				// figure out how to send error message
			}
		} else {
			List<Brewery> brewList = dao.retrieveAllBreweries();
			if (brewList != null) {
				mv.addObject("brewList", brewList);
				mv.setViewName("WEB-INF/views/list_breweries.jsp");
			} else {
				mv.setViewName("WEB-INF/views/index.jsp");
				// figure out how to send error message
			}
		}
		return mv;
	}

	@RequestMapping(path = "brewery.do", params = "id", method = RequestMethod.GET)
	public ModelAndView brewery(@RequestParam(name = "id") int id) {
		ModelAndView mv = new ModelAndView();
		Brewery brewery = dao.retrieveById(id);
		if (brewery != null) {
			mv.addObject("brewery", brewery);
			mv.setViewName("WEB-INF/views/brewery.jsp");
		} else {
			mv.setViewName("WEB-INF/views/list_breweries.jsp");
			// figure out how to send error message
		}
		return mv;
	}

	@RequestMapping(path = "addBrewery.do", method = RequestMethod.GET)
	public ModelAndView addBreweryGet() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/add_brewery.jsp");
		
		return mv;
	}
	@RequestMapping(path = "addBrewery.do", method = RequestMethod.POST)
	public ModelAndView addBrewery(@RequestParam(name = "name") String name,
			@RequestParam(name = "description") String description, 
			Address address, AddressDTO dto) {
		ModelAndView mv = new ModelAndView();
		Brewery b = dao.createAddressAndBrewery(dto);
		mv.addObject("brewery", b);
		mv.setViewName("WEB-INF/views/brewery.jsp");

		return mv;
	}
	
	@RequestMapping(path="editBrewery.do", method = RequestMethod.GET)
	public ModelAndView showBreweryForm(@RequestParam(name="id") int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.addObject("brewery", dao.retrieveById(id));
		mv.setViewName("WEB-INF/views/edit_brewery.jsp");
		
		return mv;
	}
	@RequestMapping(path="editBreweryForm.do", method = RequestMethod.POST)
	public ModelAndView editBrewery(@RequestParam(name="id") int id, AddressDTO dto) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("brewery", dao.updateBrewery(id, dto));
		mv.setViewName("WEB-INF/views/brewery.jsp");
		
		return mv;
	}
	@RequestMapping(path="deleteBrewery.do", method = RequestMethod.POST)
	public ModelAndView deleteBrewery(@RequestParam(name="id") int id) {
		ModelAndView mv = new ModelAndView();
		boolean b = dao.deleteBrewery(id);
		mv.addObject("deleted", b);
		mv.setViewName("WEB-INF/views/delete_brewery.jsp");
		
		return mv;
	}
}

package com.skilldistillery.mvcbeer.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BrewController {
	//@Autowired
	//private BrewDAO dao;
	
	@RequestMapping(path = "listBreweries.do", params= "keyword", method = RequestMethod.GET)
	public ModelAndView listBrew(@RequestParam(name="keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		if (keyword != "") {
			//call dao method to retrieve list of breweries by name/keyword
			//add list to model (call it brewList)
			mv.setViewName("WEB-INF/views/list_breweries.jsp");
		} 
		else {
			//call dao method to retrieve list of all breweries
			//add list to model (call it brewList)
			mv.setViewName("WEB-INF/views/list_breweries.jsp");
		}
		return mv;
	}
}

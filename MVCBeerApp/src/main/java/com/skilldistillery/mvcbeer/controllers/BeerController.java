package com.skilldistillery.mvcbeer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvcbeer.data.BeerDAO;

@Controller
public class BeerController {
//	@Autowired
//	private BeerDAO dao; 
	
	@RequestMapping(path="index.do", method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/index.jsp");
		return mv;
	}
	@RequestMapping(path="test.do", method=RequestMethod.GET)
	public ModelAndView test() {
		System.out.println("In Controller");
		ModelAndView mv = new ModelAndView();
	
		return mv;
	}
}

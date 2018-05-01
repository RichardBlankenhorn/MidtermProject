package com.skilldistillery.mvcbeer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.mvcbeer.data.CommentsDAO;

@Controller
public class CommentsController {

	@Autowired
	private CommentsDAO commentsDAO;

	@RequestMapping(path = "addBeerComment.do", method = RequestMethod.POST)
	public ModelAndView addComment(@RequestParam(name = "id") int id, @RequestParam(name = "beerId") int beerId,
			@RequestParam(name = "beerComment") String beerComment) {
		ModelAndView mv = new ModelAndView();
		
		BeerComments bc = commentsDAO.createBeerComments(id, beerId, beerComment);
		
		
		mv.addObject("beerComment", bc);
		mv.setViewName("WEB-INF/views/beer.jsp");
		
		return mv;

	}

}

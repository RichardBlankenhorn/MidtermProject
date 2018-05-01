package com.skilldistillery.mvcbeer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.BeerComments;
import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.jpabeer.entities.BreweryComments;
import com.skilldistillery.jpabeer.entities.User;
import com.skilldistillery.mvcbeer.data.BeerDAO;
import com.skilldistillery.mvcbeer.data.BreweryDAO;
import com.skilldistillery.mvcbeer.data.CommentsDAO;

@Controller
public class CommentsController {

	@Autowired
	private CommentsDAO commentsDAO;
	
	@Autowired
	private BeerDAO beerDAO;
	
	@Autowired
	private BreweryDAO breweryDAO;

	@RequestMapping(path = "addBeerComment.do", method = RequestMethod.POST)
	public ModelAndView addComment(HttpSession session, @RequestParam(name = "beerId") int beerId,
			@RequestParam(name = "beerComment") String beerComment) {
		ModelAndView mv = new ModelAndView();
		User u = (User) session.getAttribute("user");
		commentsDAO.createBeerComments(u.getId(), beerId, beerComment);
		
		mv.addObject("beer", beerDAO.retrieveById(beerId));
		mv.addObject("listComments", commentsDAO.retrieveAllBeerComments(beerId));
		mv.setViewName("WEB-INF/views/beer.jsp");
		
		return mv;

	}
	
	@RequestMapping(path = "editBeerCommentForm.do", method = RequestMethod.GET)
	public ModelAndView editBeerComment(@RequestParam(name = "beerCommentId") int beerCommentId) {
		ModelAndView mv = new ModelAndView();
//		BeerComments bc = new BeerComments();
		mv.addObject("beerComment", commentsDAO.retrieveBeerCommentById(beerCommentId));
		mv.setViewName("WEB-INF/views/edit_beer_comment.jsp");
		
		return mv;
		
	}
	@RequestMapping(path = "editBeerComment.do", method = RequestMethod.POST)
	public ModelAndView addComment(@RequestParam(name = "id") int id, @RequestParam(name = "beerId") int beerId, BeerComments beerComment) {
		ModelAndView mv = new ModelAndView();
		
		commentsDAO.updateBeerComments(id, beerComment);
		Beer beer = beerDAO.retrieveById(beerId);
		
		mv.addObject("listComments", commentsDAO.retrieveAllBeerComments(beerId));
		mv.addObject("beer", beer);
		mv.setViewName("WEB-INF/views/beer.jsp");
		
		return mv;
		
	}
	
	@RequestMapping(path = "deleteBeerComment.do", method = RequestMethod.GET)
	public ModelAndView deleteComment(@RequestParam(name = "id") int id, @RequestParam(name = "beerId") int beerId) {
		ModelAndView mv = new ModelAndView();
		boolean b = commentsDAO.deleteBeerComment(id);
		Beer beer = beerDAO.retrieveById(beerId);
		mv.addObject("deletedComment", b);
		mv.addObject("listComments", commentsDAO.retrieveAllBeerComments(beerId));
		mv.addObject("beer", beer);
		mv.setViewName("WEB-INF/views/beer.jsp");
		return mv;
		
	}
	
	@RequestMapping(path = "addBreweryComment.do", method = RequestMethod.POST)
	public ModelAndView addBreweryComment(HttpSession session, @RequestParam(name = "breweryId") int breweryId,
			@RequestParam(name = "breweryComment") String breweryComment) {
		ModelAndView mv = new ModelAndView();
		User u = (User) session.getAttribute("user");
		commentsDAO.createBreweryComments(u.getId(), breweryId, breweryComment);
		
		mv.addObject("brewery", breweryDAO.retrieveById(breweryId));
		mv.addObject("listComments", commentsDAO.retrieveAllBreweryComments(breweryId));
		mv.setViewName("WEB-INF/views/brewery.jsp");
		
		return mv;

	}
	
	
	@RequestMapping(path = "editBreweryCommentForm.do", method = RequestMethod.GET)
	public ModelAndView editBreweryComment(@RequestParam(name = "breweryCommentId") int breweryCommentId) {
		ModelAndView mv = new ModelAndView();
//		BeerComments bc = new BeerComments();
		mv.addObject("breweryComment", commentsDAO.retrieveBreweryCommentById(breweryCommentId));
		mv.setViewName("WEB-INF/views/edit_brewery_comment.jsp");
		
		return mv;
		
	}
	
	@RequestMapping(path = "editBreweryComment.do", method = RequestMethod.POST)
	public ModelAndView editBreweryComment(@RequestParam(name = "id") int id, @RequestParam(name = "breweryId") int breweryId, BreweryComments breweryComment) {
		ModelAndView mv = new ModelAndView();
		
		commentsDAO.updateBreweryComments(id, breweryComment);
		Brewery brewery = breweryDAO.retrieveById(breweryId);
		
		mv.addObject("listComments", commentsDAO.retrieveAllBreweryComments(breweryId));
		mv.addObject("brewery", brewery);
		mv.setViewName("WEB-INF/views/brewery.jsp");
		
		return mv;
		
	}
	
	@RequestMapping(path = "deleteBreweryComment.do", method = RequestMethod.GET)
	public ModelAndView deleteBreweryComment(@RequestParam(name = "id") int id, @RequestParam(name = "breweryId") int breweryId) {
		ModelAndView mv = new ModelAndView();
		boolean b = commentsDAO.deleteBreweryComment(id);
		Brewery brewery = breweryDAO.retrieveById(breweryId);
		mv.addObject("deletedComment", b);
		mv.addObject("listComments", commentsDAO.retrieveAllBreweryComments(breweryId));
		mv.addObject("brewery", brewery);
		mv.setViewName("WEB-INF/views/brewery.jsp");
		return mv;
		
	}
	
	

}

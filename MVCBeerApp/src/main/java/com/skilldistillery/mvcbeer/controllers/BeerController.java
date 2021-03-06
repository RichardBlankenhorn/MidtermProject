package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Beer;
import com.skilldistillery.jpabeer.entities.BeerDTO;
import com.skilldistillery.jpabeer.entities.Brewery;
import com.skilldistillery.jpabeer.entities.Category;
import com.skilldistillery.mvcbeer.data.BeerDAO;
import com.skilldistillery.mvcbeer.data.BreweryDAO;
import com.skilldistillery.mvcbeer.data.CategoryDAO;
import com.skilldistillery.mvcbeer.data.CommentsDAO;

@Controller
public class BeerController {
	@Autowired
	private BeerDAO beerDao;
	@Autowired
	private CategoryDAO catDao;
	@Autowired
	private BreweryDAO breweryDao;
	@Autowired
	private CommentsDAO commentsDao;

	public BeerDAO getDao() {
		return beerDao;
	}

	public void setDao(BeerDAO dao) {
		this.beerDao = dao;
	}

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<Beer> beers = beerDao.retrieveAllBeer();
		List<Brewery> breweries = breweryDao.retrieveAllBreweries();
		List<Category> categories = catDao.retrieveAllCategories();
		mv.addObject("categories", categories);
		// session.setAttribute("categories", categories);
		mv.addObject("breweries", breweries);
		// session.setAttribute("breweries", breweries);
		mv.addObject("beers", beers);
		// session.setAttribute("beers", beers);
		mv.setViewName("WEB-INF/views/css_index.jsp");
		return mv;
	}

	@RequestMapping(path = "index.do", method = RequestMethod.GET, params = { "brewery", "category" })
	public ModelAndView index(@RequestParam(name = "brewery") String brewery,
			@RequestParam(name = "category") String category) {
		ModelAndView mv = new ModelAndView();
		List<Beer> beers;
		List<Brewery> breweries = breweryDao.retrieveAllBreweries();
		List<Category> categories = catDao.retrieveAllCategories();
		if (!category.equals("") && !brewery.equals("")) {
			beers = beerDao.searchBeerByBreweryAndCategory(category, brewery);
			if (!beers.isEmpty()) {
				mv.addObject("beers", beers);
				mv.addObject("category", category);
				mv.addObject("brewery", brewery);
				mv.addObject("breweryId", beers.get(0).getBrewery().getId());
			}
			else {
				mv.addObject("message", "no results found");
			}
			
		} else if (!category.equals("")) {
			beers = beerDao.searchBeerByCategeory(category);
			mv.addObject("beers", beers);
			mv.addObject("category", category);
		} else if (!brewery.equals("")) {
			beers = beerDao.searchBeerByBrewery(brewery);
			mv.addObject("beers", beers);
			mv.addObject("brewery", brewery);
			mv.addObject("breweryId", beers.get(0).getBrewery().getId());
		} else if (category.equals("") && brewery.equals("")) {
			beers = beerDao.retrieveAllBeer();
			mv.addObject("beers", beers);
		}
		mv.addObject("categories", categories);
		mv.addObject("breweries", breweries);
		mv.setViewName("WEB-INF/views/css_index.jsp");
		return mv;
	}

	@RequestMapping(path = "listBeers.do", params = "keyword", method = RequestMethod.GET)
	public ModelAndView listBeers(@RequestParam(name = "keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		if (keyword != "") {
			List<Beer> beers = beerDao.searchBeerByKeyword(keyword);
			List<Brewery> breweries = breweryDao.retrieveAllBreweries();
			List<Category> categories = catDao.retrieveAllCategories();
			if (beers != null) {
				mv.addObject("beers", beers);
				mv.addObject("categories", categories);
				mv.addObject("breweries", breweries);
				mv.setViewName("WEB-INF/views/css_index.jsp");
			} else {
				mv.setViewName("redirect: index.do");
				// figure out how to send error messages
			}
		} else {
			List<Beer> beers = beerDao.retrieveAllBeer();
			if (beers != null) {
				mv.addObject("beers", beers);
				mv.setViewName("redirect: index.do");
			} else {
				mv.setViewName("redirect: index.do");
				// figure out how to send error message
			}
		}
		return mv;
	}

	@RequestMapping(path = "searchBeerByKeyword.do", method = RequestMethod.GET)
	public ModelAndView searchBeer() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/search_beer.jsp");
		return mv;
	}

	@RequestMapping(path = "listBeersByCategory.do", params = "category", method = RequestMethod.GET)
	public ModelAndView listCategories(@RequestParam(name = "category") String category) {
		ModelAndView mv = new ModelAndView();
		List<Beer> listBeer = beerDao.searchBeerByCategeory(category);
		mv.addObject("listBeer", listBeer);
		mv.setViewName("WEB-INF/views/list_beers.jsp");
		return mv;
	}

	@RequestMapping(path = "beer.do", params = "id", method = RequestMethod.GET)
	public ModelAndView beer(@RequestParam(name = "id") int id) {
		ModelAndView mv = new ModelAndView();
		Beer beer = beerDao.retrieveById(id);
		if (beer != null) {
			mv.addObject("beer", beer);
			mv.addObject("listComments", commentsDao.retrieveAllBeerComments(id));
			mv.setViewName("WEB-INF/views/beer.jsp");
		} else {
			mv.setViewName("WEB-INF/views/list_beers.jsp");
			// figure out how to send error messages
		}

		return mv;
	}

	@RequestMapping(path = "updateBeer.do", method = RequestMethod.GET)
	public ModelAndView updateBeer(@RequestParam(name = "id") int id) {
		ModelAndView mv = new ModelAndView();
		Beer beer = beerDao.retrieveById(id);
		List<Category> categories = catDao.retrieveAllCategories();
		mv.addObject("categoryList", categories);
		// session.setAttribute("categoryList", categories);
		mv.addObject("beer", beer);
		mv.setViewName("WEB-INF/views/edit_beer.jsp");
		return mv;
	}

	@RequestMapping(path = "updateBeer.do", method = RequestMethod.POST)
	public ModelAndView updateBeerDB(@RequestParam(name = "id") int id, BeerDTO dto) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("beer", beerDao.updateBeer(id, dto));
		mv.addObject("listComments", commentsDao.retrieveAllBeerComments(id));
		mv.setViewName("WEB-INF/views/beer.jsp");
		return mv;
	}

	@RequestMapping(path = "addBeerButton.do", method = RequestMethod.GET)
	public ModelAndView addBeerGet() {
		ModelAndView mv = new ModelAndView();
		List<Category> categories = catDao.retrieveAllCategories();
		List<Brewery> breweries = breweryDao.retrieveAllBreweries();

		mv.addObject("breweryList", breweries);
		mv.addObject("categoryList", categories);
		mv.setViewName("WEB-INF/views/add_beer.jsp");
		return mv;
	}

	@RequestMapping(path = "addBeer.do", method = RequestMethod.POST)
	public ModelAndView addBeerPost(BeerDTO dto) {
		ModelAndView mv = new ModelAndView();
		Beer beer = beerDao.createBeer(dto);
		mv.addObject("beer", beer);
		mv.setViewName("WEB-INF/views/beer.jsp");
		return mv;
	}

	@RequestMapping(path = "deleteBeer.do", method = RequestMethod.POST)
	public ModelAndView deleteBeer(@RequestParam(name = "id") int id) {
		ModelAndView mv = new ModelAndView();
		boolean b = beerDao.deleteBeer(id);
		mv.addObject("deleted", b);
		mv.setViewName("redirect: index.do");

		return mv;
	}

	@RequestMapping(path = "about.do", method = RequestMethod.GET)
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/about.jsp");
		return mv;
	}

}

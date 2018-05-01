package com.skilldistillery.mvcbeer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpabeer.entities.Profile;
import com.skilldistillery.jpabeer.entities.User;
import com.skilldistillery.jpabeer.entities.UserDTO;
import com.skilldistillery.mvcbeer.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/login.jsp");
		return mv;
	}

	@RequestMapping(path = "loginUser.do", method = RequestMethod.POST)
	public ModelAndView loginUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// Implement DAO to obtain user by username and password
		User u = dao.retrieveByUsername(username);
		if (u != null && u.getPassword().equals(password)) {
			List<Profile> profile = dao.retrieveProfileByUsername(u.getUsername());
			if (u.isAdmin()) {
				session.setAttribute("admin", u);
			} else {
				session.setAttribute("user", u);
			}
			session.setAttribute("profile", profile.get(0));
			mv.setViewName("WEB-INF/views/profile.jsp");
		} else {
			mv.addObject("failed", "Invalid credentials");
			mv.setViewName("WEB-INF/views/login.jsp");

		}
		return mv;
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("user");
		session.removeAttribute("admin");
		mv.setViewName("redirect:index.do");
		return mv;
	}

	// @RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	// public ModelAndView createAccount(User user) {
	// ModelAndView mv = new ModelAndView();
	// User u = dao.retrieveByUsername(user.getUsername());
	// if (u == null) {
	// u = dao.create(user);
	// mv.addObject("user", u);
	// mv.setViewName("WEB-INF/views/accountCreated.jsp");
	// } else {
	// mv.addObject("failed", "Username is already taken.");
	// mv.setViewName("WEB-INF/views/create_account.jsp");
	// }
	//
	// return mv;
	// }
	//
	@RequestMapping(path = "createAccount.do", method = RequestMethod.GET)
	public ModelAndView createAccount1() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/create_account.jsp");

		return mv;
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public ModelAndView createUser(HttpSession session, UserDTO dto) {
		ModelAndView mv = new ModelAndView();
		if (dao.retrieveByUsername(dto.getUsername()) == null) {
			Profile p = dao.createUser(dto);
			session.setAttribute("user", p.getUser());
			mv.setViewName("WEB-INF/views/profile.jsp");
		} else {
			mv.addObject("failed", "Username is already taken.");
			mv.setViewName("WEB-INF/views/create_account.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "profile.do", method = RequestMethod.GET)
	public ModelAndView goToProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/profile.jsp");
		return mv;
	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.GET)
	public ModelAndView updateProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/editProfile.jsp");
		return mv;
	}

	@RequestMapping(path = "updateProfile.do", method = RequestMethod.POST)
	public ModelAndView updateProfile(@RequestParam(name = "firstName") String firstName,
			@RequestParam(name = "lastName") String lastName, @RequestParam(name = "email") String email,
			@RequestParam(name = "username") String username, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = (User) session.getAttribute("user");
		Profile p = (Profile) session.getAttribute("profile");
		String message = null;
		List<Object> results = dao.updateProfile(u.getId(), p.getId(), firstName, lastName, email, username);
		if (!results.isEmpty()) {
			message = "Update Successful";
			session.setAttribute("user", results.get(0));
			session.setAttribute("profile", results.get(1));
		} else {
			message = "Update Unsuccessful";
		}
		mv.addObject("message", message);
		mv.setViewName("WEB-INF/views/editProfile.jsp");
		return mv;
	}

	@RequestMapping(path = "changePassword.do", method = RequestMethod.GET)
	public ModelAndView changePassword() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/changePassword.jsp");
		return mv;
	}

	@RequestMapping(path = "changePassword.do", method = RequestMethod.POST)
	public ModelAndView changePassword(@RequestParam(name = "password") String password,
			@RequestParam(name = "passwordconfirm") String passwordconfirm, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String message = null;
		if (password.equals(passwordconfirm)) {
			User u = (User) session.getAttribute("user");
			if (dao.updatePassword(u.getId(), password)) {
				message = "Password Change Successful";
			} else {
				message = "Password Change Not Successful";
			}
		} else {
			message = "Passwords Did Not Match";
		}
		mv.addObject("message", message);
		mv.setViewName("WEB-INF/views/changePassword.jsp");
		return mv;
	}

}

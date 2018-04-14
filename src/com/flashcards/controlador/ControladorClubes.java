package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionClubes;
import com.flashcards.modelo.Club;

@Controller
public class ControladorClubes {
	@RequestMapping(value = "/crearClub", method = RequestMethod.POST)
	public ModelAndView crearClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = new Club(request.getParameter("nClub"), request.getParameter("usuario"));
		gC.crearClub(club);
		ModelAndView vistaClubes = new ModelAndView("clubes");
		vistaClubes.addObject("usuario", request.getParameter("usuario"));
		vistaClubes.addObject("clubes", gC.leerClubes());
		return vistaClubes;
	}
	
	@RequestMapping(value = "/verClub", method = RequestMethod.POST)
	public ModelAndView verClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		ModelAndView verClub = new ModelAndView("club");
		verClub.addObject("usuario", request.getParameter(("usuario")));
		verClub.addObject("club", gC.leerClub(request.getParameter(("club"))));
		return verClub;
	}
}

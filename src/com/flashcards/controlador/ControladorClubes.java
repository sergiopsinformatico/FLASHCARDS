package com.flashcards.controlador;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionAcceso;
import com.flashcards.dao.GestionClubes;
import com.flashcards.dao.GestionInvitaciones;
import com.flashcards.modelo.Club;
import com.flashcards.modelo.Invitacion;
import com.flashcards.modelo.SolicitudAcceso;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorClubes {
	@RequestMapping(value = "/crearClub", method = RequestMethod.POST)
	public ModelAndView crearClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = new Club(request.getParameter("nClub"), request.getParameter("usuario"));
		gC.crearClub(club);
		ModelAndView vistaClubes = new ModelAndView("clubes");
		gC = new GestionClubes();
		vistaClubes.addObject("usuario", request.getParameter("usuario"));
		vistaClubes.addObject("clubes", gC.leerClubes());
		return vistaClubes;
	}
	
	@RequestMapping(value = "/verClub", method = RequestMethod.POST)
	public ModelAndView verClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		ModelAndView verClub = new ModelAndView("club");
		//verClub.addObject("usuario", request.getParameter(("usuario")));
		verClub.addObject("club", gC.leerClub(request.getParameter(("club"))));
		verClub.addObject("pertenece", gC.pertenece(((Usuario)(request.getSession().getAttribute("usuario"))).getUsuario(), request.getParameter("club")));
		return verClub;
	}
	
	@RequestMapping(value = "/incluirMiembro", method = RequestMethod.POST)
	public ModelAndView incluirMiembro(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClub(request.getParameter("club"));
		club.insertarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		
		ModelAndView verClub = new ModelAndView("club");
		verClub.addObject("usuario", request.getParameter(("usuario")));
		verClub.addObject("club", gC.leerClub(request.getParameter(("club"))));
		verClub.addObject("pertenece", gC.pertenece(request.getParameter(("usuario")), request.getParameter(("club"))));
		return verClub;
	}
	
	@RequestMapping(value = "/invitarPersonaClub", method = RequestMethod.POST)
	public ModelAndView invitarPersonaClub(HttpServletRequest request, HttpServletResponse response) {
		Invitacion invitacion = new Invitacion(request.getParameter("usuario"), request.getParameter("recibe"), request.getParameter("club"));
		GestionInvitaciones gI = new GestionInvitaciones();
		gI.insertarInvitacion(invitacion);

		GestionClubes gC = new GestionClubes();
		ModelAndView verClub = new ModelAndView("club");
		verClub.addObject("usuario", request.getParameter(("usuario")));
		verClub.addObject("club", gC.leerClub(request.getParameter(("club"))));
		verClub.addObject("pertenece", gC.pertenece(request.getParameter(("usuario")), request.getParameter(("club"))));
		return verClub;
	}
	
	@RequestMapping(value = "/solicitarAccesoClub", method = RequestMethod.POST)
	public ModelAndView solicitarAccesoClub(HttpServletRequest request, HttpServletResponse response) {
		GestionAcceso gA = new GestionAcceso();
		SolicitudAcceso sA = new SolicitudAcceso(request.getParameter("usuario"), request.getParameter("club"));
		gA.insertarAcceso(sA);
		
		GestionClubes gC = new GestionClubes();
		ModelAndView verClub = new ModelAndView("club");
		verClub.addObject("usuario", request.getParameter(("usuario")));
		verClub.addObject("club", gC.leerClub(request.getParameter(("club"))));
		verClub.addObject("pertenece", gC.pertenece(request.getParameter(("usuario")), request.getParameter(("club"))));
		return verClub;
	}
	
	@RequestMapping(value = "/eliminarMiembro", method = RequestMethod.POST)
	public ModelAndView eliminarMiembro(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClub(request.getParameter("club"));
		club.eliminarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		
		ModelAndView verClub = new ModelAndView("club");
		verClub.addObject("usuario", request.getParameter(("usuario")));
		verClub.addObject("club", gC.leerClub(request.getParameter(("club"))));
		verClub.addObject("pertenece", gC.pertenece(request.getParameter(("usuario")), request.getParameter(("club"))));
		return verClub;
	}
	
	@RequestMapping(value = "/eliminarClub", method = RequestMethod.POST)
	public ModelAndView eliminarClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		gC.eliminarClub(request.getParameter("club"));
		ModelAndView clubes = new ModelAndView("clubes");
		clubes.addObject("usuario", request.getParameter("usuario"));
		gC = new GestionClubes();
		ArrayList<String> lista = gC.leerClubes();
		clubes.addObject("clubes", lista);
		return clubes;
	}
	
}

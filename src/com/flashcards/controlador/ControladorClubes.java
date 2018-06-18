package com.flashcards.controlador;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionAcceso;
import com.flashcards.dao.GestionClubes;
import com.flashcards.dao.GestionInvitaciones;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Club;
import com.flashcards.modelo.Invitacion;
import com.flashcards.modelo.SolicitudAcceso;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorClubes {
	GestionUsuarios gU = new GestionUsuarios();
	String identificador;
	Random r = new Random();
	Club club;
	
	@RequestMapping(value = "/crearClub", method = RequestMethod.POST)
	public void crearClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		do {
			identificador = request.getParameter("usuario")+r.nextInt(2000000)+r.nextInt(2000000);
		}while(gC.existeClubIdentificador(identificador));
		club = new Club(identificador, request.getParameter("nClub"), request.getParameter("usuario"), request.getParameter("descripcionClub"));
		gC.crearClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/clubes.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/verClub", method = RequestMethod.GET)
	public ModelAndView verClub(@RequestParam("usuario") String usuario, @RequestParam("club") String identificador) {
		GestionClubes gC = new GestionClubes();
		ModelAndView verClub = new ModelAndView("club");
		club =  gC.leerClubConIdentificador(identificador);
		verClub.addObject("usuario", gU.leerUsuario(usuario));
		verClub.addObject("club", club);
		verClub.addObject("miembros", gC.leerMiembrosClubJSON(club.getIdentificador()));
		verClub.addObject("pertenece", gC.perteneceWithIdentificador(usuario, identificador));
		return verClub;
	}
	
	@RequestMapping(value = "/incluirMiembro", method = RequestMethod.POST)
	public void incluirMiembro(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.insertarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/invitarPersonaClub", method = RequestMethod.POST)
	public void invitarPersonaClub(HttpServletRequest request, HttpServletResponse response) {
		Invitacion invitacion = new Invitacion(request.getParameter("usuario"), request.getParameter("recibe"), request.getParameter("identificador"));
		GestionInvitaciones gI = new GestionInvitaciones();
		gI.insertarInvitacion(invitacion);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/solicitarAccesoClub", method = RequestMethod.POST)
	public void solicitarAccesoClub(HttpServletRequest request, HttpServletResponse response) {
		GestionAcceso gA = new GestionAcceso();
		SolicitudAcceso sA = new SolicitudAcceso(request.getParameter("usuario"), request.getParameter("identificador"));
		gA.insertarAcceso(sA);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/clubes.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {}
	}
	
	@RequestMapping(value = "/eliminarMiembro", method = RequestMethod.POST)
	public void eliminarMiembro(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.eliminarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/eliminarClub", method = RequestMethod.POST)
	public void eliminarClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		gC.eliminarClub(request.getParameter("identificador"));
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/clubes.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {
			
		}
	}
	
}

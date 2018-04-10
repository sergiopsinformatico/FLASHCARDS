package com.flashcards.controlador;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionPeticiones;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorPersonas {
	@RequestMapping(value = "/peticionAmistad", method = RequestMethod.POST)
	public ModelAndView mPerfil(HttpServletRequest request, HttpServletResponse response) {
		PeticionDeAmistad pA = new PeticionDeAmistad(request.getParameter("usuario"),request.getParameter("peticion"));
		GestionPeticiones gP = new GestionPeticiones();
		gP.crearPeticiones(pA);
		ModelAndView gente = new ModelAndView("personas");
		GestionUsuarios gU = new GestionUsuarios();
		LinkedList<PeticionDeAmistad> lista = gP.leerPeticion(request.getParameter("usuario"));
		LinkedList<String> pendientes = new LinkedList<String>();
		for(int i=0; i<lista.size(); i++) {
			pendientes.add(lista.get(i).getEnvia());
		}
		LinkedList<Usuario> usuarios = gU.leerTodos(request.getParameter("usuario"));
		gente.addObject("usuarios", usuarios);
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("pendientes", pendientes);
		return gente;
	}


	@RequestMapping(value = "/aceptar", method = RequestMethod.POST)
	public ModelAndView aceptar(HttpServletRequest request, HttpServletResponse response) {
		PeticionDeAmistad pA = new PeticionDeAmistad(request.getParameter("usuario"),request.getParameter("peticion"));
		GestionPeticiones gP = new GestionPeticiones();
		gP.eliminarPeticion(pA);
		ModelAndView gente = new ModelAndView("personas");
		/*ACEPTAR AMISTAD
		gP.crearPeticiones(pA);
		GestionUsuarios gU = new GestionUsuarios();
		LinkedList<PeticionDeAmistad> lista = gP.leerPeticion(request.getParameter("usuario"));
		LinkedList<String> pendientes = new LinkedList<String>();
		for(int i=0; i<lista.size(); i++) {
			pendientes.add(lista.get(i).getEnvia());
		}
		LinkedList<Usuario> usuarios = gU.leerTodos(request.getParameter("usuario"));
		gente.addObject("usuarios", usuarios);
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("pendientes", pendientes);*/
		return gente;
	}
	
	
	@RequestMapping(value = "/rechazar", method = RequestMethod.POST)
	public ModelAndView rechazar(HttpServletRequest request, HttpServletResponse response) {
		PeticionDeAmistad pA = new PeticionDeAmistad(request.getParameter("usuario"),request.getParameter("peticion"));
		GestionPeticiones gP = new GestionPeticiones();
		gP.eliminarPeticion(pA);
		ModelAndView gente = new ModelAndView("personas");
		/*RECHAZAR AMISTAD
		gP.crearPeticiones(pA);
		GestionUsuarios gU = new GestionUsuarios();
		LinkedList<PeticionDeAmistad> lista = gP.leerPeticion(request.getParameter("usuario"));
		LinkedList<String> pendientes = new LinkedList<String>();
		for(int i=0; i<lista.size(); i++) {
			pendientes.add(lista.get(i).getEnvia());
		}
		LinkedList<Usuario> usuarios = gU.leerTodos(request.getParameter("usuario"));
		gente.addObject("usuarios", usuarios);
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("pendientes", pendientes);*/
		return gente;
	}
}

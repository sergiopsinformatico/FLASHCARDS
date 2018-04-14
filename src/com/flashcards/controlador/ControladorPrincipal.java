package com.flashcards.controlador;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionClubes;
import com.flashcards.dao.GestionPeticiones;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorPrincipal {
	
	@RequestMapping(value = "/miPerfil", method = RequestMethod.POST)
	public ModelAndView perfil(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		return new ModelAndView("miperfil", "usuario", user);
	}
	
	@RequestMapping(value = "/modificar", method = RequestMethod.POST)
	public ModelAndView modificar(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		return new ModelAndView("modificarPerfil", "usuario", user);
	}
	
	@RequestMapping(value = "/gente", method = RequestMethod.POST)
	public ModelAndView gente(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		GestionPeticiones gP = new GestionPeticiones();
		LinkedList<PeticionDeAmistad> lista = gP.leerPeticion(request.getParameter("usuario"));
		LinkedList<String> pendientes = new LinkedList<String>();
		for(int i=0; i<lista.size(); i++) {
			pendientes.add(lista.get(i).getEnvia());
		}
		LinkedList<Usuario> usuarios = gU.leerTodos(request.getParameter("usuario"));
		ModelAndView persona = new ModelAndView("personas");
		persona.addObject("usuarios", usuarios);
		persona.addObject("usuario", request.getParameter("usuario"));
		persona.addObject("pendientes", pendientes);
		return persona;
	}
	
	@RequestMapping(value = "/clubes", method = RequestMethod.POST)
	public ModelAndView clubes(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView clubes = new ModelAndView("clubes");
		clubes.addObject("usuario", request.getParameter("usuario"));
		GestionClubes gC = new GestionClubes();
		clubes.addObject("clubes", gC.leerClubes());
		return clubes;
	}
}

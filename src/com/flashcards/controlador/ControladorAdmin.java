package com.flashcards.controlador;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorAdmin {
	@RequestMapping(value = "/gestionar", method = RequestMethod.POST)
	public ModelAndView gestionar(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		LinkedList<Usuario>usuarios = gU.todosUsuarios(request.getParameter("admin"));
		ModelAndView vista = new ModelAndView("administrador");
		vista.addObject("usuarios", usuarios);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
	@RequestMapping(value = "/adminEliminaCuenta", method = RequestMethod.POST)
	public ModelAndView adminEliminaCuenta(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		gU.eliminaCuenta(request.getParameter("usuario"));
		gU = new GestionUsuarios();
		LinkedList<Usuario>usuarios = gU.gente(request.getParameter("admin"));
		ModelAndView vista = new ModelAndView("administrador");
		vista.addObject("usuarios", usuarios);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
	@RequestMapping(value = "/adminCambiaRol", method = RequestMethod.POST)
	public ModelAndView adminCambiaRol(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario usuario = gU.leerUsuario(request.getParameter("usuario"));
		switch(request.getParameter("rol")) {
			case "usuario":
				usuario.setUsuario(true);
				usuario.setModerador(false);
				usuario.setAdministrador(false);
				break;
			case "moderador":
				usuario.setUsuario(false);
				usuario.setModerador(true);
				usuario.setAdministrador(false);
				break;
			case "administrador":
				usuario.setUsuario(false);
				usuario.setModerador(false);
				usuario.setAdministrador(true);
				break;
			default:
				break;
		}
		gU.modificarUsuario(usuario);
		gU = new GestionUsuarios();
		LinkedList<Usuario>usuarios = gU.gente(request.getParameter("admin"));
		ModelAndView vista = new ModelAndView("administrador");
		vista.addObject("usuarios", usuarios);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
}

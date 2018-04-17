package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorInicial {
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}
	
	@RequestMapping(value = "/loguear", method = RequestMethod.POST)
	public ModelAndView loguear(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		if(gU.login(request.getParameter("usuario"), request.getParameter("clave"))){
			Usuario user = gU.leerUsuario(request.getParameter("usuario"));
			ModelAndView vista = new ModelAndView("principal");
			vista.addObject("nUsuario", request.getParameter("usuario"));
			vista.addObject("administrador", user.isAdministrador());
			vista.addObject("usuario", user);
			return vista;
		}else {
			return new ModelAndView("index", "mensaje", "El usuario y/o la contraseña son incorrectos.");
		}
	}
	@RequestMapping(value = "/principal", method = RequestMethod.POST)
	public ModelAndView principal(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
}

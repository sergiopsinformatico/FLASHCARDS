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
	
}

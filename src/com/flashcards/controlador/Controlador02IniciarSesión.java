package com.flashcards.controlador;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionEliminados;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.UsuarioDTO;

@Controller
public class Controlador02IniciarSesión {

	//Variables Globales
	
	GestionUsuarios gU;
	GestionEliminados gE;
	UsuarioDTO user;
	ModelAndView vista;
	
	//Controladores
	
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.POST)
	public ModelAndView loguear(HttpServletRequest request, HttpServletResponse response) {
		
		gU = new GestionUsuarios();
		gE = new GestionEliminados();
		
		gU.eliminarCuentas();
		if(gU.login(request.getParameter("inputUsuario"), request.getParameter("inputClave"))){
			user = gU.leerUsuario(request.getParameter("inputUsuario"));
			vista = new ModelAndView("principal");
			vista.addObject("usuario", user);
			request.getSession().setAttribute("usuario", user);
			if(gE.isUsuario(user.getEmail())) {
				gE.borrarEliminado(user.getEmail());
			}
			try {
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+user.getUsuario());
			} catch (IOException e) {
				return vista;
			}
		}else {
			vista = new ModelAndView("index");
			request.getSession().removeAttribute("usuario");
			request.getSession().setAttribute("usuario", null);
			vista.addObject("mensaje", "El usuario y/o la contraseña son incorrectos.");
		}
		return vista;
	}
	
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.GET)
	public ModelAndView iniciarSesionGet(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("principal");
		return vista;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
		public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
	
}
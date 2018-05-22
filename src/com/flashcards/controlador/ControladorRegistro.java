package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.auxiliares.Email;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorRegistro {
	//Variables
	Email email = new Email();
	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}
	
	@RequestMapping(value = "/registro", method = RequestMethod.POST)
	public ModelAndView registre(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public ModelAndView crear(HttpServletRequest request, HttpServletResponse response) {
		Usuario user = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombreApellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), true, false, false);
		ModelAndView vista;
		GestionUsuarios gU = new GestionUsuarios();
		
		if(gU.existeUsername(user.getUsuario())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "El nombre de usuario ya existe. Use otro.");
			user.setUsuario("");
			vista.addObject("usuario", user);
			return vista;
		}else {
			if(!user.hayMayuscula() || !user.hayMinuscula() || !user.hayNumero() || !user.longitudCorrecta()) {
				vista = new ModelAndView("registro");
				vista.addObject("mensaje", "La clave no cumple con los requisitos indicados.");
				user.setClave("");
				vista.addObject("usuario", user);
				return vista;
			}else {
				if(gU.existeEmail(user.getEmail())) {
					vista = new ModelAndView("registro");
					vista.addObject("mensaje", "El email con el que se desea registrarse, ya existe.");
					user.setEmail("");
					vista.addObject("usuario", user);
					return vista;
				}
				else {
					if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
						vista = new ModelAndView("registro");
						vista.addObject("mensaje", "Los campos clave y repite clave no coinciden.");
						user.setClave("");
						vista.addObject("usuario", user);
						return vista;
					}else {
						gU.registrarUsuario(user);
						email.crearCuenta(user);
						vista = new ModelAndView("index");
						vista.addObject("mensaje", "Registro Correcto");
						return vista;
					}
				}
			}
		}
	}
	
}
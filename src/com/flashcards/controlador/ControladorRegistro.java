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
public class ControladorRegistro {
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		Usuario user = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombre"), request.getParameter("apellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), true, false, false);
		
		GestionUsuarios gU = new GestionUsuarios();
		
		if(gU.registrarUsuario(user)) {
			return new ModelAndView("index");
		}else {
			return new ModelAndView("registro");
		}
	}
	
}
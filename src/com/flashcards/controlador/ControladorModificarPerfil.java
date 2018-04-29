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
public class ControladorModificarPerfil {
	
	@RequestMapping(value = "/mPerfil", method = RequestMethod.POST)
	public ModelAndView mPerfil(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user2 = gU.leerUsuario(request.getParameter("usuarioAntiguo"));
		Usuario user = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombre"), request.getParameter("apellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), user2.isUsuario(), user2.isModerador(), user2.isAdministrador());
		ModelAndView vista;
		if(gU.eliminaCuenta(user2.getUsuario()) && gU.registrarUsuario(user)) {
			vista = new ModelAndView("principal");
			vista.addObject("nUsuario", user.getUsuario());
			vista.addObject("administrador", user.isAdministrador());
			vista.addObject("usuario", user);
			return vista;
		}else {
			vista = new ModelAndView("index");
			return vista;
		}
	}
}

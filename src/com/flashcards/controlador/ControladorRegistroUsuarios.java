package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.modelo.UsuarioDTO;

@Controller
public class ControladorRegistroUsuarios {

	//Declaracion de Variables
	GestorUsuarios gU;
	UsuarioDTO user;
	ModelAndView vista;
	String mensaje;
		
	//Controladores
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
		gU = new GestorUsuarios();
		user = new UsuarioDTO(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombreApellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), "", true, false, false);
		if(user.getGenero().equalsIgnoreCase("hombre")){
			user.setPhoto("resources/img/profileHombre.jpg");
		}else {
			user.setPhoto("resources/img/profileMujer.jpg");
		}
		
		
		mensaje = "";
		if(user.getUsuario().contains(" ")) {
			mensaje = mensaje+"- El nombre de usuario contiene espacios.\n";
		}
		if(!(user.cumpleNombreUsuario())) {
			mensaje = mensaje+"- El nombre de usuario solo puede contener minusculas, mayusculas o numeros.\n";
		}
		if(!(mensaje.equalsIgnoreCase(""))) {
			vista = new ModelAndView("registro");
			mensaje = "Error. El nombre de usuario no cumple con los requisitos:\n"+mensaje;
			vista.addObject("mensaje", mensaje);
			user.setUsuario("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(user.getUsuario().equals("sergio123") || gU.existeUsername(user.getUsuario())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "Error. El nombre de usuario ya existe.");
			user.setUsuario("");
			vista.addObject("usuario", user);
			return vista;
		}
		
		if(user.getEmail().contains(" ")) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "Error. El email no debe contener espacios.");
			user.setEmail("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(user.getEmail().equals("sergio13_yo@hotmail.com") || gU.existeEmail(user.getEmail())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "Error. El email con el que se desea registrarse, ya existe.");
			user.setEmail("");
			vista.addObject("usuario", user);
			return vista;
		}
		
		mensaje = "";
		if(user.getClave().contains(" ")) {
			mensaje = mensaje+"- La clave no debe contener espacios.\n";
		}
		if(user.correctaLongitudClave()) {
			mensaje = mensaje+"- La longitud de la clave no es correcta.\n";
		}
		if(user.hayMayusculaEnClave()) {
			mensaje = mensaje+"- La clave debe contener al menos una letra mayúscula.\n";
		}
		if(user.hayMinusculaEnClave()) {
			mensaje = mensaje+"- La clave debe contener al menos una letra minúscula.\n";
		}
		if (user.hayNumeroEnClave()) {
			mensaje = mensaje+"- La clave debe contener al menos un número.\n";
		}
		if(!(mensaje.equalsIgnoreCase(""))) {
			mensaje = "La clave no cumple los siguientes requisitos:\n" + mensaje;
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}else {
			if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
				vista = new ModelAndView("registro");
				vista.addObject("mensaje", "Error. Los campos clave y repite clave no coinciden.");
				user.setClave("");
				vista.addObject("usuario", user);
				return vista;
			}else {
				gU.registrarUsuario(user);
				vista = new ModelAndView("index");
				vista.addObject("mensaje", "Registro Correcto");
				return vista;
			}
		}
	}	
	
}

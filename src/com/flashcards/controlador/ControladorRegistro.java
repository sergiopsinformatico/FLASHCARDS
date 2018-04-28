package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Email;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorRegistro {
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		Usuario user = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombre"), request.getParameter("apellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), true, false, false);
		ModelAndView vista;
		Email email;
		GestionUsuarios gU = new GestionUsuarios();
		
		if(gU.existeUsername(user.getUsuario())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "El nombre de usuario ya existe. Use otro.");
			vista.addObject("usuario", user);
			return vista;
		}else {
			if(!user.hayMayuscula() || !user.hayMinuscula() || !user.hayNumero() || !user.longitudCorrecta()) {
				vista = new ModelAndView("registro");
				vista.addObject("mensaje", "La clave no cumple con los requisitos indicados.");
				vista.addObject("usuario", user);
				return vista;
			}else {
				if(gU.existeEmail(user.getEmail())) {
					vista = new ModelAndView("registro");
					vista.addObject("mensaje", "El email con el que se desea registrarse, ya existe.");
					vista.addObject("usuario", user);
					return vista;
				}
				else {
					if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
						vista = new ModelAndView("registro");
						vista.addObject("mensaje", "Los campos clave y repite clave no coinciden.");
						vista.addObject("usuario", user);
						return vista;
					}else {
						gU.registrarUsuario(user);
						String asunto = "[Sistema Flashcards] Creación de la cuenta "+user.getEmail();
						String mensaje = "Hola "+user.getNombre()+"!!"+
								"\nSe ha creado correctamente una cuenta en Flashcards:"+
								"\nUsuario: "+user.getEmail()+" o "+user.getUsuario()+
								"\nClave: "+user.getClave()+
								"\nAtentamente, Equipo de Gestión de Sistema Flashcards.";
						email = new Email(user.getEmail(), asunto, mensaje);
						email.enviarMensaje();
						vista = new ModelAndView("index");
						vista.addObject("mensaje", "Registro Correcto");
						return vista;
					}
				}
			}
		}
	}
	
}
package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.auxiliares.Email;
import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.modelo.UsuarioDTO;

@Controller
public class ControladorRecuperarCredenciales {
	
	//Declaracion de Variables
	GestorUsuarios gU;
	UsuarioDTO user;
	ModelAndView vista;
	
	//Controlador
	@RequestMapping(value = "/recovery", method = RequestMethod.POST)
	public ModelAndView recoveryPass(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("recoveryPassword");
	}

	@RequestMapping(value = "/recovery", method = RequestMethod.GET)
	public ModelAndView recovery(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("recoveryPassword");
	}

	@RequestMapping(value = "/recuperar", method = RequestMethod.POST)
	public ModelAndView recuperar(HttpServletRequest request, HttpServletResponse response) {
		gU = new GestorUsuarios();
		Email email = new Email();
		gU.eliminarCuentas();
		user = gU.leerUsuario(request.getParameter("usuario"));
		if(user!=null) {
			if(email.recuperarClave(user)) {
				vista = new ModelAndView("index");
				vista.addObject("mensaje", "Se ha enviado un email a "+user.getEmail()+" con los datos de acceso.");
			}else {
				vista = new ModelAndView("recoveryPassword");
				vista.addObject("mensaje", "Ha habido un problema al enviar el email. Por favor, vuelva a intentarlo.");
			}
		}else {
			vista = new ModelAndView("recoveryPassword");
			vista.addObject("mensaje", "El nombre de usuario o email introducido, no existe en el sistema.");
		}
		return vista;
	}
}
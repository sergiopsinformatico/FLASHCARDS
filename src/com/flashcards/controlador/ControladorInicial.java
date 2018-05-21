package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.auxiliares.Email;
import com.flashcards.dao.GestionEliminados;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorInicial {
	//Variables
	GestionUsuarios gU = new GestionUsuarios();
	Email email = new Email();
	Usuario user;
	ModelAndView vista;
	
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.POST)
	public ModelAndView loguear(HttpServletRequest request, HttpServletResponse response) {
		gU.eliminarCuentas();
		if(gU.login(request.getParameter("inputUsuario"), request.getParameter("inputClave"))){
			user = gU.leerUsuario(request.getParameter("inputUsuario"));
			GestionEliminados gE = new GestionEliminados();
			vista = new ModelAndView("principal");
			request.getSession().removeAttribute("usuario");
			request.getSession().setAttribute("usuario", user);
			if(gE.isUsuario(user.getEmail())) {
				gE.borrarEliminado(user.getEmail());
				email.reactivacionCuenta(user);
			}
		}else {
			vista = new ModelAndView("index");
			request.getSession().removeAttribute("usuario");
			request.getSession().setAttribute("usuario", null);
			vista.addObject("mensaje", "El usuario y/o la contraseña son incorrectos.");
		}
		return vista;
	}
	
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView inicio(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("principal");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
	
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

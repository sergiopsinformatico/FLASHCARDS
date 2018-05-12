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
	
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.POST)
	public ModelAndView loguear(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		gU.eliminarCuentas();
		ModelAndView vista;
		if(gU.login(request.getParameter("usuario"), request.getParameter("clave"))){
			Usuario user = gU.leerUsuario(request.getParameter("usuario"));
			GestionEliminados gE = new GestionEliminados();
			vista = new ModelAndView("principal");
			request.getSession().removeAttribute("usuario");
			request.getSession().setAttribute("usuario", user);
			if(gE.isUsuario(user.getEmail())) {
				gE.borrarEliminado(user.getEmail());
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
		ModelAndView recuperada;
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		if(user!=null) {
			String asunto = "[Sistema Flashcards] Recuperación de la cuenta "+user.getEmail();
			String mensaje = "Hola "+user.getNombre()+"!!"+
			"\nHa solicitado recuperación de sus datos de su cuenta en Flashcards:"+
			"\nUsuario: "+user.getEmail()+" o "+user.getUsuario()+
			"\nClave: "+user.getClave()+
			"\nAtentamente, Equipo de Gestión de Sistema Flashcards.";
			Email email = new Email(user.getEmail(), asunto, mensaje);
			if(email.enviarMensaje()) {
				recuperada = new ModelAndView("index");
				recuperada.addObject("mensaje", "Se ha enviado un email a "+user.getEmail()+" con los datos de acceso.");
			}else {
				recuperada = new ModelAndView("recoveryPassword");
				recuperada.addObject("mensaje", "Ha habido un problema al enviar el email. Por favor, vuelva a intentarlo.");
			}
		}else {
			recuperada = new ModelAndView("recoveryPassword");
			recuperada.addObject("mensaje", "El nombre de usuario o email introducido, no existe en el sistema.");
		}
		return recuperada;
	}
}

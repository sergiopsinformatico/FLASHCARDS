package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador02ControlSesion {

	//Variables Globales
	Broker broker;
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user;
	ModelAndView vista;
	
	//Devuelve la vista para Iniciar Sesion
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.GET)
	public ModelAndView iniciarSesionGet(HttpServletRequest request, HttpServletResponse response) {
	//public ModelAndView iniciarSesionGet(@ModelAttribute("usuario") UsuarioDTO userRegister, HttpServletRequest request, HttpServletResponse response) {
		if(request.getAttribute("usuario")==null || ((UsuarioDTO)(request.getAttribute("usuario"))).getUsername()==null||((UsuarioDTO)(request.getAttribute("usuario"))).getUsername()=="") {
			return new ModelAndView("vistaIniciarSesion");
		}else {
			return new ModelAndView("redirect:/principal.html");
		}
	}
	
	//Iniciar Sesion	
	@RequestMapping(value = "/loguear", method = RequestMethod.POST)
	public ModelAndView loguearPost(HttpServletRequest request, HttpServletResponse response) {
		dBUsuario = Broker.getInstanciaUsuario();
		if(dBUsuario.login(request.getParameter("inputUsernameEmail"), request.getParameter("inputClave"))) {
			user = dBUsuario.getUsuarioDTO(request.getParameter("inputUsernameEmail"));
			vista = new ModelAndView("redirect:/principal.html");
			vista.addObject("usuario", user);
		}else {
			vista = new ModelAndView("vistaIniciarSesion");
			vista.addObject("mensaje", "El usuario y/o la contraseña son incorrectos.");
		}
		return vista;
	}
	
	@RequestMapping(value = "/principal", method = RequestMethod.GET)
	public ModelAndView modificar(HttpServletRequest request, HttpServletResponse response) {
	//public ModelAndView modificar(@ModelAttribute("usuario") UsuarioDTO userRegister, HttpServletRequest request, HttpServletResponse response) {
		if(request.getAttribute("usuario")==null || ((UsuarioDTO)(request.getAttribute("usuario"))).getUsername()==null||((UsuarioDTO)(request.getAttribute("usuario"))).getUsername()=="") {
			return new ModelAndView("index");
		}else {
			return new ModelAndView("vistaPrincipal");
		}
	}

}